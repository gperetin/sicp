(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess))
     3))

(define (good-enough? guess old-guess x)
  (< (/ (abs (- guess old-guess)) guess) 0.0001))

(define (cube-iter guess old-guess x)
  (if (good-enough? guess old-guess x)
    guess
    (cube-iter (improve guess x)
               guess
               x)))

(define (cube-root x)
  (cube-iter 1 2 x))
