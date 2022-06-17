;;; init --- minimal settings for magit
;;; Commentary:
;;; Code:
(setq user-init-file (or load-file-name (buffer-file-name)))
(setq user-emacs-directory (file-name-directory user-init-file))

(defvar bootstrap-version)
(setq straight-disable-native-compile t)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(use-package magit :straight t)
(use-package zenburn-theme :straight t :config (load-theme 'zenburn t))

(menu-bar-mode -1)
(load-theme 'zenburn t)
(kill-buffer "*scratch*")
(defalias 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

;; bring up magit-status

(let ((sha (getenv "SHA")))
  (if sha
      (magit-log-setup-buffer (list "--all") nil nil nil sha)
    (magit-status))
  (delete-other-windows))
(provide 'init)
;;; init.el ends here
