;Exercise 3.16.  Ben Bitdiddle decides to write a procedure to count the number of pairs in any list structure. ``It's easy,'' he reasons. ``The number of pairs in any structure is the number in the car plus the number in the cdr plus one more to count the current pair.'' So Ben writes the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

;Show that this procedure is not correct. In particular, draw box-and-pointer diagrams representing list structures made up of exactly three pairs for which Ben's procedure would return 3; return 4; return 7; never return at all.

(define pair1 (cons 'a 'b))
(define pair2 (cons 'c 'd))
(define pair3 (cons 'e 'f))

;This sets the car of the third pair to the second pair, which adds an additional call to count-pairs on 
;pair2
;(set-car! pair1 pair2)
;(set-cdr! pair1 pair3)
;(set-car! pair3 pair2)

;By having pair 1 and pair 2 pointing to each other, the procedure should never terminate
;(set-car! pair1 pair2)
;(set-cdr! pair1 pair3)
;(set-car! pair2 pair1)

;By having the car and cdr of pair 1 pointing to pair 2, and the car and cdr of pair 2 pointing to pair 3, the
;count becomes 7
;(set-car! pair1 pair2)
;(set-cdr! pair1 pair2)
;(set-car! pair2 pair3)
;(set-cdr! pair2 pair3)

