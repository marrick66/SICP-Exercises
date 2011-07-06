;Exercise 1.31.   
;a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write an analogous procedure called product that returns the product of the values of a function ;at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to  using the formula


;b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

(define (identity x)
  x)

(define (next-term x)
  (+ x 1))

(define (product func next-term a b)
  (if (> a b) 1
      (* (func a) (product func next-term (next-term a) b))))

(define (product-iterative func next-term a b)
  (define (product-iter a b result)
    (if (> a b) result
        (product-iter (next-term a) b (* result (func a)))))
  (product-iter a b 1))

(define (factorial x)
  (product identity next-term 1 x))

(define (factorial-iter x)
  (product-iterative identity next-term 1 x))

