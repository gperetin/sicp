(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

; Following will spin the interpreter in an infinite loop (uses applicative
; evaluation)
; (test 0 (p))

; Applicative evaluation will get stuck here, because it evaluates an
; operator and all operands first and then applies the procedure
; Normal-order evaluation would be ok because it doesn't evaluate operands
; until their values are needed
