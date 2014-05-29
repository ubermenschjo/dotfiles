;;; Malabar-mode
;; (require 'cedet)
;; (require 'semantic)

;; (load "semantic/loaddefs.el")
;; (semantic-mode 1)

;; (require 'malabar-mode)
;; (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

;;; eclim
(require 'eclim)
(global-eclim-mode)

(require 'auto-complete-config)
(ac-config-default)

(require 'ac-emacs-eclim-source)
;;; (ac-emacs-eclim-source)

(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)
