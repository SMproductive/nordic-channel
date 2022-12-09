(define-module (nordic-channel packages wm)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nordic-dwl
  (package
    (inherit dwl)
    (name "nordic-dwl")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwl.git")
          (commit "3756724a882f71767a19abba614dda150d288e26")))
        (sha256
          (base32 "0ac3s134bha8z5ml0m724hhda69j34gma8fqd1zjraj3y5bs0sfz"))))
    (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags
       (list
        (string-append "CC=" ,(cc-for-target))
        (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases
       (modify-phases %standard-phases
         (delete 'configure)
        (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
              (invoke "make" "install"
                      (string-append "DESTDIR=" out) "PREFIX="))))
        (add-after 'build 'install-wayland-session
          (lambda* (#:key outputs #:allow-other-keys)
            ;; Add a .desktop file to wayland-sessions.
            (let* ((output (assoc-ref outputs "out"))
                   (wayland-sessions (string-append output "/share/wayland-sessions")))
              (mkdir-p wayland-sessions)
              (with-output-to-file
                  (string-append wayland-sessions "/dwl.desktop")
                (lambda _
                  (format #t
                    "[Desktop Entry]~@
                     Name=dwl~@
                     Comment=Dynamic Window Manager~@
                     Exec=~a/bin/dwl~@
                     TryExec=~@*~a/bin/dwl~@
                     Icon=~@
                     Type=Application~%"
                    output)))
              #t))))))
    (home-page "https://github.com/SMproductive/nordic-dwl")
    (synopsis "Nordic themed dwl")))

