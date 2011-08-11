;Example code:

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;Exercise 2.17.  Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:

(define (last-pair items)
  (if (= (length items) 0)
      nil
      (list-ref items 
                (- (length items) 1))))

;Exercise 2.18.  Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

(define (reverse items)
  (if (= (length items) 0)
      nil
      (append (reverse (cdr items))
              (list (car items)))))
