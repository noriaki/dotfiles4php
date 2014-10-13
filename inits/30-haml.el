(require 'haml-mode)
;; flymake haml
(add-hook 'haml-mode-hook 'flymake-haml-load)
;; hamlからhtmlへコンパイル
(defun haml-compile ()
  (interactive)
  (let ((from buffer-file-name)
        (to (replace-regexp-in-string "\.haml$" ".html" buffer-file-name)))
    (shell-command-to-string
     (concat "haml" " --double-quote-attributes " from " " to))))
;; 保存時に自動でhamlからhtmlへコンパイル
(add-hook 'haml-mode-hook
          '(lambda ()
             (add-hook 'after-save-hook 'haml-compile)))
