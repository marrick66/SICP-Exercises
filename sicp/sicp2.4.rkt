;Exercise 2.4.  Here is an alternative procedural representation of pairs. For this representation, verify that (car (cons x y)) yields x for any objects x and y.

(define (cons x y)
  (lambda (m) (m x y))) ;Creates a function that takes a function, and applies it to x and y.

(define (car z)
  (z (lambda (p q) p))) ;Passes a function that returns the first of two arguments to the function passed in, in this case cons.

;What is the corresponding definition of cdr? (Hint: To verify that this works, make use of the substitution model of section 1.1.5.)

(define (cdr z)
  (z (lambda (p q) q)))
