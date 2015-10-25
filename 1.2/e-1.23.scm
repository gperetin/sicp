(define (square a)
  (* a a))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (current-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  (newline))

; With now improved timed-prime-test (smallest-divisor now doesn't check
; for multiples of 2), run timed-prime-test for 12 numbers from e-1.22.

; ==== 1000 ====
; 1009 *** 0.0
; 1013 *** 0.0
; 1019 *** 0.0

; ==== 10000 ====
; 10007 *** 0.0
; 10009 *** 0.0
; 10037 *** 0.0

; ==== 100000 ====
; 100003 *** 1.0
; 100019 *** 0.0
; 100043 *** 1.0

; ==== 1000000 ====
; 1000003 *** 1.0
; 1000033 *** 1.0
; 1000037 *** 1.0 


; ==== 100000000 ====
; 100000007 *** 6.0
; 100000037 *** 5.0
; 100000039 *** 5.0

; ==== 1000000000 ====
; 1000000007 *** 14.0
; 1000000009 *** 12.0
; 1000000021 *** 13.0

; Since the modification we introduced here has half the number of steps
; when compared to 1.22, we should expect 2x the speedup.
; Did we get it?
; Approximately yes. It's not exactly 2x because we've introduced (cond)
; statement in next function which also needs to be evaluated.
