;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages (specifications->packages (list "age-keygen"
                                            "age"
                                            "mpv"
                                            "tree"
                                            "rlwrap"
                                            "recutils"
                                            "nats-server"
                                            "emacs"
                                            "yq"
                                            "du-dust"
                                            "zoxide"
                                            "ripgrep"
                                            "fd"
                                            "tig"
                                            "git"
                                            "htop")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
   (list (service home-bash-service-type
                  (home-bash-configuration
                   (aliases '(("alert" . "notify-send --urgency=low -i \"$([ $? = 0 ] && echo terminal || echo error)\" \"$(history|tail -n1|sed -e '\\''s/^\\s*[0-9]\\+\\s*//;s/[;&|]\\s*alert$//'\\'')\"")
                              ("egrep" . "egrep --color=auto")
                              ("fgrep" . "fgrep --color=auto")
                              ("grep" . "grep --color=auto")
                              ("l" . "ls -CF")
                              ("la" . "ls -A")
                              ("ll" . "ls -alF")
                              ("ls" . "ls --color=auto")))
                   (bashrc (list (local-file "./.bashrc" "bashrc")))
                   (bash-logout (list (local-file "./.bash_logout"
                                                  "bash_logout"))))))))
