(define-module (nordic-channel packages wm)
  #:use-module (gnu packages wm)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (nordic-channel packages))

(define-public nordic-dwm
  (package
    (inherit dwl)
    (name "nordic-dwl")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwl")
          (commit "e379197418a1a061637cf9b4ba46fe8ac826320a")))
        (sha256
          (base32 "0230ml2iavnijrkngvwi56kizqzk9p2mkzvalk9n9x4f6ki7xmjl"))))
    (home-page "https://github.com/SMproductive/nordic-dwl")
    (synopsis "Nordic themed dwl")
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
     (list pkg-config))
    (inputs
     (list wlroots))
    (description
     "@command{dwl} is a compact, hackable compositor for Wayland based on
wlroots.  It is intended to fill the same space in the Wayland world that dwm
does in X11, primarily in terms of philosophy, and secondarily in terms of
functionality.  Like dwm, dwl is easy to understand and hack on, due to a
limited size and a few external dependencies.  It is configurable via
@file{config.h}.")
    ;;             LICENSE       LICENSE.dwm   LICENSE.tinywl
    (license (list license:gpl3+ license:expat license:cc0))))
