(define-module (nordic-channel packages wm)
  #:use-module (gnu packages wm)
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





(define-public dwl
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
         (delete 'configure))))         ; no configure
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
