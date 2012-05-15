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

;; delete-selection-mode
;; 選択範囲を消すモード
(delete-selection-mode t)



;; auto-install
(require 'auto-install)
(add-to-list 'load-path auto-install-directory)
(auto-install-compatibility-setup)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; anything
(require 'anything-startup)
(require 'anything-migemo)
(global-set-key (kbd "C-;") 'anything)
(global-set-key (kbd "M-i") 'anything-imenu)

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
(setq open-junk-file-find-file-function 'find-file)
(global-set-key (kbd "C-x j") 'open-junk-file)

;; direx
(require 'direx)
(require 'direx-project)
;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 60 :dedicated t)
      popwin:special-display-config)
(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")
(global-set-key (kbd "C-x C-j") 'direx-project:jump-to-project-root-other-window)
(global-set-key (kbd "C-x M-j") 'direx:jump-to-directory-other-window)


;; カラーテーマ
(setq load-path (cons (expand-file-name "~/.emacs.d/elisp/color-theme") load-path))
(require 'color-theme)
(color-theme-initialize)
(color-theme-simple-1)

;; egg for git interface
(require 'egg)
(push '(egg-status-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '(egg-log-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '(egg-file-log-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '(egg-reflog-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '(egg-diff-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '(egg-commit-buffer-mode :position bottom :height 34) popwin:special-display-config)
(push '("*vc-change-log*" :position bottom :height 34) popwin:special-display-config)



;; TODO: プログラミング用モード設定は分割する方針で

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

;; rhtml-mode
(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-hook 'rhtml-mode-hook
          '(lambda () (rinari-launch)))

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
