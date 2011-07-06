;Exercise 1.29.  Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.

(define (sum term a next b) ;Higher-order sum procedure, as given by the book.
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx) ;Given integral formula
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (cube x)
  (* x x x))

(define (quad x)
  (* x x x x))

(define (even? number)
  (= (remainder number 2) 0))

(define (simpsons-rule f a b n)
  (define (get-coeff current limit)
    (cond ((or (= 0 current) (= current limit)) 1)
          ((even? current) 2)
          (else 4)))
  (define (h-term a b n)
    (/ (- b a) n))
  (define (y-term k)
    (* (get-coeff k n) (f (+ a (* k (h-term a b n))))))
  (define (next-term term)
    (+ term 1))
  (* (/ (h-term a b n) 3)
     (sum y-term 0 next-term n)))

;Was originally confused by the mathematics notation, and had to do some calculus refreshing.  This video from PatrickJMT cleared up what I was doing wrong: http://www.youtube.com/watch?v=ns3k-Lz7qWU.  Will have to be more critical of how I wrote this, by using the block structure, I avoided having to pass all the original parameters and the headache of figuring out how to modify(if necessary) the sum procedure. 
