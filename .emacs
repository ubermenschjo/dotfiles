;;;; set-variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
;;;; '(custom-theme-directory "~/.emacs.d/elpa/")
 '(package-user-dir "~/.emacs.d/elpa")
 '(display-battery-mode t)
 '(display-time-mode t)
 '(global-auto-revert-mode t)
 '(ido-mode 1 nil (ido))
 '(org-agenda-files (quote ("~/Dropbox/GTD/life.org" "~/Dropbox/GTD/mirae-dev.org" "~/Dropbox/GTD/index.org" "~/Dropbox/GTD/rtm.org" "~/Dropbox/GTD/private-dev.org" "~/Dropbox/GTD/knou.org" "~/Dropbox/GTD/gcal.org")))
 '(safe-local-variable-values (quote ((todo-categories "dev" "Todo"))))
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set the load path  
;;
;; add everything under ~/.emacs.d to it
(let* ((my-lisp-dir "~/.emacs.d/")
       (default-directory my-lisp-dir))
  (setq load-path (cons my-lisp-dir load-path))
  (normal-top-level-add-subdirs-to-load-path))

(when (file-exists-p "~/.emacs.d/elpa/package.el")
  (when (load (expand-file-name "~/.emacs.d/elpa/package.el"))
    (package-initialize)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; general setting
(setq completion-ignore-case t           ;; ignore case when completing...
      read-file-name-completion-ignore-case t) ;; ...filenames too

(setq ispell-dictionary "english")

(setq org-log-done t)

(setq inferior-lisp-program "/usr/bin/sbcl")
;; backups
(setq make-backup-files t ;; do make backups
      backup-by-copying t     ;; and copy them here
      backup-directory-alist '(("." . "~/.emacs.d/cache/backups")) 
      version-control t
      kept-new-versions 2
      kept-old-versions 5
      delete-old-versions t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; the in-frame speedbar
(when (require 'sr-speedbar nil 'noerror)
  (setq speedbar-supported-extension-expressions
	'(".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?"
	  ".tex\\(i\\(nfo\\)?\\)?" ".el"
	  ".java" ".p[lm]" ".pm" ".py"  ".s?html"  "Makefile.am" "configure.ac"))
  (setq
   sr-speedbar-width-x 20
   sr-speedbar-right-side t))

;; tramp, for remote access
(when (require 'tramp nil 'noerror)
  ;; we need a bit more funky pattern, as tramp will start $SHELL
  ;; (sudo -s), ie., zsh for root user
  (setq shell-prompt-pattern "^[^a-zA-Z].*[#$%>] *")
  (setq
   tramp-default-method "ssh"
   tramp-persistency-file-name "~/.emacs.d/cache/tramp"))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yas-snippet
(setq yas-global-mode t)
(setq yas-minor-mode t)
(setq yas-snippet-dirs "/home/ubermenschjo/.emacs.d/elpa/yasnippet-20120923.1126/snippets")
(when (require 'dropdown-list nil 'noerror)
  (setq yas-prompt-functions '(yas-dropdown-prompt
			       yas-ido-prompt
			       yas-completing-prompt)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; auctex
(load "auctex.el" t t t)
(load "preview-latex.el" t t t)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

(defun my-LaTeX-hook ()
  (setq TeX-command-list
	(append TeX-command-list
		'(("PDF : LaTeX + dvips + ps2pdf"
		   "latex %t && dvips %d -o %f && ps2pdf14 %f"
		   TeX-run-command nil t)))))

(add-hook 'LaTeX-mode-hook 'my-LaTeX-hook)

(require 'org-latex)
(unless (boundp 'org-export-latex-classes)
  (setq org-export-latex-classes nil))

(add-to-list 'org-export-latex-classes
             '("article"
               "\\documentclass{article}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(add-to-list 'org-export-latex-packages-alist '("" "minted"))

(setq org-export-latex-listings 'minted)

(setq org-export-latex-custom-lang-environments
      '((emacs-lisp "common-lispcode")))

(setq org-export-latex-minted-options
      '(("frame" "lines")
	("fontsize" "\\scriptsize")
	("linenos" "")))

(setq org-latex-to-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; auto-install
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/auto-install"))
(when (require 'auto-install nil 'noerror)
  (setq auto-install-directory "~/.emacs.d/elpa/auto-install/"))
					;(auto-install-update-emacswiki-package-name t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; auto-complete
(when (require 'auto-complete-config nil 'noerror) ;; don't break if not installed 
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
  (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
  (ac-config-default)
  (global-auto-complete-mode t))

;;;; ac-slime
(load (expand-file-name "~/quicklisp/slime-helper.el") t t t)
(when (require 'slime nil 'noerror)
  (slime-setup)

  (require 'clojure-mode)
  (setq clojure-swank-command
	(if (or (locate-file "lein" exec-path) (locate-file "lein.bat" exec-path))
	    "lein ritz-in %s"
	  "echo \"lein ritz-in %s\" | $SHELL -l"))
					;(add-hook 'slime-mode-hook 'set-up-slime-ac)
					;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
					;(eval-after-load "auto-complete"
					;  '(add-to-list 'ac-modes 'slime-repl-mode))
  (define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; jabber
(setq jabber-account-list
      '(("ubermenschjo@gmail.com" 
	 (:network-server . "talk.google.com")
	 (:connection-type . ssl))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; paredit-minor
;;;;(add-hook M-mode-hook 'enable-paredit-mode)
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'clojure-mode-hook (lambda() (paredit-mode +1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; haskell-mode
(load "haskell-site-file" t t t)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init) (flymake-mode)))
					;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; anything
(when (require 'anything nil 'noerror))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; prelude
(when (require 'prelude-lisp nil 'noerror))
(when (require 'prelude-programming nil 'noerror))
(when (require 'prelude-xml nil 'noerror))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; sauron
(autoload 'sauron "sauron")

(when (require 'zenburn-theme nil 'noerror))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; magit
(autoload 'magit-status "magit" nil t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; global keybindings
;;
(global-set-key (kbd "RET")         'newline-and-indent)
(global-set-key (kbd "C-<f4>")      'kill-buffer-and-window)
(global-set-key (kbd "<delete>")    'delete-char)  ; delete == delete    
(global-set-key (kbd "M-g")         'goto-line)    ; M-g  'goto-line
(global-set-key (kbd "C-c l") 'org-store-link)  ;; Links
(global-set-key (kbd "C-c a") 'org-agenda)      ;; Agenda
(global-set-key (kbd "C-x b") 'anything)      ;; Anything
(global-set-key (kbd "C-x g") 'magit-status)	;; magit

(when (fboundp 'ibuffer)
  (global-set-key (kbd "C-x C-b") 'ibuffer))   ;; ibuffer

;; C-pgup goes to the start, C-pgdw goes to the end
(global-set-key (kbd "<C-prior>")
		(lambda()(interactive)(goto-char(point-min))))
(global-set-key (kbd "<C-next>")
		(lambda()(interactive)(goto-char(point-max))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; safe locals
;; we mark these as 'safe', so emacs22+ won't give us annoying
;; warnings
(setq safe-local-variable-values
      (quote ((auto-recompile . t)
              (folding-mode . t)
              (outline-minor-mode . t)
              auto-recompile outline-minor-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; bbdb & wanderlust
(setq bbdb-file "~/.emacs.d/bbdb")

(require 'bbdb)
(bbdb-initialize)

(setq 
 bbdb-offer-save 1                        ;; 1 means save-without-asking
 bbdb-use-pop-up t                        ;; allow popups for addresses
 bbdb-electric-p t                        ;; be disposable with SPC
 bbdb-popup-target-lines  1               ;; very small
 bbdb-dwim-net-address-allow-redundancy t ;; always use full name
 bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs
 bbdb-always-add-address t                ;; add new addresses to existing...
 ;; ...contacts automatically
 bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx
 bbdb-completion-type nil                 ;; complete on anything
 bbdb-complete-name-allow-cycling t       ;; cycle through matches
 ;; this only works partially
 bbbd-message-caching-enabled t           ;; be fast
 bbdb-use-alternate-names t               ;; use AKA
 bbdb-elided-display t                    ;; single-line addresses
 ;; auto-create addresses from mail
 bbdb-mail-auto-create-p 'bbdb-ignore-some-messages-hook   
 bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
 ;; NOTE: there can be only one entry per header (such as To, From)
 ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html
 '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter")))


(autoload 'wl "wl Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)

(require 'bbdb-wl)
(bbdb-wl-setup)


;(define-key wl-draft-mode-map (kbd "<C-tab>") 'bbdb-complete-name)
(add-hook 'wl-draft-mode-hook
          (lambda ()
	    (define-key wl-draft-mode-map (kbd "<C-tab>") 'bbdb-complete-name)))
