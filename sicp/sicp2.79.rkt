;Exercise 2.79.  Define a generic equality predicate equ? that tests the equality of two numbers, and install it in the generic arithmetic package. This operation should work for ordinary numbers, rational numbers, and complex numbers.

(define (equ? num1 num2) (apply-generic 'equ? num1 num2)) ;Should error on arguments with different types, since it can't find a procedure in the table that matches two different types

;Packages
(define (install-scheme-number-package)
  (define equ? =)
  ;Rest of procedures omitted...
  (put 'equ? '(scheme-number scheme-number) equ?))

(define (install-rational-number-package)
  (define (equ? number1 number2)
    (and 
     (= (numer number1) (numer number2))
     (= (denom number1) (numer number2)))))
  ;Rest of procedures omitted...
  (put 'equ? '(rational rational) equ?))

(define (install-complex-number-package)
  (define (equ? number1 number2)
    (and
     (= (real-part number1) (real-part number2))  ;These should be deferred to the appropriate package for the 
     (= (imag-part number1) (imag-part number2))));number type: rectangular/polar
  ;Rest of procedures omitted...
  (put 'equ? '(complex complex) equ?))