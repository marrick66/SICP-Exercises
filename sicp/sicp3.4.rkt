;Exercise 3.4.  Modify the make-account procedure of exercise 3.3 by adding another local state variable so that, if an account is accessed more than seven consecutive times with an incorrect password, it invokes the procedure call-the-cops.

(define (make-account password balance)
  (define invalid-attempts 0)
  (define (password-matches submitted-pw)
    (if (eq? submitted-pw password)
        true
        (begin (set! invalid-attempts (+ invalid-attempts 1))
               (if (> invalid-attempts 7)
                   (call-the-police)))))
  (define (withdraw password amount)
    (cond ((not (password-matches password))
           "Invalid Password")
          ((> amount balance)
           "Insufficient Funds")
          (else
           (begin (set! balance (- balance amount))
                  balance))))
  (define (deposit password amount)
    (if (not (password-matches password))
           "Invalid Password"
           (begin (set! balance (+ balance amount))
                  balance)))
  (lambda (symbol)
    (cond ((eq? symbol 'withdraw) withdraw)
          ((eq? symbol 'deposit) deposit)
          (else
           "Unknown procedure!"))))