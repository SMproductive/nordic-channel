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
          (commit "91dac1f5fe1a53643eae3e88b399e9b612172693")))
        (sha256
          (base32 "17dldrwf50334sn465nvpak9sbs583h88k8xwsahq90bk18lsl8a"))))
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

