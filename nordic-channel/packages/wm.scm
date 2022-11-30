(define-module (nordic-channel packages suckless)
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
          (url "https://github.com/SMproductive/nordic-dwm")
          (commit "e379197418a1a061637cf9b4ba46fe8ac826320a")))
        (sha256
          (base32 "0230ml2iavnijrkngvwi56kizqzk9p2mkzvalk9n9x4f6ki7xmjl"))))
    (home-page "https://github.com/SMproductive/nordic-dwl")
    (synopsis "Nordic themed dwl")))
