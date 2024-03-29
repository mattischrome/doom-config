;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Matthew Dorey"
      user-mail-address "matt@donnettey.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; Note that SPC t l toggles between the three line numbering modes so
;; line numbers are still available if needed.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/Notes/")

;; This opens emacs maximised but unfortunately renders it impervious to Rectangle.app et al :( so I've turned it off for now 
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; This one doesn't work that well either
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; make sure that alt+3 gives us the hash symbol we truly crave
(define-key key-translation-map (kbd "M-3") (kbd "#"))

;; Make it easier to invoke commands while in insert mode
;; Default alt leader is M+SPC which clashes with Alfred (and therefore a _lot_ of muscle memory)
(setq doom-leader-alt-key "s-SPC")

;; Run a word count where needed
(setq doom-modeline-enable-word-count t)

;; try and get the server running if it isn't already?
;; (Not sure if this is the right place to put this)
(require 'server)

(unless (server-running-p)
  (server-start))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(after! org
   (map! :map org-mode-map
         :n "M-j" #'org-metadown
         :n "M-k" #'org-metaup))

;; Let's tell projectile where my projects can all be found
;; (setq projectile-project-search-path "~/Documents/Projects")

;; Attempt to fix email sending?
(after! auth-source
  (setq auth-sources (nreverse auth-sources)))

;; Set an eshell alias for rake (similar to in zsh) so my blog's rake scripts
;; work better
;;(set-eshell-alias! "rake" "noglob bundle exec rake")
(set-eshell-alias! "rake" "echo this is an alias for rake")


(setq deft-directory "~/Documents/Notes/"
      deft-extensions '("org" "txt")
      deft-recursive t)

(setq org-journal-date-prefix "#TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

(use-package! org-roam-bibtex
  :after org-roam
  :config)

(use-package pdf-view
  :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
  :hook (pdf-tools-enabled . hide-mode-line-mode)
  :config
  (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

;; (use-package! noflet)

;; (defun timu-org-make-capture-frame ()
;;   "Create a new frame and run `org-capture'."
;;   (interactive)
;;   (make-frame '((name . "capture")
;;                 (top . 300)
;;                 (left . 700)
;;                 (width . 80)
;;                 (height . 25)))
;;   (select-frame-by-name "capture")
;;   (delete-other-windows)
;;   (noflet ((switch-to-buffer-other-window (buf) (switch-to-buffer buf)))
;;     (org-capture)))

;; (defadvice org-capture-finalize
;;     (after delete-capture-frame activate)
;;   "Advise capture-finalize to close the frame."
;;   (if (equal "capture" (frame-parameter nil 'name))
;;       (delete-frame)))

;; (defadvice org-capture-destroy
;;     (after delete-capture-frame activate)
;;   "Advise capture-destroy to close the frame."
;;   (if (equal "capture" (frame-parameter nil 'name))
;;       (delete-frame)))

;; (require ‘latex-preview-pane)
;; (latex-preview-pane-enable)
(setq bibtex-completion-bibliography '("~/Documents/Notes/Bibliography/References.bib"))

;; TODO: Work out how to set up this keyboard shortcut properly (e.g. is it in the wrong place? can I use the doom map! function instead?)
;; NB: purpose of the shortcut is to insert a citation from the bibtex file at point

;;(map!
 ;;(:after org
  ;;:map evil-org-mode-map
  ;;:g (kbd "C-c ]") 'org-ref-cite-insert-ivy))
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

