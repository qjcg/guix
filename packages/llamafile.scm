(define-module (jgosset packages llamafile)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build utils)
  #:use-module (guix build-system copy)
  #:use-module (gnu packages))


(define-public llamafile
  (package
    (name "llamafile")
    (version "0.8.13")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/Mozilla-Ocho/llamafile/releases/download/" version "/llamafile-" version))
       (sha256 (base32 "03amdsk7mj9y8y47ljq1qqcpgql27skkslkhbhqc2r2vrbzsrcgc"))))
    (build-system copy-build-system)
    (home-page "https://github.com/Mozilla-Ocho/llamafile")
    (synopsis "Distribute and run LLMs with a single file.")
    (description "Our goal is to make open LLMs much more accessible to both developers and end users. We're doing that by combining llama.cpp with Cosmopolitan Libc into one framework that collapses all the complexity of LLMs down to a single-file executable (called a "llamafile") that runs locally on most computers, with no installation.")
    (license license:asl2.0)))
