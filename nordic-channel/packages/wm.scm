(define-module (nordic-channel packages wm)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix build-system gnu)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (nordic-channel packages))

;; (define-public nordic-dwl
;;   (package
;;    (inherit dwl)
;;    (name "nordic-dwl")
;;    (version "0.4")
;;    (source
;;     (origin
;;      (method git-fetch)
;;      (uri (git-reference
;;            (url "https://gitlab.com/SMproductive/nordic-dwl")
;;            (commit "d92d29f64a6db5482ccead3fca541b795660fd7c")))
;;      (sha256
;;       (base32 "1k8r4y0vyg7vvk1slv73ip8zvk7kyiszm956kbjxfkp2ya5k6909"))))

;;    (propagated-inputs (list
;;                        pipewire
;;                        bemenu
;;                        brightnessctl
;;                        font-gnu-freefont
;;                        font-jetbrains-mono
;;                        font-awesome))
;;    (synopsis "Nordic themed dwm")))




(define-public nordic-dwl
  (package
   (name "nordic-dwl")
   (version "0.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/SMproductive/nordic-dwl")
           (commit "d92d29f64a6db5482ccead3fca541b795660fd7c")))
     (sha256
      (base32 "1k8r4y0vyg7vvk1slv73ip8zvk7kyiszm956kbjxfkp2ya5k6909"))))
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
                     Comment=Dynamic Window Manager for Wayland~@
                     Exec=~a/bin/dwl~@
                     TryExec=~@*~a/bin/dwl~@
                     Icon=~@
                     Type=Application~%"
                                                             output)))
                                                 #t))))))
   (native-inputs
    (list pkg-config))
   (propagated-inputs (list
                       pipewire
                       bemenu
                       brightnessctl
                       font-gnu-freefont
                       font-jetbrains-mono
                       font-awesome))
   (inputs
    (list wlroots))
   (home-page "https://github.com/djpohly/dwl")
   (synopsis "Dynamic window manager for Wayland")
   (description
    "@command{dwl} is a compact, hackable compositor for Wayland based on
wlroots.  It is intended to fill the same space in the Wayland world that dwm
does in X11, primarily in terms of philosophy, and secondarily in terms of
functionality.  Like dwm, dwl is easy to understand and hack on, due to a
limited size and a few external dependencies.  It is configurable via
@file{config.h}.")
   ;;             LICENSE       LICENSE.dwm   LICENSE.tinywl
   (license (list license:gpl3+ license:expat license:cc0))))
