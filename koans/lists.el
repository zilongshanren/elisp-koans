
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
;;   based on python koans 'about_lists.py'
;;   based also on "Lisp 3rd Edition" ch. 17. "List storage, surgery and reclamation"
;;
;;   Adapted from google/lisp-koans:koans/lists.lisp

;; Relevant emacs info page: `(info "(elisp)Lists")'

(elisp-koans/define-test test-creating-lists
    "lists can be created using the quote form, or the 'list' function"
  (let ((fruits nil)
        (some-evens nil))
    (setf fruits '(orange pomello clementine))
    (setf some-evens (list (* 2 1) (* 2 2) (* 2 3)))
    (elisp-koans/assert-equal fruits ___)
    (elisp-koans/assert-equal ___ (length some-evens))))


(elisp-koans/define-test test-list-cons
    "cons CONStructs new lists, by prefixing some list with
     a new element like (cons new-element some-list)"
    (let ((nums nil))
      (setf nums (cons :one nums))
      (elisp-koans/assert-equal '(:one) nums)

      (setf nums (cons :two nums))
      (elisp-koans/assert-equal ___ nums)

      "lists can contain anything, even mixtures of different things"
      (setf nums (cons 333 nums))
      (elisp-koans/assert-equal ___ nums)

      "lists can of course contain lists"
      (setf nums (cons '("the" "rest") nums))
      (elisp-koans/assert-equal ___ nums)))


(elisp-koans/define-test test-push-pop
  (let ((stack '(10 20 30 40))
        (firstval nil))
    "push adds an element to the beginning of a list referred to by some symbol"
    (push "last" stack)
    (elisp-koans/assert-equal '("last" 10 20 30 40) stack)

    "pop is the opposite of push.
       It removes and returns the first element of a list"
    (setf firstval (pop stack))
    (elisp-koans/assert-equal "last" firstval)
    (elisp-koans/assert-equal '(10 20 30 40) stack)

    (setf firstval (pop stack))
    (elisp-koans/assert-equal ___ firstval)
    (elisp-koans/assert-equal ___ stack)))


(elisp-koans/define-test test-append
  "append attaches one list to the end of another."
  (elisp-koans/assert-equal '(:a :b :c) (append '(:a :b) '(:c)))

  (let ((abc '(:a :b :c))
        (xyz '(:x :y :z))
        (abcxyz nil))
    (setf abcxyz (append abc xyz))
    (elisp-koans/assert-equal ___ abc)
    (elisp-koans/assert-equal ___ xyz)
    (elisp-koans/assert-equal ___ abcxyz)))


(elisp-koans/define-test test-accessing-list-elements
  (let ((noms '("peanut" "butter" "and" "jelly")))
    (elisp-koans/assert-equal "peanut" (first noms))
    (elisp-koans/assert-equal ___ (second noms))
    (elisp-koans/assert-equal ___ (fourth noms))
    "last returns a singleton list of the final element"
    (elisp-koans/assert-equal ___ (last noms))
    (elisp-koans/assert-equal "butter" (nth 1 noms)) ; k 1
    (elisp-koans/assert-equal ___ (nth 0 noms))
    (elisp-koans/assert-equal ___ (nth 2 noms))
    "'elt' is similar to 'nth', with the arguments reversed"
    (elisp-koans/assert-equal ___ (elt noms 2))))


(elisp-koans/define-test test-slicing-lists
  (let ((noms '("peanut" "butter" "and" "jelly")))
    (elisp-koans/assert-equal ___ (subseq noms 0 1))
    (elisp-koans/assert-equal ___ (subseq noms 0 2))
    (elisp-koans/assert-equal ___ (subseq noms 2 2))
    (elisp-koans/assert-equal ___ (subseq noms 2))))


(elisp-koans/define-test test-list-breakdown
  "car (aka. 'first') returns the first value in a list"
  (elisp-koans/assert-equal ___ (car '(1 2 3)))
  (elisp-koans/assert-equal ___ (car nil))
  "cdr (aka. 'rest') refers to the remainder of the list,
     after the first element"
  (elisp-koans/assert-equal ___ (cdr '(1 2 3)))
  (elisp-koans/assert-equal ___ (cdr nil)))

;;; lists.el ends here
