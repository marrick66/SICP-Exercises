;Exercise 2.59.  Implement the union-set operation for the unordered-list representation of sets.

;Prerequisite procedures from the book:

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (filter predicate items)
  (if (null? items) 
      nil
      (if (predicate (car items))
          (cons (car items) (filter predicate (cdr items)))
          (filter predicate (cdr items)))))

(define (union-set set1 set2) ;We first find the intersection of the two sets, filter out the unique values from the first set, then append the resulting set to the second set.
  (let ((intersection (intersection-set set1 set2)))
    (append 
     (filter (lambda (element) (not (element-of-set? element intersection))) 
             set1)
            set2)))
