(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponent? exp)
         (make-product 
          (make-product
           (exponent exp) (make-exponent (base exp) (make-sum -1 (exponent exp))))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

;Supplimental procedures

(define variable? symbol?)

(define (expression? item)
  (and (pair? item)
       (or (eq? (car item) '+)
           (eq? (car item) '*)
           (eq? (car item) '**))))

(define (same-variable? exp var)
  (and (variable? exp)
       (variable? var)
       (eq? exp var)))

(define (sum? exp)
  (and (pair? exp)
       (eq? (car exp) '+)))

(define (make-sum . terms)
  (let ((formatted-terms
         (if 
          (and
           (pair? (car terms))
           (not (expression? (car terms))))
          (car terms)
          terms)))
        (append (list '+) formatted-terms)))


(define (addend exp)
  (cadr exp))

 (define (augend exp)
    (if (null? (cdddr exp))
        (caddr exp)
        (make-sum (cddr exp))))

(define (product? exp)
  (and (pair? exp)
       (eq? (car exp) '*)))

(define (multiplier exp)
  (cadr exp))

(define (multiplicand exp)
  (if (null? (cdddr exp))
        (caddr exp)
        (make-product (cddr exp))))

(define (make-product . terms)
  (let ((formatted-terms
         (if 
          (and
           (pair? (car terms))
           (not (expression? (car terms))))
          (car terms)
          terms)))
        (append (list '*) formatted-terms)))

(define (=number? source match)
  (and (number? source)
       (= source match)))

(define (exponent? exp)
  (and
   (pair? exp)
   (eq? (car exp) '**)))

(define (make-exponent base exponent)
  (list '** base exponent))

(define (base exp)
  (cadr exp))

(define (exponent exp)
  (caddr exp))



