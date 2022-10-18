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
