(define (fact-iter n product counter)
  (if (> counter n)
    product
    (fact-iter n (* product counter) (+ counter 1))))

(define (factorial n)
  (fact-iter n 1 1))
