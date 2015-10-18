; Define fast-expt (fast exponentiation) using iterative process.

; Tip in the book suggests to keep the invariant a*b^n unchanged
; from iteration to iteration.

(define (fast-expt b n)
  (exp-rec b n 1))

(define (even? n)
  (= (remainder n 2) 0))

(define (square a)
  (* a a))

(define (exp-rec b n a)
  (cond ((= 0 n) a)
        ((even? n) (exp-rec (square b) (/ n 2) a))
        (else (exp-rec b (- n 1) (* a b)))))
