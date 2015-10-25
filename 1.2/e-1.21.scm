; For each number starting from 2, test if n is divisible by it

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((is_divisible? n test-divisor) test-divisor)
        (else
          (find-divisor n (+ 1 test-divisor)))))

(define (is_divisible? a b)
  (= 0 (remainder a b)))

; #;8> (smallest-divisor 199)
; 199
; #;9> (smallest-divisor 1999)
; 1999
; #;10> (smallest-divisor 19999)
