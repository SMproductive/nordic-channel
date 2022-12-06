(define-module (nordic-channel packages misc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))
(define-public pmanager-go
  (package
   (name "pmanager-go")
   (version "0.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/SMproductive/pmanager-go")
		  (commit "fa286aeaadc7f6c6832c28f2c161b897e910bee7")))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "1v3s6vvlvap83zij1f0l3nnqp4iz9i171fv190kidqm68wh76wgk"))))
   (build-system go-build-system)
   (native-inputs
    (list libx11 libxcursor libxrandr libxinerama
	  libxi pkg-config glfw))
   (arguments
    `(#:import-path "github.com/SMproductive/pmanager-go"))
   (home-page "https://github.com/SMproductive/pmanager-go")
   (synopsis "Nordic password manager using fyne2 api")
   (description "pmanager-go is simple and straight forward. Only what you press will happen!")
   (license license:gpl3+)))

(define-public ppm
  (package
   (name "ppm")
   (version "0.1")
   (source (origin
	    (method git-fetch)
	    (uri (git-reference
		  (url "https://github.com/SMproductive/ppm")
		  (commit "519c7a919e4080403ffa731294260b053820ac73")))
	    (file-name (git-file-name name version))
	    (sha256
	     (base32
	      "0qrkn5dl8zmyp710gis7532471p8cdq2lfmh4wv1bx0rpsd4z84r"))))
   (build-system go-build-system)
   (native-inputs
    (list))
   (arguments
    `(#:import-path "github.com/SMproductive/ppm"))
   (home-page "https://github.com/SMproductive/ppm")
   (synopsis "Piping Password Manager")
   (description "ppm is comand line interface for managing passwords. It can open a pipe and what ever client you have can communicate to it.")
   (license license:gpl3+)))
