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

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(paredit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(company . "melpa-stable") t)


;;(package-refresh-contents)

(unless (package-installed-p 'vscdark-theme) (package-install 'vscdark-theme))
(unless (package-installed-p 'yaml-mode) (package-install 'yaml-mode))
(unless (package-installed-p 'vscode-dark-plus-theme) (package-install 'vscode-dark-plus-theme))
(unless (package-installed-p 'fantom-theme) (package-install 'fantom-theme))
(unless (package-installed-p 'ido-completing-read+) (package-install 'ido-completing-read+))
(unless (package-installed-p 'ido-vertical-mode) (package-install 'ido-vertical-mode))
(unless (package-installed-p 'cider) (package-install 'cider))
(unless (package-installed-p 'yasnippet) (package-install 'yasnippet))
(unless (package-installed-p 'solarized-theme) (package-install 'solarized-theme))
(unless (package-installed-p 'rainbow-delimiters) (package-install 'rainbow-delimiters))
(unless (package-installed-p 'projectile) (package-install 'projectile))
(unless (package-installed-p 'paredit) (package-install 'paredit))
(unless (package-installed-p 'company) (package-install 'company))
(unless (package-installed-p 'color-theme) (package-install 'color-theme))
(unless (package-installed-p 'ag) (package-install 'ag))
(unless (package-installed-p 'ac-cider) (package-install 'ac-cider))
(unless (package-installed-p 'dockerfile-mode) (package-install 'dockerfile-mode))

(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(require 'ido-vertical-mode)
(require 'ido-completing-read+)
(require 'yasnippet)
(require 'ido)
(ido-mode t)
(ido-mode 1)
(ido-vertical-mode 1)
(ido-ubiquitous-mode 1)
(yas-global-mode 1)
(projectile-global-mode t)
(global-company-mode)
(menu-bar-mode -1)
(setq-default indent-tabs-mode nil)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "M-p a") 'paredit-splice-sexp-killing-backward)
     (define-key paredit-mode-map (kbd "M-p b")  'paredit-splice-sexp-killing-forward)
     (define-key paredit-mode-map (kbd "M-p c")  'paredit-forward-slurp-sexp)
     (define-key paredit-mode-map (kbd "M-p d")  'paredit-forward-barf-sexp)
     (define-key paredit-mode-map (kbd "M-k")  'kill-sexp)))

;;;hooks
(add-hook 'clojure-mode-hook (lambda ()
			       (cider-mode +1)
			       (paredit-mode +1)
			       (rainbow-delimiters-mode +1)))

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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("f4c8f0b999a6407211a899401315a628e1a5ae2f408c04a33b14d7aa3ed86187" "67ea2e2549ab1ba9b27a4fc3c78353225d6fd155a69292dc6f7d3286bd8d3a82" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors '("#d33682" "#6c71c4"))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    '("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2")))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   '(("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4"))
 '(package-selected-packages
   '(dockerfile-mode vscdark-theme vscode-dark-plus-theme fantom-theme ido-completing-read+ ido-vertical-mode cider yasnippet solarized-theme rainbow-delimiters projectile paredit company color-theme ag ac-cider))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((comp)))
 '(weechat-color-list
   '(unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '(".Dockerfile." . dockerfile-mode))
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
