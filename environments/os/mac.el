;;; for mac

;; command key to Meta key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;; メニューバーを非表示
;; mac では menu-bar-mode と同じ動作っぽく、再び menu-bar が現れる
;; (tool-bar-mode nil)
(menu-bar-mode nil)

;; window サイズ設定
(if window-system
    (progn
      (set-frame-parameter nil 'alpha 90) ; 透明度
      (setq line-spacing 0.2) ; 行間
      (setq ns-pop-up-frames nil)
      (setq initial-frame-alist
          (append (list
                   '(width . 175)
                   '(height . 69)
                   '(top . 0)
                   '(left . 0))
                  initial-frame-alist))))

;; フォント設定方法 by igaiga
;; フレームのフォントを設定
(let* ((size 12) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
       (asciifont "Ricty") ; ASCIIフォント
       (jpfont "Ricty") ; 日本語フォント
       (h (* size 12))
       (fontspec (font-spec :family asciifont))
       (jp-fontspec (font-spec :family jpfont)))
  (set-face-attribute 'default nil :family asciifont :height h)
  (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
  (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
  (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
  (set-fontset-font nil '(#x0370 . #x03FF) fontspec))

;; Migemo
(setq load-path (cons "~/.emacs.d/elisp/" load-path))
(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-regex-dictionary nil)
(load-library "migemo")
(migemo-init)

;; MacOS X Dict
(require 'thingatpt)
(defun macdict-lookup (word)
  "Lookup word with Dictionary.app"
  (call-process "open" nil 0 nil (concat "dict://" word)))

(defun macdict-lookup-word ()
  "Lookup the word at point with Dictionary.app."
  (interactive)
  (macdict-lookup (word-at-point)))
(global-set-key (kbd "C-^") 'macdict-lookup-word)

(global-set-key (kbd "C-M-_") 'indent-region)