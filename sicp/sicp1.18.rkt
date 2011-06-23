;Exercise 1.18.  Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

(define (fast-mult a b)
	(define (double x)
	(* x 2))
	(define (halve x)
	(/ x 2))
	(define (even? x)
	(= (remainder x 2) 0))
	(define (fast-mult iter a b inv)
		(cond ((= b 0) 0)
		      ((= b 1) (+ b inv))
		      (else
			(if (even? b) (fast-mult-iter (double a) (halve b) inv)
			(fast-mult-iter a (- b 1) (+ a inv))))))
	(fast-mult-iter a b 0))

			