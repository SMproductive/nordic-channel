(define-module (nordic-channel packages wm)
  #:use-module (nordic-channel packages)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages wm)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix utils)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:))

;; TODO desktop file
(define-public nordic-dwl
  (package
    (inherit dwl)
    (name "nordic-dwl")
    (source
      (origin
        (method git-fetch)
        (uri (git-reference
          (url "https://github.com/SMproductive/nordic-dwl.git")
          (commit "3756724a882f71767a19abba614dda150d288e26")))
        (sha256
          (base32 "0ac3s134bha8z5ml0m724hhda69j34gma8fqd1zjraj3y5bs0sfz"))))
    (home-page "https://github.com/SMproductive/nordic-dwl")
    (synopsis "Nordic themed dwl")))

