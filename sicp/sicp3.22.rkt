;Exercise 3.22.  Instead of representing a queue as a pair of pointers, we can build a queue as a procedure with local state. The local state will consist of pointers to the beginning and the end of an ordinary list. Thus, the make-queue procedure will have the form

;(define (make-queue)
;  (let ((front-ptr ...)
;        (rear-ptr ...))
;    <definitions of internal procedures>
;    (define (dispatch m) ...)
;    dispatch))

;Complete the definition of make-queue and provide implementations of the queue operations using this representation.

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    (define (is-empty?)
      (null? front-ptr))
    (define (set-front-ptr! item)
      (set! front-ptr item))
    (define (set-rear-ptr! item)
      (set! rear-ptr item))
    (define (insert-queue! item)
      (let ((new-item (cons item nil)))
        (if (is-empty?)
            (begin (set-front-ptr! new-item) (set-rear-ptr! new-item))
            (begin (set-cdr! rear-ptr new-item) (set-rear-ptr! new-item)))))
    (define (delete-queue!)
      (if (is-empty?)
          (error "Queue is empty!")
          (let ((removed-item (car front-ptr)))
            (set-front-ptr! (cdr front-ptr))
            removed-item)))
    (define (dispatch message)
      (cond
        ((eq? message 'is-empty?) is-empty?)
        ((eq? message 'insert-queue!) insert-queue!)
        ((eq? message 'delete-queue!) delete-queue!)))
    dispatch))


