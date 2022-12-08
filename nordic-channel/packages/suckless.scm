(define-module (nordic-channel packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix git-download)
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
          (commit "5cd468d1f7c4007fdc9c3299bfe9b07fc1b534e9")))
        (sha256
          (base32 "05rh7wfa8jvf1ly48v59hh8hnr9jr1884n1m3dqr7xmdnzm8apb3"))))
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
          (base32 "0dpv2hn4h6qxx4cva6wzyrsx9k3igxa3jrav6akb0qczhhy9lcfl"))))
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

