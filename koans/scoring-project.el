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


;;;;;;;;;;;;;;
;; GREED !! ;;
;;;;;;;;;;;;;;


;; Modified from Ruby Koans: about_scoring_project.rb

; *Greed* is a dice game where you roll up to five dice to accumulate
; points.  The following "score" function will be used to calculate the
; score of a single roll of the dice.
;
; A greed roll is scored as follows:
;
; * A set of three ones is 1000 points
;
; * A set of three numbers (other than ones) is worth 100 times the
;   number. (e.g. three fives is 500 points).
;
; * A one (that is not part of a set of three) is worth 100 points.
;
; * A five (that is not part of a set of three) is worth 50 points.
;
; * Everything else is worth 0 points.
;
;
; Examples:
;
; (score '(1 1 1 5 1)) => 1150 points
; (score '(2 3 4 6 2)) => 0 points
; (score '(3 4 5 3 3)) => 350 points
; (score '(1 5 1 2 4)) => 250 points
;
; More scoring examples are given in the tests below:
;
; Your goal is to write the score method.

(defun score (dice)
  "Score the DICE rolls."
  :write-me)


(elisp-koans/define-test
 test-score-of-an-empty-list-is-zero
 "The score of an empty list is 0."
 (elisp-koans/assert-equal 0 (score nil)))


(elisp-koans/define-test
 test-score-of-a-single-roll-of-5-is-50
 "The score of a single five is 50."
 (elisp-koans/assert-equal 50 (score '(5))))


(elisp-koans/define-test
 test-score-of-a-single-roll-of-1-is-100
 "The score of a single role of one is 100."
 (elisp-koans/assert-equal 100 (score '(1))))


(elisp-koans/define-test
 test-score-of-multiple-1s-and-5s-is-the-sum-of-individual-scores
 "The score of multiple ones and fives is the sum of the individual scores."
 (elisp-koans/assert-equal 300 (score '(1 5 5 1))))


(elisp-koans/define-test
 test-score-of-single-2s-3s-4s-and-6s-is-zero
 "The score of single twos, threes, fours, and sixes is zero"
 (elisp-koans/assert-equal 0 (score '(2 3 4 6))))


(elisp-koans/define-test
 test-score-of-a-triple-1-is-1000
 "The score of a triple one is 1000."
 (elisp-koans/assert-equal 1000  (score '(1 1 1))))


(elisp-koans/define-test
 test-score-of-other-triples-is-100x
 "The score of three of the same is 100x"
 (elisp-koans/assert-equal 200  (score '(2 2 2)))
 (elisp-koans/assert-equal 300  (score '(3 3 3)))
 (elisp-koans/assert-equal 400  (score '(4 4 4)))
 (elisp-koans/assert-equal 500  (score '(5 5 5)))
 (elisp-koans/assert-equal 600  (score '(6 6 6))))


(elisp-koans/define-test
 test-score-of-mixed-is-sum
 "Sum the score of a mixture to get the total."
 (elisp-koans/assert-equal 250  (score '(2 5 2 2 3)))
 (elisp-koans/assert-equal 550  (score '(5 5 5 5))))

;; scoring-project.el ends here
