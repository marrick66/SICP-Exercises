;Exercise 3.21

;The interpreter displays the queue object correctly, it's just
;the interpretation of the results that is incorrect.  Since
;a queue is basically a pair of pointers, it displays the contents
;of those pointers. In the instance of the queue that has been 
;emptied, the front pointer points to the empty list.  The rear
;pointer still points to the last item in the queue, and displays
;that.

;So, if we just want to see what's in the queue, just print the
;value of the front-ptr

;Prerequisites
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-queue? queue) (null? (front-ptr queue)))
(define (make-queue) (cons '() '()))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue)))) 

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue))) 

(define (print-queue queue)
  (front-ptr queue))