; In how many ways can we exchange any given amount of money?
; Coins are of predefined denominations

; Modeled as a recursive procedure. If we arrange the types of coins that we
; have, then following holds:

; The number of ways to change amount a using n kinds of coins equals:
; - number of ways to change amount a using all but the first kind of coin, plus
; - number of ways to change amount a - d using all n kinds of coins, where d is
; the denomination of the first kind of coin

; The reason this works is that we can divide all possible changes into two
; groups, those that don't use any of a certain type of the coin, and those
; that do.
; - first, number of ways to change full amount using all coins but the first
; one
; - and second, number of ways to change amount - denomination of the first
; coin. We substract the denomination to signify that we already used that
; coin.
; This forms a recursive tree process where each node signifies the coin
; used at that stage.

(define (count-change amount)
  (cc amount 5)) ; we'll use 5 types of coins

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= 0 kinds-of-coins)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                  (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))

; first-denomination returns the denomination of the largest coins
; We assume coins are ordered from largest to smallest, and that's how we
; remove them.
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

