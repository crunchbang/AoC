;;; advent2.el --- Day 2 - AoC -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Athul Suresh
;;
;; Author: Athul Suresh <https://github.com/athulsuresh>
;; Maintainer: Athul Suresh <athulsure@gmail.com>
;; Created: December 15, 2021
;; Modified: December 15, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/athulsuresh/advent2
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Day 2 - AoC
;;
;;; Code:

(defun advent-2 ()
  "Solution to problem 2."
  (interactive)
  (goto-char (point-min))
  (let ((horizontal 0)
        (depth 0))
    (while (not (eobp))
      (let* ((cmd-pair (advent2-get-cmd))
             (cmd (car cmd-pair))
             (value (string-to-number(cadr cmd-pair))))
        (cond
              ((string= cmd "forward") (setq horizontal (+ horizontal value)))
              ((string= cmd "up") (setq depth (- depth value)))
              ((string= cmd "down") (setq depth (+ depth value))))
        (forward-line 1)))
    (message "The result is %d"
             (* horizontal depth))))

(defun advent2-get-cmd ()
  "Read the cmd from the sample file."
  (split-string (buffer-substring-no-properties (line-beginning-position)
                                  (line-end-position))))

(provide 'advent2)
;;; advent2.el ends here
