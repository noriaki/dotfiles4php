(setq less-css-compile-at-save t) ; 初期値は nil
;; lessc への引数 '("arg") 形式で
;; (setq less-css-lessc-options '("--yui-compress"))

(when (fboundp 'winner-mode)
  (winner-mode t))

(setq compilation-finish-functions 'compile-autoclose)
(defun compile-autoclose (buffer string)
  (cond ((string-match "finished" string)
         (bury-buffer "*compilation*")
         (winner-undo)
         (message "Build successful."))
        (t
         (message "Compilation exited abnormally: %s" string))))
