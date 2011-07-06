;Via the text, where n is even, a^n mod n is equivalent to (a^(n/2) mod n) mod n.  This makes the expmod procedure O(log n) as opposed to O(n). For odd numbers, a^n mod n is equivalent to (a*(a^(n-1) mod n)) mod n.

;For the fermat test, a probabilistic algorithm is used to determine if a number is prime or not.  If the test fails, the number is definitely not prime.  If it passes, there is a probability that it is prime.  Successive trials with different random numbers will increase this probability. 

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

  
