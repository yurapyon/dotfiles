(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             t)
(package-initialize)

(setq inhibit-splash-screen t
      initial-scratch-message nil)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(global-display-line-numbers-mode)

(setq tab-width 2
      indent-tabs-mode nil)

(setq backup-inhibited t)
(setq auto-save-default nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq echo-keystrokes 0.1)

(server-start)

(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; Optionally, specify the lisp program you are using. Default is "lisp"
(setq inferior-lisp-program "sbcl") 

(setq slime-contribs '(slime-repl))

(setq show-paren-delay 0)
(show-paren-mode t)

(add-to-list 'custom-theme-load-path
	     "~/.emacs.d/themes")
(load-theme 'mochi t)

(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 2)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 2)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; YOUR init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (evil slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
