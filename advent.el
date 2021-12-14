;;; advent.el --- Advent Of Code - 1 -*- lexical-binding: t; -*-
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
;;  Advent Of Code - 1
;;
;;; Code:

(defun advent-1 ()
  "Solution to problem 1."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    ;; set the initial state
    ;; is there a better way to set the state and update it?
    (let ((prev-depth (advent-read-depth))
          (num-increase 0))
      (while (not (eobp))
        (let ((depth (advent-read-depth)))
          (if (> depth prev-depth)
              (setq num-increase (1+ num-increase)))
          (setq prev-depth depth))
        (forward-line 1))
      (message "Answer is %d"
               num-increase))))

(defun advent-read-depth ()
  "Read the depth from the current file."
  (string-to-number (buffer-substring-no-properties (line-beginning-position)
                                                    (line-end-position))))


(defun advent-1-2 ()
  "Solution to problem 1 part 2."
  (interactive)
  (goto-char (point-min))
  (save-excursion
    (let ((prev-depth (advent-read-window 3))
          (num-increase 0))
      (while (not (eobp))
        (let ((current-depth (append (cdr prev-depth) (list (advent-read-depth)))))
          (if (> (apply '+ current-depth) (apply '+ prev-depth))
              (setq num-increase (1+ num-increase)))
          (setq prev-depth current-depth))
        (forward-line 1))
      (message "Answer is %d"
               num-increase))))

(defun advent-read-window (n)
  "Read a list of N lines constituting a window."
  (let ((window '()))
    (while (and (not (eobp)) (> n 0))
      (setq window (append window (list (advent-read-depth))))
      (setq n (1- n))
      (forward-line 1))
    window))


(provide 'advent)
;;; advent.el ends here
