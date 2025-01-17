;;   Copyright 2013 Google Inc.
;;
;;   Licensed under the Apache License, Version 2.0 (the "License");
;;   you may not use this file except in compliance with the License.
;;   You may obtain a copy of the License at
;;
;;       http://www.apache.org/licenses/LICENSE-2.0
;;
;;   Unless required by applicable law or agreed to in writing, software
;;   distributed under the License is distributed on an "AS IS" BASIS,
;;   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;   See the License for the specific language governing permissions and
;;   limitations under the License.
;;
;;   Adapted from google/lisp-koans:koans/multiple-values.lisp

"In lisp, it is possible for a function to return more than one value.
This is distinct from returning a list or structure of values."

(elisp-koans/define-test test-floor-returns-multiple-values
    (let ((x)
          (y))
      "`floor' returns a single value"
      (setf x (floor 1.5))
      (elisp-koans/assert-equal x 1)
      "`floor*' returns multiple values"
      (setf x (multiple-value-list (floor* 1.5)))
      (elisp-koans/assert-equal x '(1 0.5)))
  (elisp-koans/assert-equal (multiple-value-list (floor* (/ 99.0 4))) ____))

(defun next-fib (a b)
  (values b (+ a b)))

(elisp-koans/define-test test-multi-value-bind
    (let ((x)
          (y))
      (setf x (next-fib 2 3))
      (elisp-koans/assert-equal x ___)
      (setf x (multiple-value-list (next-fib 2 3)))
      (elisp-koans/assert-equal x ___)
      "multiple-value-bind binds the variables in the first form
       to the outputs of the second form.  And then returns the output
       of the third form using those bindings"
      (setf y (multiple-value-bind (b c) (next-fib 3 5) (* b c)))
      (elisp-koans/assert-equal y ___)
      "multiple-value-setq is like setf, but can set multiple variables"
      (multiple-value-setq (x y) (values :v1 :v2))
      (elisp-koans/assert-equal (list x y) '(:v1 :v2))
      (multiple-value-setq (x y) (next-fib 5 8))
      (elisp-koans/assert-equal (list x y) ____)))

;;; multiple-values.el ends here
