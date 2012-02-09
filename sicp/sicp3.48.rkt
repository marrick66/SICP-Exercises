;Exercise 3.48.  Explain in detail why the deadlock-avoidance method described above, (i.e., the accounts are numbered, and each process attempts to acquire the smaller-numbered account first) avoids deadlock in the exchange problem. Rewrite serialized-exchange to incorporate this idea. (You will also need to modify make-account so that each account is created with a number, which can be accessed by sending an appropriate message.)

;Specifically for the exchange problem, by numbering the accounts and always acquiring the lowest account first, we ensure that the accounts are always accessed in the same order, regardless of how they were passed into the procedure.  Therefore, exchanging a2 with a1 is procedurally equivalent to exchanging a1 with a2.


(define (make-account number initial-balance)
  (let ((balance initial-balance)
        (serializer (make-serializer))
        (account-number number))
    (define (withdraw amount)
      (if (> balance amount)
          (set! balance (- balance amount))
          (error "Not enough funds")))
    (define (deposit amount)
      (set! balance (+ balance amount)))
    (define (account m)
      (cond ((eq? m 'serializer) serializer)
            ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'account-number) account-number)))
    account))

(define (serialized-exchange a1 a2)
  (if (> ((a1 'account-number)) ((a2 'account-number)))
      (let ((serializer1 (a1 'serializer))
            (serializer2 (a2 'serializer)))
        ((serializer1 (serializer2 exchange))
         a1
         a2))
      (let ((serializer1 (a2 'serializer))
            (serializer2 (a1 'serializer)))
        ((serializer 1 (serializer2 exchange))
         a2
         a1))))