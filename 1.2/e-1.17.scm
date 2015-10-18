; Design a procedure that will do multiplication, similar to
; exponentiation in e-1.16.

; This time we're keeping a*b + product constant
(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (mult-rec a b 0))

(define (even? n)
  (= (remainder n 2) 0))

(define (mult-rec a b product)
  (cond ((= b 0) product)
        ((even? b) (mult-rec (double a) (halve b) product))
        (else (mult-rec a (- b 1) (+ product a)))))
