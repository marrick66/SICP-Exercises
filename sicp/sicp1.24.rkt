;Exercise 1.22.  Most Lisp implementations include a primitive called runtime that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n, prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.

;Note: the prime? function is not defined, will use the fast-primes method in the text as a substitute.
(define (expmod number expt modnum)
  (define (even? num)
    (= (remainder num 2) 0))
  (define (square num)
    (* num num))
  (cond ((= 0 expt) 1) ;Any number to the zero exponent is one, any 1 mod n(except zero) = 1
        ((even? expt)
         (remainder (square (expmod number (/ expt 2) modnum)) modnum))
         (else
          (remainder (* number (expmod number (- expt 1) modnum)) modnum))))

(define (fermat-test number)
  (define testnumber (+ 2 (random (- number 2))))
  (= (remainder testnumber number)
     (expmod testnumber number number)))

(define (fast-prime number times)
  (cond ((= times 0) true)
        ((fermat-test number)
         (fast-prime number (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime n 100)
      (report-prime (- (runtime) start-time))))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(define (test-odd-prime-range start end)
  (define (even? num)
    (= (remainder num 2) 0))
  (cond ( (or (= start end) (> start end)) nil)
        ((even? start)
         (test-odd-prime-range (+ start 1) end))
        (else
         (timed-prime-test start)
         (test-odd-prime-range (+ start 2) end))))

;After experimentation, the time elapsed is less than the growth factor of root 10.  While the algorithm math is solid, it doesn't mean that actual computing time will be the same.  The lower amount of time could be contributed to interpreter and machine optimizations, as well as the accuracy of the runtime function(microseconds?, maybe should be nanoseconds?).
