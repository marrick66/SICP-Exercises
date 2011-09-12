;Exercise 2.54.  Two lists are said to be equal? if they contain equal elements arranged in the same order. For example,

(equal? '(this is a list) '(this is a list))

;is true, but

(equal? '(this is a list) '(this (is a) list))

;is false. To be more precise, we can define equal? recursively in terms of the basic eq? equality of symbols by saying that a and b are equal? 
;if they are both symbols and the symbols are eq?, or if they ;are both lists such that (car a) is equal? to (car b) and (cdr a) is equal? to (cdr b). 
;Using this idea, implement equal? as a procedure.

(define (equal? list1 list2)
  (cond ((null? list1) true)
        ((number? (car list1))
         (and 
              (number? (car list2))
              (= (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        ((symbol? (car list1))
         (and 
              (symbol? (car list2))
              (eq? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        ((pair? (car list1))
         (and (pair? (car list2))
              (equal? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        (else false)))