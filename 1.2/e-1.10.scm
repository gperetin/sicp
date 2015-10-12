; Ackermann's function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

; What is the value of the following expressions?
; (A 1 10) -> 1024
; (A 2 4) -> 65536
; (A 3 3) -> 65536

; (A 1 10)
; (A 0 (A 1 9))
; (A 0 (A 0 (A 1 8)))
; ... (continues until y hits 1, and then returns 2)
; ... (as the recursion rolls back, x is 0 and we multiply by 2 every time)
; result is 1024

; (define (f n) (A 0 n)) -> 2*n
; (define (g n) (A 1 n)) -> n*(2^(n-1))
;   - all the solutions I can find say that this is 2^n, but for (A 1 0), I get back 0,
;   as opposed to 1 which should be result if the solution was 2^n
; (define (h n) (A 2 n)) -> 2 ↑↑ n which is 2 ↑ 2 ↑ 2 ↑ ...
