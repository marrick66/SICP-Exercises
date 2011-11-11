;Exercise 3.7.  Consider the bank account objects created by make-account, with the password modification described in exercise 3.3. Suppose that our banking system requires the ability to make joint accounts. Define a procedure make-joint that accomplishes this. Make-joint should take three arguments. The first is a password-protected account. The second argument must match the password with which the account was defined in order for the make-joint operation to proceed. The third argument is a new password. Make-joint is to create an additional access to the original account using the new password. For example, if peter-acc is a bank account with password open-sesame, then

;(define paul-acc
;  (make-joint peter-acc 'open-sesame 'rosebud))

;will allow one to make transactions on peter-acc using the name paul-acc and the password rosebud. You may wish to modify your solution to exercise 3.3 to accommodate this new feature.

;Modified account procedure that accomodates multiple account passwords, and adding additional passwords

(define (make-account password balance) ;Balance is already in scope, pass by reference type?
  (let ((account-passwords (list password)))
  (define (password-matches submitted-pw)
    (define (password-match submitted original-list)
      (cond ((empty? original-list) false)
            ((eq? (car original-list) submitted) true)
            (else
             (password-match submitted (cdr original-list)))))
    (password-match submitted-pw account-passwords))
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
   (define (add-password new-password)
     (set! account-passwords (append (cons new-password account-passwords))))
  (lambda (symbol)
    (cond ((eq? symbol 'withdraw) withdraw)
          ((eq? symbol 'deposit) deposit)
          ((eq? symbol 'matches-password))
          ((eq? symbol 'add-password) add-password)
          (else
           "Unknown procedure!")))))

(define (joint-account original-account existing-password new-password)
  (let ((matches-password (original-account 'matches-password))
        (add-password (original-account 'add-password)))
    (if (not (matches-password existing-password))
        "Invalid Password!"
        (begin (add-password new-password) original-account))))