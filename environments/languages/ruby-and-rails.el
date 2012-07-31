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