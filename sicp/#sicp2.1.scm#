;Exercise 2.1. Define a better version of make-rat that handles both positive and negative
;arguments. Make-rat should normalize the sign so that if the rational number is positive,
;both the numerator and denominator are positive, and if the rational number is negative,
;only the numerator is negative

(define (make-rat num denom)
(cond ((or 
	(and (> num 0) (< denom 0))
	(and (< num 0) (< denom 0)))
	(cons (* -1 num) (* -1 denom)))
	(else (cons num denom))))
	

