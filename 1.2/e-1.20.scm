(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))))

; Normal-order evaluation
; - fully expand and then reduce

; (gcd 206 40)
; (gcd 40 (remainder 206 40)) -> 1
; (gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
; ...

; Normal order evaluates reminder 18 times.

; Applicative-order evaluation
; - evaluate arguments and then apply

; (gcd 206 40)
; (gcd 40 6) -> 1
; (gcd 6 4) -> 2
; (gcd 4 2) -> 3
; (gcd 2 0) -> 4

; Total of 4 remainder calculations for applicative-order
