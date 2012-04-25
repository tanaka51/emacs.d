(setq user-full-name "Koichi Tanaka")


;; 環境毎の設定
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
