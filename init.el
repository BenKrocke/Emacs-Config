(load "~/.emacs.d/functions.el")

(use-package crux
  :ensure t)

(use-package emacs
  :config
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes/"))
  (load-theme 'nord t)
  (defun font-exists-p (font) (if (null (x-list-fonts font)) nil t))
(when (window-system)
  (cond ((font-exists-p "JetBrains Mono Regular") (set-frame-font "JetBrains Mono Regular" nil t))
    ((font-exists-p "JetBrains Mono Regular") (set-frame-font "JetBrains Mono Regular" nil t))))
  (setq use-short-answers t)	               
  (show-paren-mode t)
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode)
  (setq display-line-numbers-type 'relative)
  (keymap-global-set "C-k" 'crux-kill-whole-line)
  (keymap-global-set "C-<return>" 'crux-smart-open-line)
  (keymap-global-set "C-S-<return>" 'crux-smart-open-line-above)
  (keymap-global-set "C-c k" 'crux-kill-other-buffers)
  (keymap-global-set "C-x c" (lambda () (interactive) (find-file "~/.emacs.d/init.el")))
  (keymap-global-set "C-x r" 'restart-emacs-ask)
  (keymap-global-set "C-<tab>" (lambda () (interactive) (switch-to-buffer nil)))
  (keymap-global-set "C-'" 'switch-to-buffer)
  (keymap-global-set "C-;" 'project-find-file)
  (add-to-list 'exec-path "~/.local/bin"))

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
  :hook
  (python-mode . eglot-ensure)
  (rust-mode . eglot-ensure))

(use-package python
  :ensure nil
  :config
  (electric-pair-mode))

(use-package rust-mode
  :ensure t)

(use-package company
  :ensure t
  :custom
  (company-global-modes '(not eshell-mode shell-mode))
  :hook ((text-mode . company-mode)
	 (prog-mode . company-mode)))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
