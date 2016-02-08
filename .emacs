(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (add-to-list
   'package-archives
   '("melpa-stable" . "https://stable.melpa.org/packages/")
   t)
  (package-initialize))


(require 'ido)
(ido-mode t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(paredit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(ac-cider . "melpa-stable") t)

(unless (package-installed-p 'cider)
  (package-install 'cider))


(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(require 'yasnippet)
(yas-global-mode 1)


(add-hook
 'paredit-mode-hook
 '(lambda ()
    (local-set-key "\M-Oa" 'paredit-splice-sexp-killing-backward)
    (local-set-key "\M-Ob" 'paredit-splice-sexp-killing-forward)
    (local-set-key "\M-Oc" 'paredit-forward-slurp-sexp)
    (local-set-key "\M-Od" 'paredit-forward-barf-sexp)
    ;; (rainbow-delimiters-mode t)
    ;; (rainbow-paren-mode)
    ;; (setq abbrev-mode t)
    ))

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(unless (package-installed-p 'ac-cider)
  (package-install 'ac-cider))

;; (setq ac-use-menu-map t)

(menu-bar-mode -1)

;;;hooks
(add-hook 'clojure-mode-hook (lambda ()
			       (cider-mode +1)
			       (paredit-mode +1)
			       (rainbow-delimiters-mode +1)
			       (auto-complete-mode +1)))

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (paredit-mode +1)
				  (rainbow-delimiters-mode +1)))
;;auto-complete
(require 'ac-cider)
(add-hook 'clojure-mode-hook 'ac-flyspell-workaround)
(add-hook 'clojure-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(defun set-auto-complete-as-completion-at-point-function ()
  (setq completion-at-point-functions '(auto-complete)))

(add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
(add-hook 'clojure-mode-hook 'set-auto-complete-as-completion-at-point-function)


(defun psc-switch-to-repl-buffer ()
  (interactive)
  (progn
    (switch-to-buffer-other-window "*test*")
    (cider-switch-to-repl-buffer)))

(eval-after-load 'clojure-mode
  '(progn
     (define-key clojure-mode-map (kbd "C-c s s") 'cider-connect)
     (define-key clojure-mode-map (kbd "C-c C-z") 'psc-switch-to-repl-buffer)))

(eval-after-load 'clojure-mode
  '(define-key clojure-mode-map (kbd "C-c C-z") 'psc-switch-to-repl-buffer))


(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;make things look nice
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/blackboard-theme.el")
;; (load-theme 'blackboard t)


(unless (package-installed-p 'solarized-theme)
  (package-install 'solarized-theme))

(global-set-key (kbd "C-c j") 'join-line)
(global-set-key (kbd "M-g") 'goto-line)

;;; 1)cider-connect should read port fromn dot file in project
;;; 2)snippets
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
