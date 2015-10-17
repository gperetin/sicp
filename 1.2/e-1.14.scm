; Form of the tree depends on:
; n - number of kinds of coins
; a - amount to change
; d1, ..., dn - denominations of the coins

; Proces is to sum(i, .., n) ki*di. If the sum equals to the amount,
; that's a way to exchange the money. k starts from zero
; 
; k1 (number of coins d1) goes from 0 to a/d1
; k2 goes from 0 to (a-k1d1)/d2
; pairs k1,k2 grow as a^2

; Therefore, time complexity is O(a^n)
; Ranges of indices for k grow proportionally to a, so space is O(a)
