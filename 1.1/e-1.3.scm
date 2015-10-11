(define (square a) (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (sum-of-squares-larger a b c)
  (cond ((> a b)
         (cond ((> b c) (sum-of-squares a b))
               (else (sum-of-squares a c))))
        (else
          (cond ((> a c) (sum-of-squares a b))
                (else (sum-of-squares b c))))))
