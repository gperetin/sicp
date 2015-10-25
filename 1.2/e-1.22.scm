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
; 1009 *** 0.0
; 1013 *** 0.0
; 1019 *** 0.0

; ==== 10000 ====
; 10007 *** 0.0
; 10009 *** 0.0
; 10037 *** 0.0

; ==== 100000 ====
; 100003 *** 0.0
; 100019 *** 0.0
; 100043 *** 0.0

; ==== 1000000 ====
; 1000003 *** 0.0
; 1000033 *** 1.0
; 1000037 *** 1.0

; ==== 100000000 ====
; 100000007 *** 9.0
; 100000037 *** 6.0
; 100000039 *** 6.0

; ==== 1000000000 ====
; 1000000007 *** 20.0
; 1000000009 *** 22.0
; 1000000021 *** 28.0

; Is growth proportional to sqrt(10) (about 3.16)?
; Beginning numbers are too small, but for larger numbers, yes it is.
