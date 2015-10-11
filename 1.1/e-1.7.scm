; Original sqrt-iter results;

; (sqrt-iter 1 0.0000001)
; 0.0312510656177538

; (sqrt-iter 1 10000000000000)
; <does not finish>

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess old-guess x)
  (< (/ (abs (- guess old-guess)) guess) 0.0001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
    guess
    (sqrt-iter (improve guess x)
               guess
               x)))

; Results with changing good-enough?

; (sqrt-iter 1 2 0.0000001)
; 0.000316227766648637 (much better result)

; (sqrt-iter 1 2 10000000000000)
; 3162277.66401048 (now computes)
