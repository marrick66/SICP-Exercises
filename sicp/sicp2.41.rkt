;Exercise 2.41.  Write a procedure to find all ordered triples of distinct positive integers i, j, and k less than or equal to a given integer n that sum to a given integer s.

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

(define (find-triples n s)
  (filter (lambda (triple)
            (= s (+ (car triple) (cadr triple) (caddr triple))))
  (flatmap (lambda (x)
             (flatmap (lambda (y)
                    (map (lambda (z)
                           (list x y z))
                         (enumerate-interval 1 (- n 2))))
                  (enumerate-interval 1 (- n 1))))
           (enumerate-interval 1 n))))

(define (find-distinct-triples n s)
  (filter (lambda (triple)
            (= s (+ (car triple) (cadr triple) (caddr triple))))
  (flatmap (lambda (x)
             (flatmap (lambda (y)
                    (map (lambda (z)
                           (list x y z))
                         (remove x (remove y (enumerate-interval 1 n)))))
                  (remove x (enumerate-interval 1 n))))
           (enumerate-interval 1 n))))




