
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((is_divisible? n test-divisor) test-divisor)
        (else
          (find-divisor n (+ 1 test-divisor)))))

(define (is_divisible? a b)
  (= 0 (remainder a b)))

(define (prime? n)
  (= (smallest-divisor n) n))
