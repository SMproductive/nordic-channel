(define-module (nordic-channel packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages))

(define-public nordic-dwm
  (package
    (inherit dwm)
    (name "nordic-dwm")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwm")
          (commit "")))
        (sha256
          (base32 ""))))
    (home-page "https://github.com/SMproductive/nordic-dwm")
    (synopsis "Nordic themed dwm")))
