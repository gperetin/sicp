(load "common.scm")

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                            m))
         (else
           (remainder (* base (expmod base (- exp 1) m))
                      m))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds))
  (newline))

(define (start-prime-test n start-time)
  (if (fast-prime? n 2)
    (report-prime (- (current-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


; Since times for any prime number < 100000000 were pretty much 0ms, I only
; ran this for 1000000000 and above. In 1.23, we had timings of ~13 ms.

; 1000000007 *** 0.0
; 1000000009 *** 0.0
; 1000000021 *** 1.0

; we see a lot of improvement. Fermat test has O(logn), as compared to our
; basic primality test which had O(sqrt(n)). O(logn) grows a lot slower than
; O(sqrt(n)), therefore speedup is expected.
