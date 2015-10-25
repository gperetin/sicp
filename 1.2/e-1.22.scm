(load "common.scm")

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


; search-for-primes checks primality of consecutive odd integers in
; a given range
(define (search-for-primes a b)
  (cond ((>= a b) (newline) (display "done") (newline))
        ((= 0 (remainder a 2)) (search-for-primes (+ a 1) b))
        (else (timed-prime-test a)
              (search-for-primes (+ a 1) b))))


; Use search-for-primes to find 3 smallest prime numbers larger than:

; ==== 1000 ====
; (search-for-primes 1000 1040)
; 1009 *** 1.0
; 1013 *** 0.0
; 1019 *** 1.0

; ==== 10000 ====
; 10007 *** 5.0
; 10009 *** 4.0
; 10037 *** 4.0

; ==== 100000 ====
; 100003 *** 38.0
; 100019 *** 45.0
; 100043 *** 37.0

; ==== 1000000 ====
; 1000003 *** 363.0
; 1000033 *** 368.0
; 1000037 *** 376.0

; Is growth proportional to sqrt(10) (about 3.16)?
; It's pretty much spot on for 1000 -> 10000.
; for 100000 -> 1000000 it's off by a factor of 3.
