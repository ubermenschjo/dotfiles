;; mode:-*-emacs-lisp-*-
;; wanderlust
;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "ubermenschjo@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl
      ;;for non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "ubermenschjo"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq  elmo-maildir-folder-path "~/Maildir"          ;; where i store my mail

       wl-stay-folder-window t                       ;; show the folder pane (left)
       wl-folder-window-width 25                     ;; toggle on/off with 'i'

       wl-from "JUNG-LAE JO <ubermenschjo@gmail.com>"

       ;; note: all below are dirs (Maildirs) under elmo-maildir-folder-path 
       ;; the '.'-prefix is for marking them as maildirs
       wl-fcc ".sent"                       ;; sent msgs go to the "sent"-folder
       wl-fcc-force-as-read t               ;; mark sent messages as read 
       wl-default-folder ".inbox"           ;; my main inbox 
       wl-draft-folder ".drafts"            ;; store drafts in 'postponed'
       wl-trash-folder ".trash"             ;; put trash in 'trash'
       wl-spam-folder ".trash"              ;; ...spam as well
       wl-queue-folder ".queue"             ;; we don't use this

       ;; check this folder periodically, and update modeline
       wl-biff-check-folder-list '(".todo") ;; check every 180 seconds
       ;; (default: wl-biff-check-interval)

       ;; hide many fields from message buffers
       wl-message-ignored-field-list '("^.*:")
       wl-message-visible-field-list
       '("^\\(To\\|Cc\\):"
	 "^Subject:"
	 "^\\(From\\|Reply-To\\):"
	 "^Organization:"
	 "^Message-Id:"
	 "^\\(Posted\\|Date\\):"
	 )
       wl-message-sort-field-list
       '("^From"
	 "^Organization:"
	 "^X-Attribution:"
	 "^Subject"
	 "^Date"
	 "^To"
	 "^Cc"))
