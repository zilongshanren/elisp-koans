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
;;   Adapted from google/lisp-koans:koans/special-forms.lisp

;; Special forms are evaluatable lisp forms (lists) which are
;; neither functions nor macros.  Here is an introduction to a
;; few of them.

;; based on http://psg.com/~dlamkins/sl/chapter03-03.html

(defvar elisp-koans-my-name)
(defvar elisp-koans-my-clones-name)
(defvar elisp-koans-a)
(defvar elisp-koans-b)
(defvar elisp-koans-c 0)

;; Relevant emacs info page: `(info "(elisp)Setting Generalized Variables")'

(elisp-koans/define-test test-setf
    "setf is used to assign values to symbols.  These symbols may refer to
     variables with lexical or dynamic scope."
  (setf elisp-koans-my-name "David")
  (elisp-koans/assert-equal elisp-koans-my-name ____)
  " In SBCL, if the symbol isn't defined as a variable, via a top-level defvar
  or let statement, the setf call may result in a warning."
  (setf elisp-koans-my-clones-name elisp-koans-my-name)
  (elisp-koans/assert-equal "David" ____)
  (setf elisp-koans-a 5)
  (setf elisp-koans-b 10)
  (setf elisp-koans-c ___)
  (elisp-koans/assert-equal 50 elisp-koans-c))

;; Relevant emacs info page: `(info "(elisp)Local Variables")'

(elisp-koans/define-test test-let
  "The let form establishes a lexical extent, within which explicit symbols
  may be bound to values.  The binding only extends over the extent of the
  lexical form.  After which, the previous value, if it exists, is visible again."
  (setf elisp-koans-a 10)
  (setf elisp-koans-b 20)
  (elisp-koans/assert-equal elisp-koans-a ___)
  (elisp-koans/assert-equal elisp-koans-b ___)
  (let ((elisp-koans-a 1111)
        (elisp-koans-b 2222))
    (elisp-koans/assert-equal elisp-koans-a ___)
    (elisp-koans/assert-equal elisp-koans-b ___))
  (elisp-koans/assert-equal elisp-koans-a ___)
  (elisp-koans/assert-equal elisp-koans-b ___))


(elisp-koans/define-test test-let-default-value
    "let vars have a default value"
    (let ((x))
      (elisp-koans/assert-equal ___ x)))

(elisp-koans/define-test test-let-bindings-are-parallel
  "When defining the bindings in the let form, later bindings may not depend
  on earlier ones"
  (setf elisp-koans-a 100)
  (let ((elisp-koans-a 5)
        (elisp-koans-b (* 10 elisp-koans-a)))
    (elisp-koans/assert-equal elisp-koans-b ___)))

(elisp-koans/define-test test-let*-bindings-are-series
    "let* is like let, but successive bindings may use values of previous ones"
  (setf a 100)
  (let* ((a 5)
         (b (* 10 a)))
    (elisp-koans/assert-equal b ___))
  (elisp-koans/assert-equal a ___))


(elisp-koans/define-test write-your-own-let-statement
  "fix the let statement to get the tests to pass"
  (setf elisp-koans-a 100)
  (setf elisp-koans-b 23)
  (setf elisp-koans-c 456)
  (let ((elisp-koans-a __)
        (elisp-koans-b __)
        (elisp-koans-c __))
    (elisp-koans/assert-equal elisp-koans-a 100)
    (elisp-koans/assert-equal elisp-koans-b 200)
    (elisp-koans/assert-equal elisp-koans-c "Jellyfish"))
  (let* ((elisp-koans-a __)
         ;; add more here
         )
    (elisp-koans/assert-equal elisp-koans-a 121)
    (elisp-koans/assert-equal elisp-koans-b 200)
    (elisp-koans/assert-equal elisp-koans-c (+ elisp-koans-a (/ elisp-koans-b elisp-koans-a)))))

;; Relevant emacs info page: `(info "(cl)Conditionals")'
;; Note that `case' is an alias of `cl-case'

(elisp-koans/define-test test-case
  "the case form is like the C switch statement: it
  compares an input with a set of values and evaluates an
  expression once a match is found"
  (setf elisp-koans-a 4)
  (setf elisp-koans-b
        (case elisp-koans-a (4 :four)
              (5 :five)
              ;; t specifies default behavior
              (t :unknown)))
  (elisp-koans/assert-equal ____ elisp-koans-b)
  "case can also check if a list of values contains
   the input"
  (setf elisp-koans-c
        (case elisp-koans-a (5 :five)
                ((3 4) :three-or-four)))
  (elisp-koans/assert-equal ____ elisp-koans-c))

(defun cartoon-dads (input)
    "you should be able to complete this case statement"
  (case input (:this-one-doesnt-happen :fancy-cat)
              (t :unknown)))

(elisp-koans/define-test test-your-own-case-statement
  "fix this by completing the 'cartoon-dads' function above"
  (elisp-koans/assert-equal (cartoon-dads :bart) :homer)
  (elisp-koans/assert-equal (cartoon-dads :stewie) :peter)
  (elisp-koans/assert-equal (cartoon-dads :stan) :randy)
  (elisp-koans/assert-equal (cartoon-dads :space-ghost) :unknown))

(elisp-koans/define-test test-limits-of-case
    "case is not suitable for all kinds of values, because
     it uses the function eql for comparisons. We will explore
     the implications of this in the equality-distinctions lesson"
  (let* ((name "John")
         (lastname (case name ("John" "Doe")
                              ("Max" "Mustermann")
                              (t "Anonymous"))))
  (elisp-koans/assert-equal ____ lastname)))

(elisp-koans/define-test test-cond
    "cond is the general purpose form for checking multiple
     conditions, until a condition is met"
  (setf elisp-koans-a 4)
  (setf c
        (cond ((> elisp-koans-a 0) :positive)
              ((< elisp-koans-a 0) :negative)
              (t :zero)))
  (elisp-koans/assert-equal ____ elisp-koans-c))

;;; special-forms.el ends here
