;Exercise 1.17.  The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

;(define (* a b)
;  (if (= b 0)
;      0
;      (+ a (* a (- b 1)))))

;This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a ;multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.


;Base case assumption when x * y using an invariant quantity: When y = 1, we return the invariant.
;When y is even: we add double x to the invariant, and halve y.
;Otherwise, add x to the invariant and subtract 1 from y.
;I assume subtraction is ok, if not, substitute with adding -1 instead.

(define (fast-mult x y)
  (define (even? num)
    (= (remainder num 2) 0))
  (define (double num)
    (* num 2))
  (define (half num)
    (/ num 2))
  (define (fast-mult-log num1 num2 inv)
    (cond ((= num2 1) inv)
          ((even? num2) (fast-mult-log num1 (half num2) (+ (double num1) inv)))
          (else (fast-mult-log num1 (- num2 1) (+ num1 inv)))))
  (fast-mult-log x y 0))

;This is wrong, obviously.  Will work it out on paper later...