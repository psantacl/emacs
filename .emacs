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
(add-to-list 'package-pinned-packages '(company . "melpa-stable") t)


(unless (package-installed-p 'cider)
  (package-install 'cider))


(unless (package-installed-p 'paredit)
  (package-install 'paredit))

(unless (package-installed-p 'projectile)
  (package-install 'projectile))

(projectile-global-mode t)

(unless (package-installed-p 'yasnippet)
  (package-install 'yasnippet))

(unless (package-installed-p 'company)
  (package-install 'company))


(global-company-mode)
;; (add-hook 'cider-repl-mode-hook #'company-mode)
;; (add-hook 'cider-mode-hook #'company-mode)

(require 'yasnippet)
(yas-global-mode 1)



(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-p a") 'paredit-splice-sexp-killing-backward)
     (define-key paredit-mode-map (kbd "M-p b")  'paredit-splice-sexp-killing-forward)
     (define-key paredit-mode-map (kbd "M-p c")  'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-p d")  'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "M-k")  'kill-sexp)))

(unless (package-installed-p 'rainbow-delimiters)
  (package-install 'rainbow-delimiters))

(menu-bar-mode -1)

;;;hooks
(add-hook 'clojure-mode-hook (lambda ()
			       (cider-mode +1)
			       (paredit-mode +1)
			       (rainbow-delimiters-mode +1)
			       ;; (auto-complete-mode +1)
                               ))

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (paredit-mode +1)
				  (rainbow-delimiters-mode +1)))


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
(global-set-key (kbd "<f5>") 'revert-buffer)

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

(setq-default indent-tabs-mode nil)
