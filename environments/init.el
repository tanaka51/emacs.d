;; from http://d.hatena.ne.jp/marcy_o/20081208/1228742294

(defvar os-type nil)

(cond ((string-match "apple-darwin" system-configuration) ;; Mac
       (setq os-type 'mac)
       (load (expand-file-name "~/.emacs.d/environments/os/mac.el")))
      ((string-match "linux" system-configuration)        ;; Linux
       (setq os-type 'linux)
       (load (expand-file-name "~/.emacs.d/environments/os/linux.el")))
      ;; ((string-match "freebsd" system-configuration)      ;; FreeBSD
      ;;  (setq os-type 'bsd))
      ((string-match "mingw" system-configuration)        ;; Windows
       (setq os-type 'win)
       (load (expand-file-name "~/.emacs.d/environments/os/win.el"))))

(defun mac? ()
  (eq os-type 'mac))
(defun linux? ()
  (eq os-type 'linux))
(defun bsd? ()
  (eq os-type 'freebsd))
(defun win? ()
  (eq os-type 'win))
