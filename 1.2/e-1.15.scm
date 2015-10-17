; sin(x) = x if x is sufficiently small
; use:
; sin(x) = 3*sin(x/3) - 4*(sin^3(x/3)) to reduce the size of the argument

(define (cube x)
  (* x x x))

(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))


; How many times is procedure p applied for 12.15?
; (sine 12.15)
; (p (sine (4.05))
; (p (p (sine (1.35)))
; (p (p (p (sine (0.45)))))
; (p (p (p (p (sine (0.15))))))
; (p (p (p (p (p (sine 0.05))))))

; p is called 5 times

; Order of growth in space and number of steps is logarithmic, with a base
; of 3. That's because we decrease 3x on each iteration (this is similar
; to binary search tree, where on each iteration of the search, we reduce
; the number of nodes we have to consider by 2. Therefore complexity
; there is O(log2(n))
