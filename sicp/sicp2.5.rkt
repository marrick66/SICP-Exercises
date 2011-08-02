;Exercise 2.5.  Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2a 3b. Give the corresponding definitions of the procedures cons, car, and cdr.

;Our implementation of cons, car, and cdr must follow the general contract of collectors and constructors, such that:
;(car (cons x y)) -> x
;(cdr (cons x y)) -> y

;If cons is the simplest case of just returning 2^x * 3^y, it can be implemented like this:
(define (cons x y)
  (define (expt base power)
    (cond ((= power 0) 1)
          ((= power 1) base)
          (else
           (* base (expt base (- power 1))))))
  (let ((new-x (expt 2 x))
        (new-y (expt 3 y)))
    (* new-x new-y)))


;I need to look up the math, but if we take the axiom that 2 to some power is never divisible by 3, and vice versa we can use this general method
;to find the highest power of a number that divides into another. Confused, yet?
(define (find-power number inv base start-power)
  (if 
   (or (> (* inv base) number)
       (> (remainder (/ number inv) base) 0)) 
       start-power
      (find-power number (* inv base) base (+ start-power 1))))

(define (car number)
  (find-power number 1 2 0))

(define (cdr number)
  (find-power number 1 3 0))

