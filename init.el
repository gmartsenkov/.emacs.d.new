(load-file "~/.emacs.d/defaults.el")

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'ag)
(straight-use-package 'doom-themes)
(straight-use-package 'projectile)
(straight-use-package 'cider)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'magit)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'company)
(straight-use-package 'ivy)
(straight-use-package 'prescient)
(straight-use-package 'ivy-prescient)
(straight-use-package 'elixir-mode)
(straight-use-package 'lsp-mode)
(straight-use-package 'dashboard)
(straight-use-package 'smartparens)
(straight-use-package 'ample-theme)
(straight-use-package 'expand-region)
(straight-use-package 'git-gutter)
(straight-use-package 'anzu)
(straight-use-package 'crux)
(straight-use-package 'ace-window)

(setq doom-gruvbox-dark-variant "soft")
(load-theme 'doom-gruvbox t)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(global-set-key (kbd "C-c D") 'crux-delete-file-and-buffer)
(global-set-key (kbd "s-w") 'ace-window)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "s-k") 'crux-kill-whole-line)
(global-set-key (kbd "C-c k") 'crux-kill-other-buffers)
(global-set-key (kbd "C-c f") 'crux-recentf-find-file)

(global-set-key (kbd "s-.") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-=") 'er/expand-region)
(with-eval-after-load "projectile"
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(with-eval-after-load "company"
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort))

(dashboard-setup-startup-hook)

(global-anzu-mode t)
(yas-global-mode t)
(projectile-mode t)
(ivy-mode t)
(smartparens-global-strict-mode t)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(ivy-prescient-mode t)
(prescient-persist-mode t)
(global-git-gutter-mode t)

(setq prescient-save-file "~/.emacs.d/.ivy-prescient")
(setq sp-base-key-bindings 'sp)
(setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
(setq lsp-clients-elixir-server-executable "~/elixir-ls/release/language_server.sh")
(setq projectile-completion-system 'ivy)
(setq company-tooltip-limit 10) 
(setq company-idle-delay .1)
(setq company-tooltip-align-annotations t)
(setq lsp-enable-file-watchers nil)
(setq dashboard-center-content t)
(setq dashboard-startup-banner '2)
(setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (bookmarks . 5)
                        (agenda . 5)))
(setq ruby-indent-level 2)
(setq rspec-primary-source-dirs '("app"))
(setq ruby-insert-encoding-magic-comment nil)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'elixir-mode-hook 'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("75b8719c741c6d7afa290e0bb394d809f0cc62045b93e1d66cd646907f8e6d43" "8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-file "~/.emacs.d/keys.el")
