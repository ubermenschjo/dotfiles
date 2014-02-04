;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

(load (expand-file-name "~/quicklisp/slime-helper.el") t t t)
(when (require 'slime nil 'noerror)
  (slime-setup))

;; Load bindings config
(live-load-config-file "bindings.el")
(live-load-config-file "elpa.el")
(live-load-config-file "setq.el")
(live-load-config-file "dotshare.el")
(live-load-config-file "java.el")
;(live-load-config-file "hooks.el")
