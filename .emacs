;; Aquamacs only!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-level 0)
 '(LaTeX-item-indent 0)
 '(LaTeX-left-right-indent-level 0)
 '(TeX-brace-indent-level 0)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(global-visual-line-mode t)
 '(make-backup-files nil))

;; no fortran. F for System F!
(setq auto-mode-alist
      (remove (rassoc 'fortran-mode auto-mode-alist) auto-mode-alist))

;; very good settings
(setq-default
 ;line-move-visual t
 make-backup-files nil
 ;inhibit-startup-message t
 aquamacs-scratch-file nil
 sentence-end-double-space nil ;; to comply with AP style ;-)
 indent-tabs-mode nil
 fill-column 65
)

;; my own key bindings
(global-set-key (kbd "C-=") 'fill-region)
(global-set-key (kbd "C-<tab>") (lambda () (interactive) (insert-char 9 1)))
(global-set-key (kbd "M-#") 'align-regexp)
(global-set-key (kbd "C-B") 'backward-char) ; too many full-screeners

;; autofill in text mode (?)
;(defun my-text-mode-hook ()
;  (auto-fill-mode 1))
;(add-hook 'text-mode-hook 'my-text-mode-hook)

;; TeX mode STFU
(add-hook 'TeX-mode-hook 'super-tex)
(defun super-compile-latex () (interactive "") (save-buffer 0)
  (TeX-command "LaTeX" 'TeX-master-file))
(defun super-tex ()
  ;(setenv "TEXINPUTS" (concat ".:" (getenv "HOME") "/sc/AAA:"))
  (define-key TeX-mode-map (kbd "C-C C-C") 'super-compile-latex)
  (auto-fill-mode 1)
  (flyspell-mode 1))

;; scala-mode
;(add-to-list 'load-path "~/etc/scala-mode2")
;(require 'scala-mode2)

;; ocaml-mode
;(setq auto-mode-alist
;  (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code." t)
;(autoload 'camldebug "cameldeb" "Run the Caml debugger." t)

(setq-default TeX-master "master")

;; load all plugins!!!
;(add-to-list 'load-path "/Users/yfcai/etc/emacs")

;;
;; ace jump mode major function
;; 
;(autoload
;  'ace-jump-mode
;  "ace-jump-mode"
;  "Emacs quick move minor mode"
;  t)
;; you can select the key you prefer to
;(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
;; 
;; enable a more powerful jump back function from ace jump mode
;;
;(autoload
;  'ace-jump-mode-pop-mark
;  "ace-jump-mode"
;  "Ace jump back:-)"
;  t)
;(eval-after-load "ace-jump-mode"
;  '(ace-jump-mode-enable-mark-sync))
;(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
