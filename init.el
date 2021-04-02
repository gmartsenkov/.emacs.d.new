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

(straight-use-package 'doom-themes)
(straight-use-package 'projectile)
(straight-use-package 'cider)
(straight-use-package 'exec-path-from-shell)
(straight-use-package 'magit)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'company)
(straight-use-package 'ivy)
(straight-use-package 'elixir-mode)
(straight-use-package 'lsp-mode)

(load-theme 'doom-one)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(with-eval-after-load "company"
  (define-key company-active-map (kbd "C-p") #'company-select-previous-or-abort)
  (define-key company-active-map (kbd "C-n") #'company-select-next-or-abort))

(yas-global-mode 1)
(projectile-mode +1)
(ivy-mode 1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(setq lsp-clients-elixir-server-executable "~/elixir-ls/release/language_server.sh")
(setq projectile-completion-system 'ivy)
(setq company-tooltip-limit 10) 
(setq company-idle-delay .1)
(setq company-tooltip-align-annotations t)
(setq lsp-enable-file-watchers nil)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'elixir-mode-hook 'lsp)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("8f5a7a9a3c510ef9cbb88e600c0b4c53cdcdb502cfe3eb50040b7e13c6f4e78e" default)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
