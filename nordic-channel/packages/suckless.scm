(define-module (nordic-channel packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (nordic-channel packages))

(define-public nordic-dwm
  (package
    (inherit dwm)
    (name "nordic-dwm")
    (version "6.4")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwm")
          (commit "94fb6860f525e85f19ca0e34ae1cd32c8f13f8cb")))
        (sha256
          (base32 "1ax51f1q156n6akzbg3k2i208m7yv6m3wb3fswaaiv23hh65kipi"))))
    (home-page "https://github.com/SMproductive/nordic-dwm")
    (synopsis "Nordic themed dwm")))

(define-public nordic-st
  (package
    (inherit st)
    (name "nordic-st")
    (version "0.9")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-st")
          (commit "264bdb661cc3d9e50672028d853d7ac90b88ea6a")))
        (sha256
          (base32 "1lm29550igaik47yg51w6wzm2hhyf324gfm015x817ijzrq6c60x"))))
    (home-page "https://github.com/SMproductive/nordic-st")
    (synopsis "Nordic themed st")))

(define-public nordic-slstatus
  (package
    (inherit slstatus)
    (name "nordic-slstatus")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-slstatus")
          (commit "628ec11f91894b8f1d0ff47bf140414aaf13888f")))
        (sha256
          (base32 "1kjlk7920d3pdcbp3drq3n25fs0fwa96pp0d47wl0v7k91lp06mx"))))
    (home-page "https://github.com/SMproductive/nordic-slstatus")
    (synopsis "Simple slstatus for nordic themed dwm")))

(define-public nordic-surf
  (package
    (inherit surf)
    (name "nordic-surf")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-surf")
          (commit "affb7d83ae6844f0366cdf7c48f46f4dcb6c6a31")))
        (sha256
          (base32 "02gn99nqr165n6b7fdd3r4xkxspgbb8s80l8vpqml53ks296kax1"))))
    (home-page "https://github.com/SMproductive/nordic-surf")
    (synopsis "Nordic themed surf")))

