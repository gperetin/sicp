; f(n) = n, if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3), if n >= 3

; Recursive process
(define (f-rec n)
  (cond ((< n 3) n)
        (else (+
                (f-rec (- n 1))
                (* 2 (f-rec (- n 2)))
                (* 3 (f-rec (- n 3)))))))


; Iterative process
; a is f(n-3)
; b is f(n-2)
; c is f(n-1)
; We count from n to 0. When count hits 0, f(n) is in c (that was f(n-1)
; in a previous step)
(define (f-iter-rec a b c count)
  (if (= count 0)
    c
    (f-iter-rec b c (+ c (* 2 b) (* 3 a)) (- count 1))))

; We provide start values for f(n-3), f(n-2) and f(n-1) as a, b and c
; respectively. Since we already calculated those, we'll start the
; count from 2 below n.
; Eg. if n is 10, we'll start the count with 8, so we'll do 8 iterations.
(define (f-iter n)
  (cond ((< n 3) n)
        (else (f-iter-rec 0 1 2 (- n 2)))))


; Here's another solution to the iterative problem, found here:
; http://wayback.archive.org/web/20111205054038/http://vedantk.tumblr.com/post/8424437797/sicp-is-under-attack-updated
; As opposed to counting down, this one counts up, starts at 3 and goes up.
(define (f2 n)
  (define (f2-iter a b c count)
    ; f(n) = a + b + c = f(n-1) + 2f(n-2) + 3f(n-3).
    ; Use f(n) to calculate f(n+1) = f(n) + 2f(n-1) + 3f(n-2).
    (if (= count (+ n 1))
        a
        (f2-iter (+ a b c) (* 2 a) (* 3 (/ b 2)) (+ count 1))))
  (if (< n 3)
      n
      ; f(3) = f(2) + 2f(1) + 3f(0).
      (f2-iter 2 2 0 3)))

; Here's the call sequence for that solution, for n=5
; (f2-iter 2 2 0 3)
; (f2-iter 4 4 3 4)
; (f2-iter 11 8 6 5)
; (f2-iter 25 16 12 6)
; -> returns 25

