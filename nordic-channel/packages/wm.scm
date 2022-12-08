(define-module (nordic-channel packages wm)
  #:use-module (gnu packages wm)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public nordic-dwl
  (package
    (inherit dwl)
    (name "nordic-dwl")
    (version "0.3")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwl")
          (commit "09e611b1edb7a39f5eafcca250b9d82a01a69515")))
        (sha256
          (base32 "1bi8vk81nbmgbh379dcgybx1fv22jriybp6lnq58vxz3ijbbgdfz"))))
    (home-page "https://github.com/SMproductive/nordic-dwl")
    (synopsis "Nordic themed dwl")))
