(define-module (nordic-channel packages wm)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages base)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages video)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages wm)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (nordic-channel packages)
  #:use-module ((guix licenses) #:prefix license:))

;; FIXME can not compile
(define-public nordic-dwl
  (package
   (name "nordic-dwl")
   (version "0.3.1")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/SMproductive/nordic-dwl")
                  (commit "17ac59f99f91f7c8aec690fa551f929e6929199c")))
            (file-name (git-file-name name version))
            (sha256
             (base32 "1jqqydfca81cga59n107jm2v1680zpxsr5b051mnrw9rbh9fpk6j"))))
   (build-system gnu-build-system)
   (arguments
    `(#:tests? #f                      ; no tests
      #:make-flags
      (list
       (string-append "CC=" ,(cc-for-target))
       (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure)         ; no configure
                     (add-after 'build 'install-xsession
                                (lambda* (#:key outputs #:allow-other-keys)
                                  ;; Add a .desktop file to xsessions.
                                  (let* ((output (assoc-ref outputs "out"))
                                         (xsessions (string-append output "/share/wayland-sessions")))
                                    (mkdir-p xsessions)
                                    (with-output-to-file
                                        (string-append xsessions "/dwl.desktop")
                                      (lambda _
                                        (format #t
                                                "[Desktop Entry]~@
                     Name=dwl~@
                     Comment=Dynamic Window Manager~@
                     Exec=~a/bin/dwl~@
                     TryExec=~@*~a/bin/dwl~@
                     Icon=~@
                     Type=Application~%"
                                                output)))
                                    #t))))))
   (native-inputs
    (list pkg-config))
   (inputs
    (list nordic-wlroots))
   (propagated-inputs
    (list xorg-server-xwayland
          nordic-wayland))
   (home-page "https://github.com/SMproductive/nordic-dwl")
   (synopsis "Dynamic window manager for Wayland with nordic theme")
   (description
    "@command{dwl} is a compact, hackable compositor for Wayland based on
wlroots.  It is intended to fill the same space in the Wayland world that dwl
does in X11, primarily in terms of philosophy, and secondarily in terms of
functionality.  Like dwl, dwl is easy to understand and hack on, due to a
limited size and a few external dependencies.  It is configurable via
@file{config.h}.")
   ;;             LICENSE       LICENSE.dwl   LICENSE.tinywl
   (license (list license:gpl3+ license:expat license:cc0))))

;; FIXME can not find libraries in runpath
(define-public dwl-bar
  (package
   (name "dwl-bar")
   (version "0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://github.com/SMproductive/dwl-bar.git")
                  (commit "55663ebf800bc56a02b6aaf5e1f08663bf2430be")))
            (file-name (git-file-name name version))
            (sha256
             (base32 "1m6adyw55wqf3xngprl0lzc07y7r9pasqsrfmq0bz3c3ab1v26ah"))))
   (build-system glib-or-gtk-build-system)
   (arguments
    `(#:tests? #f                      ; no tests
      #:make-flags
      (list
       (string-append "CC=" ,(cc-for-target))
       (string-append "PREFIX=" (assoc-ref %outputs "out")))
      #:phases
      (modify-phases %standard-phases
                     (delete 'configure))))
   (native-inputs
    (list pkg-config
          `(,glib "bin")
          gobject-introspection))
   (propagated-inputs
    (list gtk
          glib
          harfbuzz
          cairo
          pango-1.90))
   (home-page "https://github.com/SMproductive/nordic-dwl")
   (synopsis "Bar for dwl")
   (description "Is like the usual dwm bar made with gtk.")
   (license license:gpl3+)))


(define-public nordic-wayland
  (package
   (inherit wayland)
   (name "nordic-wayland")
   (version "1.21.0")
   (source (origin
            (method git-fetch)
            (uri (git-reference
                  (url "https://gitlab.freedesktop.org/wayland/wayland.git")
                  (commit "8135e856ebd79872f886466e9cee39affb7d9ee8")))
            (file-name (git-file-name name version))
            (sha256
             (base32 "0fwad6w5jm32c04wh4gca7d1ixdj4b9dnsiy1h6qd9nxs0w47wwy"))))))

(define-public libdrm-2.4.114
  (package
   (inherit libdrm)
   (name "nordic-libdrm")
   (version "2.4.114")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://dri.freedesktop.org/libdrm/libdrm-"
                    version ".tar.xz"))
              (sha256
               (base32
                "09nhk3jx3qzggl5vyii3yh4zm0npjqsbxhzvxrg2xla77a2cyj9h"))))))

(define-public nordic-mesa
  (package
   (inherit mesa)
   (name "nordic-mesa")
    (propagated-inputs
      (list ;; The following are in the Requires.private field of gl.pc.
            libdrm-2.4.114
            libvdpau
            libx11
            libxdamage
            libxfixes
            libxshmfence
            libxxf86vm
            xorgproto))))

(define-public nordic-wayland-protocols
  (package
    (inherit wayland-protocols)
    (name "nordic-wayland-protocols")
    (version "1.31")
    (source (origin
              (method url-fetch)
              (uri (string-append
                    "https://gitlab.freedesktop.org/wayland/"
                    "wayland-protocols/-/releases/" version "/downloads/wayland-protocols-" version ".tar.xz"))
              (sha256
               (base32
                "0f72359fzvh6jzri4fd79m34rwm2r55p2ryq4306wrw7xliafzx0"))))
    (inputs
     (list nordic-wayland))
    (native-inputs (cons* pkg-config python
                          (if (%current-target-system)
                              (list pkg-config-for-build
                                    nordic-wayland) ; for wayland-scanner
                              '())))))


(define-public nordic-wlroots
  (package
   (inherit wlroots)
   (name "nordic-wlroots")
   (version "0.16.0")
   (source (origin
            (method url-fetch)
            (uri (string-append "https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/" version "/downloads/wlroots-" version ".tar.gz"))
            (sha256
             (base32 "1kw4qdr9af4g38klhzchgm58s2ih154q9041bgfdbicnpcqany44"))))
   ;; (inputs (list
   ;;          hwdata
   ;;          vulkan-headers))
    (native-inputs
     (list hwdata
           pkg-config))
   (propagated-inputs (list
                       eudev
                       libdrm-2.4.114
                       libinput-minimal
                       vulkan-headers
                       vulkan-loader
                       vulkan-tools
                       libseat
                       libxkbcommon
                       nordic-mesa
                       nordic-wayland
                       nordic-wayland-protocols
                       pixman
                       xcb-util-errors
                       xcb-util-wm
                       xorg-server-xwayland))))
