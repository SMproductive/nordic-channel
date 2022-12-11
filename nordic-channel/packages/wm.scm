(define-module (nordic-channel packages wm)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages base)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

(define-public nordic-dwl
  (package
   (name "nordic-dwl")
   (version "0.2.1")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/SMproductive/nordic-dwl.git")
                  (commit "62510eaf58887042dcfef571422c853ce867a2e1")))
            (file-name (git-file-name name version))
            (sha256
             (base32 "0h6cnhd6z8y3djyzjk0x4p5y00rkv8v03nqvj9l3f17pr85nak7x"))))
   (build-system gnu-build-system)
   (arguments
    `(#:tests? #f                      ; no tests
      #:make-flags
      (list
       (string-append "CC=" ,(cc-for-target))
       (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure)         ; no configure
                     (add-after 'build 'install-xsession
                                (lambda* (#:key outputs #:allow-other-keys)
                                  ;; Add a .desktop file to xsessions.
                                  (let* ((output (assoc-ref outputs "out"))
                                         (xsessions (string-append output "/share/wayland-sessions")))
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
   (native-inputs
    (list pkg-config))
   (inputs
    (list wlroots))
   (propagated-inputs
    (list xorg-server-xwayland))
   (home-page "https://github.com/SMproductive/nordic-dwl")
   (synopsis "Dynamic window manager for Wayland with nordic theme")
   (description
    "@command{dwl} is a compact, hackable compositor for Wayland based on
wlroots.  It is intended to fill the same space in the Wayland world that dwl
does in X11, primarily in terms of philosophy, and secondarily in terms of
functionality.  Like dwl, dwl is easy to understand and hack on, due to a
limited size and a few external dependencies.  It is configurable via
@file{config.h}.")
   ;;             LICENSE       LICENSE.dwl   LICENSE.tinywl
   (license (list license:gpl3+ license:expat license:cc0))))






(define-public dwl-bar
  (package
   (name "dwl-bar")
   (version "0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/SMproductive/dwl-bar.git")
                  (commit "55663ebf800bc56a02b6aaf5e1f08663bf2430be")))
            (file-name (git-file-name name version))
            (sha256
             (base32 "1m6adyw55wqf3xngprl0lzc07y7r9pasqsrfmq0bz3c3ab1v26ah"))))
   (build-system glib-or-gtk-build-system)
   (arguments
    `(#:tests? #f                      ; no tests
      #:make-flags
      (list
       (string-append "CC=" ,(cc-for-target))
       (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure))))
   (native-inputs
    (list pkg-config
          `(,glib "bin")
          gobject-introspection))
   (propagated-inputs
    (list gtk
          glib
          harfbuzz
          cairo
          pango-1.90))
   (home-page "https://github.com/SMproductive/nordic-dwl")
   (synopsis "Bar for dwl")
   (description "Is like the usual dwm bar made with gtk.")
   (license license:gpl3+)))
