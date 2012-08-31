;;;; for Ruby and Rails

;; ruby-electric
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          (let ()
            (defun ruby-insert-end ()
              "Insert \"end\" at point and reindent current line."
              (interactive)
              (insert "end")
              (ruby-indent-line t)
              (end-of-line))
            '(lambda ()
               (ruby-electric-mode t))))

;; ruby-block.el
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          '(lambda () (rinari-launch)))

(require 'yaml-mode)

;; ruby-mode
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
