;Exercise 3.3.  Modify the make-account procedure so that it creates password-protected accounts. That is, make-account should take a symbol as an additional argument, as in

;(define acc (make-account 100 'secret-password))

;The resulting account object should process a request only if it is accompanied by the password with which the ;account was created, and should otherwise return a complaint:

;((acc 'secret-password 'withdraw) 40)
;60

;((acc 'some-other-password 'deposit) 50)
;"Incorrect password"

(define (make-account password balance)
  (define (password-matches submitted-pw)
    (eq? password submitted-pw))
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


           