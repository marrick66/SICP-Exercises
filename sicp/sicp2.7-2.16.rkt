;This consolidates all the exercises from 2.1.4 at http://mitpress.mit.edu/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1.4

;Common code
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

;Exercise 2.7.  Alyssa's program is incomplete because she has not specified the implementation of the interval abstraction. Here is a definition of the interval constructor:

(define (make-interval a b) (cons a b))

;Define selectors upper-bound and lower-bound to complete the implementation.

(define (bound selector segment)
  (let ((x (car segment))
        (y (cdr segment)))
    (selector x y)))

(define (upper-bound segment)
  (bound max segment))

(define (lower-bound segment)
  (bound min segment))

;Exercise 2.8.  Using reasoning analogous to Alyssa's, describe how the difference of two intervals may be computed. 
;Define a corresponding subtraction procedure, called sub-interval.

;Since upper-bound and lower-bound choose their value regardless of order of points, we just have to subtract the upper-bounds and lower-bounds of x and y,
;respectively

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;Exercise 2.9.  The width of an interval is half of the difference between its upper and lower bounds. 
;The width is a measure of the uncertainty of the number specified by the interval. 
;For some arithmetic operations the width of the result of combining two intervals is a function only of the widths of the argument intervals, 
;whereas for others the width of the combination is not a function of the widths of the argument intervals. 
;Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted).
;Give examples to show that this is not true for multiplication or division.

(define (width interval)
  (/ (- (upper-bound interval)(lower-bound interval))
   2))

;if we substitute and expand the formula for the addition, the overall width of the sum of two intervals is:
;((x-upper + y-upper) - (x-lower + y-lower)) / 2

;using the commutative property of addition, we can rearrange the terms to this:
;((x-upper - x-lower) + (x-upper - x-lower)) / 2

;then using the additive properties of fractions, it's further rearranged into:
;(x-upper - x-lower) /2 + (y-upper - y-lower) /2

;the result is the sum of each intervals widths. Since you cannot rearrange terms like this using multiplication or division, it's not possible
;for the total width to be expressed in terms of the product or quotient of the widths of each interval.

;Exercise 2.10.  Ben Bitdiddle, an expert systems programmer, looks over Alyssa's shoulder and comments that it is not clear what it means to divide by 
;an interval that spans zero. Modify Alyssa's code to check for this condition and to signal an error if it occurs.

(define (div-interval x y)
  (if (= (width y) 0)
      (error "cannot divide by a zero length interval!")
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))

