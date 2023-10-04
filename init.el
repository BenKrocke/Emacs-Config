(load "~/.emacs.d/functions.el")

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t))

(use-package magit
  :ensure t
  :defer t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package savehist
  :init
  (savehist-mode))

(use-package which-key
  :ensure t
  :config
  (setq which-key-show-early-on-C-h t)
  (setq which-key-idle-delay 10000)
  (setq which-key-idle-secondary-delay 0.05)
  (which-key-mode))

(use-package eglot
  :hook (python-mode . eglot-ensure))

(use-package python
  :ensure nil
  :config
  (electric-pair-mode))

(use-package emacs
  :config
  (setq use-short-answers t)	               
  (show-paren-mode t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (setq display-line-numbers-type 'relative)
  (keymap-global-set "C-x c" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
  (keymap-global-set "C-x r" 'restart-emacs-ask)
  (keymap-global-set "C-c r" 'ben-run-python-main)
  (keymap-global-set "C-<tab>" (lambda () (interactive) (switch-to-buffer nil)))
  (add-to-list 'exec-path "~/.local/bin"))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
