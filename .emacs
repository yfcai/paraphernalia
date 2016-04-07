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

;; proof general
(load-file (concat (getenv "HOME") "/etc/ProofGeneral/generic/proof-site.el"))

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

;; no toolbar
;(if (boundp 'tool-bar-mode) (tool-bar-mode 0)) ;; for emacs 22.1.1
(if tool-bar-mode (tool-bar-mode 0))

;; global linum mode
(global-linum-mode 1)

;; my own key bindings
(global-set-key (kbd "C-=") 'fill-region)
(global-set-key (kbd "C-<tab>") (lambda () (interactive) (insert-char 9 1)))
(global-set-key (kbd "M-#") 'align-regexp)
(global-set-key (kbd "C-B") 'backward-char) ; too many full-screeners

;; autofill in text mode (?)
(defun my-text-mode-hook ()
  (auto-fill-mode 1))
(add-hook 'text-mode-hook 'my-text-mode-hook)

;; scala-mode
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

;; idris mode
(unless (package-installed-p 'idris-mode)
  (package-refresh-contents) (package-install 'idris-mode))
(setq idris-load-packages '("effects"))

(defun my-idris-mode-hook ()
  (global-unset-key (kbd "RET"))
  (local-unset-key (kbd "RET"))
  (global-set-key (kbd "RET") 'newline))
(add-hook 'idris-mode-hook 'my-idris-mode-hook)


;; ocaml-mode
;(setq auto-mode-alist
;  (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
;(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code." t)
;(autoload 'camldebug "cameldeb" "Run the Caml debugger." t)

(setq-default TeX-master "master")

;; load all plugins!!!
(add-to-list 'load-path (concat (getenv "HOME") "/etc/emacs"))

;;
;; ace jump mode major function
;; 
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
; 
; enable a more powerful jump back function from ace jump mode
;
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;
; csv mode
;
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)

;
; Agda mode: Uncomment after you successfully installed Agda again
;
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
;;;
;;; Agda input method!!!
;;;
;(autoload 'agda-input "agda-input" "agda-input" t)
(load-library "agda-input")
(setq default-input-method "Agda")


;; delete markdown mode (I hate it so much)
(delete '("\\.\\(md\\)$" . markdown-mode) auto-mode-alist)

;; compile-on-save
;; http://rtime.felk.cvut.cz/~sojka/blog/compile-on-save/

(defun compile-on-save-start ()
  (let ((buffer (compilation-find-buffer)))
    (unless (get-buffer-process buffer)
      (recompile))))

(define-minor-mode compile-on-save-mode
  "Minor mode to automatically call `recompile' whenever the
current buffer is saved. When there is ongoing compilation,
nothing happens."
  :lighter " CoS"
    (if compile-on-save-mode
    (progn  (make-local-variable 'after-save-hook)
        (add-hook 'after-save-hook 'compile-on-save-start nil t))
      (kill-local-variable 'after-save-hook)))

;; toggle window split between horizontal and vertical
(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))


;; TeX-texify
;; http://www.emacswiki.org/emacs/TN
;; only do it if it's aquamacs
(when (featurep 'aquamacs)
  (require 'tex-buf)
  (defun TeX-command-default (name)
    "Next TeX command to use. Most of the code is stolen from `TeX-command-query'."
    (cond ((if (string-equal name TeX-region)
               (TeX-check-files (concat name "." (TeX-output-extension))
                                (list name)
                                TeX-file-extensions)
             (TeX-save-document (TeX-master-file)))
           TeX-command-default)
          ((and (memq major-mode '(doctex-mode latex-mode))
                (TeX-check-files (concat name ".bbl")
                                 (mapcar 'car
                                         (LaTeX-bibliography-list))
                                 BibTeX-file-extensions))
           ;; We should check for bst files here as well.
           TeX-command-BibTeX)
          ((TeX-process-get-variable name
                                     'TeX-command-next
                                     TeX-command-Show))
          (TeX-command-Show)))


  (defcustom TeX-texify-Show t "Start view-command at end of TeX-texify?" :type 'boolean :group 'TeX-command)
  (defcustom TeX-texify-max-runs-same-command 5 "Maximal run number of the same command" :type 'integer :group 'TeX-command)

  (defun TeX-texify-sentinel (&optional proc sentinel)
    "Non-interactive! Call the standard-sentinel of the current LaTeX-process.
If there is still something left do do start the next latex-command."
    (set-buffer (process-buffer proc))
    (funcall TeX-texify-sentinel proc sentinel)
    (let ((case-fold-search nil))
      (when (string-match "\\(finished\\|exited\\)" sentinel)
        (set-buffer TeX-command-buffer)
        (unless (plist-get TeX-error-report-switches (intern (TeX-master-file)))
          (TeX-texify)))))

  (defun TeX-texify ()
    "Get everything done."
    (interactive)
    (save-buffer 0)
    (let ((nextCmd (TeX-command-default (TeX-master-file)))
          proc)
      (if (and (null TeX-texify-Show)
               (equal nextCmd TeX-command-Show))
          (when  (called-interactively-p 'any)
            (message "TeX-texify: Nothing to be done."))
        (TeX-command nextCmd 'TeX-master-file)
        (when (or (called-interactively-p 'any)
                  (null (boundp 'TeX-texify-count-same-command))
                  (null (boundp 'TeX-texify-last-command))
                  (null (equal nextCmd TeX-texify-last-command)))
          (mapc 'make-local-variable '(TeX-texify-sentinel TeX-texify-count-same-command TeX-texify-last-command))
          (setq TeX-texify-count-same-command 1))
        (if (>= TeX-texify-count-same-command TeX-texify-max-runs-same-command)
            (message "TeX-texify: Did %S already %d times. Don't want to do it anymore." TeX-texify-last-command TeX-texify-count-same-command)
          (setq TeX-texify-count-same-command (1+ TeX-texify-count-same-command))
          (setq TeX-texify-last-command nextCmd)
          (and (null (equal nextCmd TeX-command-Show))
               (setq proc (get-buffer-process (current-buffer)))
               (setq TeX-texify-sentinel (process-sentinel proc))
               (set-process-sentinel proc 'TeX-texify-sentinel))))))
  ;; C-c C-c muscle memory...
  (add-hook 'LaTeX-mode-hook '(lambda () (local-set-key (kbd "C-c C-c") 'TeX-texify)))
  )
