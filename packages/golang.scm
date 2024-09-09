(define-module (golang)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix build-system go)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages tls))

;; Via `guix import go github.com/qjcg/horeb`.
(define-public horeb
  (package
    (name "horeb")
    (version "0.15.8")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/qjcg/horeb")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02dn3g0mkd1s3h9m3gxhhgr574nca7fnhavzsij6gkrh11gdwikj"))))
    (build-system go-build-system)
    (arguments
     `(#:go ,go-1.23
       #:install-source? #f
       #:unpack-path "github.com/qjcg/horeb"
       #:import-path "github.com/qjcg/horeb/cmd/horeb"))

    ;; FIXME: These inputs don't exist, need to `guix import go` them.
    (propagated-inputs (list go-golang-org-x-exp go-github-com-samber-mo
                             go-github-com-samber-lo
                             go-github-com-rogpeppe-go-internal))
    (home-page "https://github.com/qjcg/horeb")
    (synopsis "Speaking in tongues via stdout")
    (description
     "Horeb is a CLI tool for generating random sequences of characters from various
@@url{https://en.wikipedia.org/wiki/Unicode_block,Unicode blocks}.")
    (license license:isc)))

(define-public 4d
  (package
    (name "4d")
    (version "0.5.7")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/qjcg/4d")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0r2j1zdgshn3nkcli87zihv1pnlh5p241knyqrhjibv3lgcrsg7q"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/qjcg/4d"))
    (home-page "https://github.com/qjcg/4d")
    (synopsis "4d")
    (description "This package provides a simple CLI stopwatch.")
    (license license:expat)))
