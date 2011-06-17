;Exercise 1.16.  Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. 


(define (fast-expt number exponent)
  (define (square x)  ;Just to save space, define these using block structure...   
    (* x x))
  (define (even? x)
    (= (remainder x 2) 0))
  (define (fast-expt-log num expt inv-product)
    (cond ((= expt 0) inv-product) ;Exponent is 0, equivalent to 1, so we just return the invariant product.
          ((even? expt) (fast-expt-log num (/ expt 2) (* inv-product (square num)))) ;The exponent is even, so we can multiply the invariant by the square of the number, and reduce the exponent by half.
          (else (fast-expt-log num (- expt 1) (* inv-product num))))) ;Otherwise, reduce the exponent by one and multiply the invariant by the number.
  (fast-expt-log number exponent 1))
  