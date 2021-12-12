;;; advent.el --- Adevnt Of Code - 1 -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 Athul Suresh
;;
;; Author: Athul Suresh <https://github.com/athulsuresh>
;; Maintainer: Athul Suresh <athulsure@gmail.com>
;; Created: December 12, 2021
;; Modified: December 12, 2021
;; Version: 0.0.1
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/athulsuresh/advent
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Adevnt Of Code - 1
;;
;;; Code:

(defun advent-1 ()
  "Solution to problem 1."
  (interactive)
  (goto-char (point-min))
  (let ((prev-depth 'nil)
        (num-increase 0))
    (while (not (eobp))
      (let ((depth (advent-get-depth)))
        (if (advent-is-depth-increasing-p depth
                                          prev-depth)
            (setq num-increase (+ num-increase 1)))
        (setq prev-depth depth))
      (forward-line 1))
    (message "Answer is %d"
             num-increase)))

(defun advent-get-depth ()
  "Read the depth from the current file."
  (string-to-number (buffer-substring-no-properties (line-beginning-position)
                                                    (line-end-position))))

(defun advent-is-depth-increasing-p (depth prev-depth)
  "Check if the DEPTH is increasing by comparing against PREV-DEPTH."
  (and prev-depth (> depth prev-depth)))

(provide 'advent)
;;; advent.el ends here
