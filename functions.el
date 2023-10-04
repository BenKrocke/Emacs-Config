(defun restart-emacs-ask ()
  "Ask for confirmation before restarting Emacs"
  (interactive)
  (if (y-or-n-p "Do you want to restart Emacs?")
      (restart-emacs)))

(defun ben-run-python-main ()
  "Send main.py to python shell"
  (interactive)
  (python-shell-send-file "~/code/python/platformer/main.py"))
