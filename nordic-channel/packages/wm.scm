(define-module (nordic-channel packages wm)
   #:use-module (gnu packages fonts)
 #:use-module (gnu packages linux)
 #:use-module (gnu packages wm)
 #:use-module (gnu packages xdisorg)
 #:use-module (guix git-download)
 #:use-module (guix packages)
 #:use-module (nordic-channel packages))

(define-public nordic-dwl
  (package
   (inherit dwl)
   (name "nordic-dwl")
   (version "0.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://gitlab.com/SMproductive/nordic-dwl")
           (commit "d92d29f64a6db5482ccead3fca541b795660fd7c")))
     (sha256
      (base32 "1ddr1nc6msyc81yrif7i3r2gswp3cycf6zalb7lpf79vk4b2lnz9"))))
   (propagated-inputs (list
                       pipewire
                       bemenu
                       brightnessctl
                       font-gnu-freefont
                       font-jetbrains-mono
                       font-awesome))
   (synopsis "Nordic themed dwm")))
