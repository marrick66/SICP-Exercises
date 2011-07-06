;Exercise 1.33.  You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure. Show how to express the following using filtered-accumulate:

;a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

;b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).

(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a)
                              (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else
         (filtered-accumulate filter combiner null-value term (next a) next b))))

 (define (even? x)
   (= (remainder x 2) 0))
 
 (define (next-term x) ;For primes, as in the book, only check odds.
   (if (even? x) (+ 1 x)
       (+ 2 x)))
 
 (define (sum-of-prime-squares a b)
   (filtered-accumulate prime? + 0 square a next-term b)) 
 
 
 