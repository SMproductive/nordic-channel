(define-module (nordic-channel packages suckless)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages suckless)
  #:use-module (guix packages)
  #:use-module (guix git-download))

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
          (commit "10bbcb14f356441d9601f6d8e4ab68578d0aa316")))
        (sha256
          (base32 "0cxag50ysmlhk5g6fzq016fdsmjjgh9fvwvscpin934sx48chwhh"))))
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
          (commit "73f95e3dece7d206f4c2d4280138554f2766df19")))
        (sha256
          (base32 "0xksbl4hydnin13qw107x6gwwnl1iq2p4dkbqf1zlywj9v5g18w9"))))
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

(define-public nordic-scroll
  (package
    (inherit slscroll)
    (name "nordic-scroll")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-scroll")
          (commit "d61683df19ee4e23cb225349b9bad77dcc81f6e4")))
        (sha256
          (base32 "15yh0pfllnpalf4v3crlqns33jh3fqa938pci7bwvdqhhnnilj9x"))))
    (home-page "https://github.com/SMproductive/nordic-scroll")
    (synopsis "Usable scroll")))
