;Exercise 2.21.  The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.

;(square-list (list 1 2 3 4))
;(1 4 9 16)

;Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items))))) ;I assume they want us to do this to show how inefficient and cluttered this is...

(define (square-list items)
  (map (lambda (x) * x x) items))