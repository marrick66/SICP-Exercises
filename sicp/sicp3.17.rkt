;Exercise 3.17.  Devise a correct version of the count-pairs procedure of exercise 3.16 that returns the number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining an auxiliary data structure that is used to keep track of which pairs have already been counted.)

(define (last-pair x)
    (if (null? (cdr x))
        x
        (last-pair (cdr x))))
;Exercise 3.17.  Devise a correct version of the count-pairs procedure of exercise 3.16 that returns the number of distinct pairs in any structure. (Hint: Traverse the structure, maintaining an auxiliary data structure that is used to keep track of which pairs have already been counted.)

(define (count-pairs x)
  (let ((existing-pairs '()))
  (define (append-existing! item)
    (if (null? existing-pairs)
        (set! existing-pairs (list item))
        (set-cdr! (last-pair existing-pairs) (list item))))
  (define (count-distinct x)
    (if (not (pair? x))
        0
        (if (not (member x existing-pairs))
            (begin
              (append-existing! x)
              (+ (count-distinct (car x))
                 (count-distinct (cdr x))
                 1))
            0)))
  (count-distinct x)))

(define pair1 (cons 'a 'b))
(define pair2 (cons 'c 'd))
(define pair3 (cons 'e 'f))

(set-car! pair1 pair2)
(set-cdr! pair1 pair3)
(set-car! pair2 pair3)
(set-cdr! pair2 pair3)

(count-pairs pair1)




