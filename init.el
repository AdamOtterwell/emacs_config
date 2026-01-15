
;ui stuff
(scroll-bar-mode -1)  ;Disable scroll bar
(tool-bar-mode -1)    ;Disable tool bar
(tooltip-mode -1) 
(set-fringe-mode 10)


(global-display-line-numbers-mode t) ;line numbers on


(load-theme 'tango-dark) ;theme

(setq visible-bell t) ;Disable annoying sounds

(setq-default tab-width 4) ;normal tab width
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)





(require 'package) ;package stuff below

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa/")
			 ("elpa" . "https://elpa.gnu.org/packages/")
             ("melpa-stable" . "https://stable.melpa.org/packages/")))
      

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;(use-package magit)

(use-package command-log-mode)

(use-package ivy)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(web-mode-edit-element web-mode rust-mode which-key dap-mode lsp-treemacs lsp-ivy lsp-ui lsp-mode magit counsel ivy command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package counsel
  :bind (("M-x" . counsel-M-x)
		 ("C-x b" . counsel-ibuffer)
		 ("C-x C-f" . counsel-find-file)
		 :map minibuffer-local-map
		 ("C-r" . 'counsel-minibuffer-history))
  :config
  (setq ivy-initial-inputs-alist nil))


(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

;; web stuff
(use-package web-mode
  :ensure t ; Automatically installs the package if not present
  :mode (("\\.html\\'\\." . web-mode) ; Associates web-mode with .html files
         ("\\.css\\'\\." . web-mode)  ; Associates web-mode with .css files
         ("\\.js\\'\\." . web-mode)   ; Associates web-mode with .js files
         ("\\.phtml\\'\\." . web-mode) ; Associates web-mode with .phtml files
         ("\\.php\\'\\." . web-mode)  ; Associates web-mode with .php files
         ("\\.erb\\'\\." . web-mode)  ; Associates web-mode with .erb files
         ("\\.mustache\\'\\." . web-mode) ; Associates web-mode with .mustache files
         ("\\.djhtml\\'\\." . web-mode)) ; Associates web-mode with .djhtml files
  :config
  ;; Add any custom settings here. Example:
  (setq web-mode-markup-indent-offset 4
        web-mode-css-indent-offset 4
        web-mode-code-indent-offset 4))

