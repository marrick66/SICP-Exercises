;Exercise 3.13.  Consider the following make-cycle procedure, which uses the last-pair procedure defined in exercise 3.12:

(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

;Draw a box-and-pointer diagram that shows the structure z created by

(define z (make-cycle (list 'a 'b 'c)))

;What happens if we try to compute (last-pair z)?

;Make cycle takes a list and sets the last element of the last pair to the front of the list.  This is no longer
;a list structure, since there is no terminating null value.  Trying to compute last-pair will loop infinitely, ;due to this.