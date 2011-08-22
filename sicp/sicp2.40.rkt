;Exercise 2.40.  Define a procedure unique-pairs that, given an integer n, generates the sequence of pairs (i,j) with 1< j< i< n. Use unique-pairs to simplify the definition of prime-sum-pairs given above.

;Helper functions
(define (enumerate-interval start end)
  (if (> start end)
      nil
      (cons start
            (enumerate-interval (+ 1 start) end))))

(define (map func items)
  (if (null? items)
      nil
      (cons (func (car items))
            (map func (cdr items)))))

(define (filter predicate items)
  (cond ((null? items) nil)
        ((predicate (car items))
         (cons (car items)
               (filter predicate (cdr items))))
        (else
         (filter predicate (cdr items)))))

(define (accumulate proc initial sequence)
  (if (null? sequence)
      initial
      (proc (car sequence)
            (accumulate proc initial (cdr sequence)))))


(define (flatmap proc sequence)
  (accumulate append nil (map proc sequence)))

(define (remove item sequence)
  (filter (lambda (x) (not (equal? item x))) sequence))

(define (permutations sequence)
  (if (null? sequence)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (y)
                        (cons x y))
                      (permutations (remove x sequence)))) 
               sequence)))

(define (unique-pairs n)
  (flatmap (lambda (i)
         (map (lambda (j) (list i j))
              (enumerate-interval 1 (- i 1))))
       (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (filter (lambda (x)
            (prime? (+ (car x) (cdr x))))
          (unique-pairs n)))

