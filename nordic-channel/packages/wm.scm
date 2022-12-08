(define-module (nordic-channel packages wm)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

;; (define-public nordic-dwl
;;   (package
;;     (inherit dwl)
;;     (name "nordic-dwl")
;;     (version "0.3")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;           (url "https://github.com/SMproductive/nordic-dwl")
;;           (commit "09e611b1edb7a39f5eafcca250b9d82a01a69515")))
;;         (sha256
;;           (base32 "1bi8vk81nbmgbh379dcgybx1fv22jriybp6lnq58vxz3ijbbgdfz"))))
;;     (home-page "https://github.com/SMproductive/nordic-dwl")
;;     (synopsis "Nordic themed dwl")))





(define-public nordic-dwl
  (package
    (name "nordic-dwl")
    (version "0.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwl")
          (commit "09e611b1edb7a39f5eafcca250b9d82a01a69515")))
        (sha256
          (base32 "1bi8vk81nbmgbh379dcgybx1fv22jriybp6lnq58vxz3ijbbgdfz"))))

   (build-system gnu-build-system)
    (arguments
     `(#:tests? #f                      ; no tests
       #:make-flags
       (list
        (string-append "CC=" ,(cc-for-target))
        (string-append "PREFIX=" (assoc-ref %outputs "out")))
       #:phases

       (modify-phases %standard-phases
         (replace 'configure
           (lambda _
             (substitute* "Makefile" (("\\$\\{CC\\}") "gcc"))
             #t))
        (replace 'install
          (lambda* (#:key outputs #:allow-other-keys)
            (let ((out (assoc-ref outputs "out")))
              (invoke "make" "install"
                      (string-append "DESTDIR=" out) "PREFIX="))))
        (add-after 'build 'install-xsession
          (lambda* (#:key outputs #:allow-other-keys)
            ;; Add a .desktop file to xsessions.
            (let* ((output (assoc-ref outputs "out"))
                   (xsessions (string-append output "/share/xsessions")))
              (mkdir-p xsessions)
              (with-output-to-file
                  (string-append xsessions "/dwl.desktop")
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


       ;; (modify-phases %standard-phases
       ;;   (delete 'configure))))         ; no configure
    (native-inputs
     (list wayland-protocols
           pkg-config))
    (inputs
     (list wayland
           wlroots))
    (home-page "https://github.com/djpohly/dwl")
    (synopsis "Dynamic window manager for Wayland with nordic theme")
    (description
     "@command{dwl} is a compact, hackable compositor for Wayland based on
wlroots.  It is intended to fill the same space in the Wayland world that dwm
does in X11, primarily in terms of philosophy, and secondarily in terms of
functionality.  Like dwm, dwl is easy to understand and hack on, due to a
limited size and a few external dependencies.  It is configurable via
@file{config.h}.")
    ;;             LICENSE       LICENSE.dwm   LICENSE.tinywl
    (license (list license:gpl3+ license:expat license:cc0))))
