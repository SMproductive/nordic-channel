(define-module (nordic-channel packages suckless)
  #:use-module (gnu packages fonts)
  #:use-module (gnu packages linux)
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
          (url "https://gitlab.com/SMproductive/nordic-dwm")
          (commit "f3923c8014077bfe968f8783fbb6c47516cfa4b2")))
        (sha256
          (base32 "0x4xl392fp8y9j1vwg9gjlgmmmq47gz822b1qw4xczzjjgrqs6yd"))))
    (propagated-inputs (list
                        alsa-utils
                        brightnessctl
                        font-gnu-freefont
                        font-jetbrains-mono
                        font-awesome))
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
          (url "https://gitlab.com/SMproductive/nordic-st")
          (commit "73f95e3dece7d206f4c2d4280138554f2766df19")))
        (sha256
          (base32 "0xksbl4hydnin13qw107x6gwwnl1iq2p4dkbqf1zlywj9v5g18w9"))))
	(propagated-inputs (list nordic-scroll))
    (synopsis "Nordic themed st")))

(define-public nordic-slstatus
  (package
    (inherit slstatus)
    (name "nordic-slstatus")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://gitlab.com/SMproductive/nordic-slstatus")
          (commit "628ec11f91894b8f1d0ff47bf140414aaf13888f")))
        (sha256
          (base32 "1kjlk7920d3pdcbp3drq3n25fs0fwa96pp0d47wl0v7k91lp06mx"))))
    (synopsis "Simple slstatus for nordic themed dwm")))

(define-public nordic-scroll
  (package
    (inherit slscroll)
    (name "nordic-scroll")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://gitlab.com/SMproductive/nordic-scroll")
          (commit "77065aab2c41ae7fadc65d1fbf38076dd1b4a09d")))
        (sha256
          (base32 "16w3v8zwrdksvl4vnknywa27rqbr3kw3aqls7xi2rqddkrm09017"))))
    (synopsis "Usable scroll")))

(define-public nordic-slock
  (package
    (inherit slock)
    (name "nordic-slock")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://gitlab.com/SMproductive/nordic-slock")
          (commit "97f7b44381a9425b7bc7465a6b5369d098c96752")))
        (sha256
          (base32 "1jgbwbhjp0fs42yhlpihcj0kgc5pn8p68k59iqnxaf1ysj3n9mr3"))))
    (synopsis "Nordic themed slock")))

