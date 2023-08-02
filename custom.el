(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(latex-preview-pane org-noter-pdftools org-noter))
 '(smtpmail-smtp-server "smtp.mail.me.com")
 '(smtpmail-smtp-service 587))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
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
