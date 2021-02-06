(setq ring-bell-function 'ignore)
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)



(use-package try
  :ensure t)

(use-package which-key
:ensure t
:config
(which-key-mode))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package ivy
  :defer 1
  :demand
  :diminish
  :hook (after-init . ivy-mode)
  :config (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))

(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1)
  ;;(setcdr (assq t ivy-format-function-alist) #'ivy-format-function-line)
  )

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	     ("C-h b" . counsel-descbinds)
	     ("C-h f" . counsel-describe-function)
	     ("C-h v" . counsel-describe-variable)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c f" . counsel-recentf)
	 ("C-c g" . counsel-git)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

(use-package avy
  :ensure t
  :config
  (avy-setup-default)
  :bind("M-s"  . avy-goto-word-1)) ;; changed from char as per jcs

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)
    ))

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "/home/mike/Documents/tmp/slides/reveal.js")
(setq org-reveal-mathjax t)
(use-package htmlize
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  )

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup)
  )
(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  )

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  )

(use-package undo-tree
  :ensure t
  :init
  (global-undo-tree-mode)
  )

(global-hl-line-mode t)
(blink-cursor-mode -1)

(use-package beacon
  :ensure t
  :config
  (beacon-mode 1)
  )
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode)
  )
(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  )

; mark and edit all copies of the marked region simultaniously. 
(use-package iedit
:ensure t)

(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-open-below)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-delete)
   '("x" . meow-line)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g" . meow-keyboard-quit)
   '("G" . meow-goto-line)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-open-above)
   '("m" . meow-join)
   '("M" . delete-indentation)
   '("s" . meow-kill)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("o" . meow-block)
   '("O" . meow-block-expand)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("R" . meow-replace-save)
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("u" . undo)
   '("v" . meow-visit)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("y" . meow-save)
   '("p" . meow-yank)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("<escape>" . meow-last-buffer)))

(use-package meow
  :init
  (meow-global-mode 1)
  :config
  ;; 在Normal模式下使用相对行号
  (meow-setup-line-number)
  (meow-setup))

(use-package valign
  :ensure t
  :config
  (add-hook 'org-mode-hook #'valign-mode))

(require 'quelpa)

(add-to-list 'load-path "~/.emacs.d/site-lisp/ctable/")
(require 'ctable)

(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework"
  :init
  (use-package epc :defer t)
  (use-package ctable :defer t)
  (use-package deferred :defer t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-abblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding))
