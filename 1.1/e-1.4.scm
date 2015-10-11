; Operator (+ or -) is decided in an if clause
(define (a-plus-abs-b a b)
  ((if (> 0 b) - +) a b))
