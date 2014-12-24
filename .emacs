(setq shell-file-name "bash")
(setq shell-command-switch "-ic")
;; (set-background-color "gray12")
;; (set-cursor-color "green")
;; (set-foreground-color "white")
(column-number-mode)
(load-file "~/.emacs.d/cs61b.el")
(load-file "~/.emacs.d/groovy-mode.el")
(load-file "~/.emacs.d/groovy-electric.el")
(load-file "~/.emacs.d/grails-mode.el")
(load-file "~/.emacs.d/rdoc-mode.el")
(autoload 'rdoc-mode "rdoc-mode" "Major mode for editing Rdoc files." t)
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'auto-mode-alist '("\.gradle$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

(add-to-list 'load-path "~/.emacs.d/ess/lisp/")
(load "ess-site")
(setq ess-indent-level 4)
(setq ess-arg-function-offset 4)
(setq ess-else-offset 4)
(global-set-key [C-tab] 'other-window)

(setq js-indent-level 2)
(setq exec-path (cons (expand-file-name "~/.rvm/gems/ruby-2.1.2/bin") exec-path))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))
(add-to-list 'load-path "~/.emacs.d/lisp")
(load "editorconfig")
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-enabled-themes (quote (desert)))
 '(custom-safe-themes (quote ("a4e6940f5c63f3c6759d35e6534eaa26ff14512aa61616a0584bda9f858c60b9" default)))
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 25))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'haml-mode)
;;; use yaml-mode for .yml files
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ejs$" . html-mode))
