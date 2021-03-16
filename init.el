
(setq max-lisp-eval-depth 10000)
(setq max-specpdl-size 10000)
(require 'package)
(setq package-enable-at-startup nil)

;; elpa repository
(setq package-archives '(("gnu" . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                         ("melpa-stable" . "http://mirrors.ustc.edu.cn/elpa/melpa-stable/")
                         ("org" . "http://mirrors.ustc.edu.cn/elpa/org/")))


(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/MyInit.org"))

;; (use-package try
;;   :ensure t)

;; (use-package which-key
;;   :ensure t
;;   :config
;;   (which-key-mode))

;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; ;; ido mode
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (defalias 'list-buffers 'ibuffer-other-window) ; make ibuffer default

;; (windmove-default-keybindings) ; use shift with arrows to move between windows

;; ;; it looks like counsel is a requirement for swiper
;; (use-package counsel
;; :ensure t
;; )

;; (use-package swiper
;; :ensure try
;; :config
;; (progn
;; (ivy-mode 1)
;; (setq ivy-use-virtual-buffers t)
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "<f1> f") 'counsel-describe-function)
;; (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
;; (global-set-key (kbd "<f1> l") 'counsel-load-library)
;; (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
;; (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
;; ))

;; (use-package avy
;;   :ensure t
;;   :config
;;   (avy-setup-default)
;;   :bind("M-s"  . avy-goto-char))

;; (use-package auto-complete
;; :ensure t
;; :init
;; (progn
;; (ac-config-default)
;; (global-auto-complete-mode t)
;; ))

;; (use-package zenburn-theme
;;   :ensure t
;;   :config (load-theme 'zenburn t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(quelpa auctex zenburn-theme auto-complete avy org-bullets which-key use-package try))
 '(safe-local-variable-values '((TeX-master . xetex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
