(setq completion-ignore-case t           ;; ignore case when completing...
      read-file-name-completion-ignore-case t) ;; ...filenames too
;; backups
(setq make-backup-files t ;; do make backups
      backup-by-copying t     ;; and copy them here
      backup-directory-alist '(("." . "~/.emacs.d/cache/backups"))
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)

(setq inferior-lisp-program "/usr/bin/sbcl")

;;; input-method
(setq default-input-method "korean-hangul")

;;; MobileOrg
(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/GTD/MobileOrg")
