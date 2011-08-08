;Exercise 2.6.  In case representing pairs as procedures wasn't mind-boggling enough, consider that, in a language that can manipulate procedures, 
;we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as

(define zero (lambda (y) (lambda (z) z))) ;variables renamed for substitution clarity...

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc n)
    (+ n 1))

;This representation is known as Church numerals, after its inventor, Alonzo Church, the logician who invented the  calculus.

;Define one and two directly (not in terms of zero and add-1). (Hint: Use substitution to evaluate (add-1 zero)). 
;Give a direct definition of the addition procedure + (not in terms of repeated application of add-1).

(define one
  (lambda (f) ;is a procedure that takes another procedure
    (lambda (x) ;and creates another procedure
      (f ;That applies the originally passes procedure
       (((lambda (y) (lambda (z) z)) f) ;to the evaluation of the zero procedure with the original procedure passed
        x))))) ;applied to x

(define two
  (lambda (f)
    (lambda (x)
      (f (f (((lambda (y) (lambda (z) z)) f) x))))))

(define (add f1 f2)
  (lambda (f)
    (lambda (x)
      ((f1 f) ((f2 f) x)))))