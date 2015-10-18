; When we apply transformation:
; Tpq:
; a <- bq + aq + ap
; b <- bp + aq
; to itself, we get:
; a <- b(2pq + q^2) + a(2q^2 + 2pq + p^2)
; b <- b(p^2 + q^2) + a(2pq + q^2)

; Since we're looking for something that matches:
; a <- bq' + aq' + ap'
; b <- bp' + q'a
; just by looking at 'b' we can deduce that:

; p' = p^2 + q^2
; q' = 2pq + q^2

; Here's the entire program with these fit in.

(define (even? n)
  (= (remainder n 2) 0))

(define (square a)
  (* a a))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))
                   (+ (* 2 p q) (square q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
