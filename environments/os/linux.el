;;; for linux

;; ツールバーを非表示 メニューバーを非表示
(tool-bar-mode nil)
(menu-bar-mode nil)

;; スクロールバーを右側に
(set-scroll-bar-mode 'right)

;; 日本語を使えるようにする
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; 起動時のウィンドウサイズを設定
(if (boundp 'window-system)
    (progn
      (setq line-spacing 0.2) ; 行間
      (setq ns-pop-up-frames nil)
      (setq initial-frame-alist
            (append (list
                     '(width . 180)
                     '(height . 50))
                    initial-frame-alist))))
(setq default-frame-alist initial-frame-alist)

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
