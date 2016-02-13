;; basic adjustments for magit
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))
(add-to-list 'load-path "~/.magit/el-get/el-get")

;; make sure el-get is there
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; get el-get-packages
(let ((el-get-sources
       '(
         magit
         color-theme-zenburn)))
    (el-get 'sync el-get-sources))
(load-theme 'zenburn t)

;; bring up magit-status
(menu-bar-mode -1)
(kill-buffer "*scratch*")
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")
(magit-status)
(delete-other-windows)
