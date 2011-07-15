;Exercise 1.37.  a. An infinite continued fraction is an expression of the form


;As an example, one can show that the infinite continued fraction expansion with the Ni and the Di all equal to 1 produces 1/, where  is the golden ratio (described in section 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation -- a so-called k-term finite continued fraction -- has the form


;Suppose that n and d are procedures of one argument (the term index i) that return the Ni and Di of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k-term finite continued fraction. Check your procedure by approximating 1/ using

;(cont-frac (lambda (i) 1.0)
;           (lambda (i) 1.0)
;           k)

;for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?

(define (cont-frac n d k)
  (let ((n-val (n k))
        (d-val (d k)))
        (if (= 1 k)
            (/ n-val d-val)  ;Via the example, the last term can be reduced to n/d
            (/ n-val
               (+ d-val 
                  (cont-frac n d (- k 1)))))))

;After thinking about this and working it out, this function works only because the lambdas return 1.0 regardless of the term.
;For example, if the first lambda was the identity function, the calculation would be incorrect.  Here's a corrected version, although it's
;not nearly as clean:

(define (cont-frac-corrected n d k)
  (define (cont-frac-with-pos n d k current)
  (let ((n-val (n current))
        (d-val (d current)))
        (if (= current k)
            (/ n-val d-val)  ;Via the example, the last term can be reduced to n/d
            (/ n-val
               (+ d-val 
                  (cont-frac-with-pos n d k (+ 1 current)))))))
  (cont-frac-with-pos n d k 1))
