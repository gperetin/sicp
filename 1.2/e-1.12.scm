; Pascal triangle
;      1
;    1   1
;  1   2   1
;1   3   3   1
; ...

; Write a procedure that computes elements of Pascal triangle by means
; of a recursive process.

; I'll assume that inputs to the function are row and column of the element
; that we need to compute.

; We'll define this as a simple recursion, following the mathematical model
; f(r, c) = 1 if column is 1 or equal to row (row n has n columns, rightmost
;   one is 1)
; f(r, c) = f(r-1, c-1) + f(r-1, c) otherwise

; row and col in this solution are 1-based

(define (pascal-elem row col)
  (cond ((or (= col 1) (= col row)) 1)
        (else (+
                (pascal-elem (- row 1) (- col 1))
                (pascal-elem (- row 1) col)
                ))))
