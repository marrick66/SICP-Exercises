;Exercise 2.33 Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations:

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append list1 list2)
  (accumulate cons list2 list1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))