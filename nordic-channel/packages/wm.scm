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

;; TODO desktop file
;; (define-public nordic-dwl
;;   (package
;;     (inherit dwl)
;;     (name "nordic-dwl")
;;     (source
;;       (origin
;;         (method git-fetch)
;;         (uri (git-reference
;;           (url "https://github.com/SMproductive/nordic-dwl.git")
;;           (commit "3756724a882f71767a19abba614dda150d288e26")))
;;         (sha256
;;           (base32 "0ac3s134bha8z5ml0m724hhda69j34gma8fqd1zjraj3y5bs0sfz"))))
;;     (home-page "https://github.com/SMproductive/nordic-dwl")
;;     (synopsis "Nordic themed dwl")))


(define-public nordic-dwl
  (package
   (name "nordic-dwl")
   (version "0.2.1")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/SMproductive/nordic-dwl.git")
                  (commit "3756724a882f71767a19abba614dda150d288e26")))
            (file-name (git-file-name name version))
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
                     (delete 'configure))))         ; no configure
   (native-inputs
    (list pkg-config))
   (inputs
    (list wlroots))
   (home-page "https://github.com/SMproductive/nordic-dwl")
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
