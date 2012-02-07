;Exercise 3.23 - Implemend a double ended queue

;To be able to accommodate removing items from the end of the queue,
;each item will store a pointer to the previous item.

(define (make-deque)
	(cons '() '()))



(define (front-deque deque)
	(car (front-ptr deque)))

(define (rear-deque deque)
	(cdr (rear-ptr deque)))

(define (front-insert-deque! deque item)
	(let ((new-item (cons (cons item '()) nil)))
          (if (is-empty? deque)
              (begin
                (set-front-ptr! deque new-item)
                (set-rear-ptr! deque new-item))
              (begin
                (set-previous-item! (previous-item (front-ptr deque)) new-item)
                (set-cdr! new-item (front-ptr deque))
                (set-front-ptr! deque new-item)))))

(define (rear-insert-deque! deque item)
  (let ((new-item (cons (cons item '()) nil)))
    (if (is-empty? deque)
        (front-insert-deque! deque item)
        (begin
          (set-previous-item! new-item (rear-ptr deque))
          (set-cdr! (rear-ptr deque) new-item)
          (set-rear-ptr! deque new-item)))))

(define (front-delete-deque! deque)
  (cond ((is-empty? deque) (error "Queue is empty!"))
        ((eq? (front-ptr deque) (rear-ptr deque)) 
         (begin (set-front-ptr! deque '()) (set-rear-ptr! deque '())))
        (else
         (begin (set-front-ptr! deque (cdr (front-ptr deque))) (set-previous-item! (previous-item (front-ptr deque)) '())))))

(define (rear-delete-deque! deque)
  (cond ((is-empty? deque) (error "Queue is empty!"))
        ((eq? (front-ptr deque) (rear-ptr deque))
         (begin (set-frot-ptr! deque '()) (set-rear-ptr! deque '())))
        (else
         (set-rear-ptr! deque (previous-item (rear-ptr deque))))))

;Misc needed for implementation
(define (is-empty? deque)
  (null? (front-ptr deque)))

(define (front-ptr deque)
	(car deque))

(define (rear-ptr deque)
	(cdr deque))

(define (set-front-ptr! deque item)
	(set-car! deque item))

(define (set-rear-ptr! deque item)
	(set-cdr! deque item))

(define (previous-item item)
(car item))

(define (set-previous-item! item previous-item)
(set-cdr! item previous-item))

