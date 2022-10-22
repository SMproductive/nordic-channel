(define-module (nordic-channel packages suckless)
  #:use-module (gnu packages suckless)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (nordic-channel packages))

(define-public nordic-dwm
  (package
    (inherit dwm)
    (name "nordic-dwm")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwm")
          (commit "00a70b548bd8872949028f01972ae00990723fd8")))
        (sha256
          (base32 "12mww15cwwfvz2i2jldr92a1r53qj450f2kkh6yja829qascin8y"))))
    (home-page "https://github.com/SMproductive/nordic-dwm")
    (synopsis "Nordic themed dwm")))

(define-public nordic-st
  (package
    (inherit st)
    (name "nordic-st")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-st")
          (commit "fac1a497ba1c539c7dda8e23623ad28775137b17")))
        (sha256
          (base32 "0iz6074m1104hbxd701wfr8npnrna3r499y0g7zmripbpi3nijs0"))))
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
          (commit "8b7c93fe3146a98a27dc61cd9abdba8e183c9181")))
        (sha256
          (base32 "0svwq3y081vv2sl60v1304rkpx3phkm9ar157dvgp1jm4lvy0qq6"))))
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

