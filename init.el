(setq user-full-name "Koichi Tanaka")

;; ロードパス設定
(setq load-path(cons (expand-file-name "~/.emacs.d/") load-path))
(setq load-path(cons (expand-file-name "~/.emacs.d/elisp") load-path))
(setq load-path(cons (expand-file-name "~/.emacs.d/auto-install") load-path))

;;;;;;;;;;;;;;;;;;;;;;
;;
;; 環境毎の設定
;;
(load "~/.emacs.d/environments/init.el")


;; エラー時になにもしない
(setq ring-bell-function 'ignore)

;; 起動時のスプラッシュ画面を非表示
(setq inhibit-startup-message t)

;; バックアップファイルの作成をしない
(setq-default make-backup-files nil)

;; バックスペースをC-hに割り当て
(global-set-key "\C-h" 'backward-delete-char)

;; 行末に空白があると警告
(setq show-trailing-whitespace t)

;; 文字コード
(set-language-environment 'Japanese)
(prefer-coding-system 'utf-8)

;; 略語展開、保管を行うコマンドをまとめる
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))
(global-set-key (kbd "C-:") 'hippie-expand)

;; フォントサイズの動的変更
(global-set-key (kbd "M-+") (lambda () (interactive) (text-scale-increase 1)))
(global-set-key (kbd "M-\-") (lambda () (interactive) (text-scale-decrease 1)))

;; インデント文字をタブではなく空白に設定
(setq-default indent-tabs-mode nil)

;; 対応する括弧をハイライト
(show-paren-mode t)

;; リロードをM-rに設定
(global-set-key (kbd "M-r") 'revert-buffer)

;; ファイル名がかぶった場合にバッファ名をわかりやすくする
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[~*]+")

;; ウィンドウの分割時の移動設定
(setq windmove-wrap-around t)
(global-set-key (kbd "C-M-k") 'windmove-up)
(global-set-key (kbd "C-M-j") 'windmove-down)
(global-set-key (kbd "C-M-l") 'windmove-right)
(global-set-key (kbd "C-M-h") 'windmove-left)

;; which-func-mode 259
(which-func-mode 1)
(setq which-func-mode t)

;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; anything
(require 'anything-startup)
(require 'anything-migemo)
(global-set-key (kbd "C-;") 'anything)

;; recentf-ext.el
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$"))
(require 'recentf-ext)

;; redo+ 123
(require 'redo+)
(global-set-key (kbd "C-M-/") 'redo)
(setq undo-limit 600000)
(setq undo-strong-limit 900000)

;; open-junk-file.el 247
(require 'open-junk-file)
(setq open-junk-file-format "~/junk/%Y/%m/%d/%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; direx
(require 'direx)
;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(setq direx:leaf-icon "  "
      direx:open-icon "↓"
      direx:closed-icon "→")

;; カラーテーマ
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/color-theme") load-path))
(require 'color-theme)
(color-theme-initialize)
(color-theme-simple-1)
