;Exercise 3.47.  A semaphore (of size n) is a generalization of a mutex. Like a mutex, a semaphore supports acquire and release operations, but it is more general in that up to n processes can acquire it concurrently. Additional processes that attempt to acquire the semaphore must wait for release operations. Give implementations of semaphores

;a. in terms of mutexes

;b. in terms of atomic test-and-set! operations.

;Prerequisites:
(define (make-mutex)
  (let ((cell (list false)))            
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))

(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))

;a.  
(define (make-semaphore n)
  (let ((current-processes 0)
        (mutex (create-mutex)))
    (define (increment-processes)
             (set! current-process (+ current-process 1)))
    (define (decrement-processes)
             (set! current-process (- current-process 1)))
    (define (acquire) 
      (begin
        (mutex 'acquire)
        (if (= current-processes n)
            (begin (mutex 'release)
                   (acquire))
            (begin (increment-processes)
                   (mutex 'release)))))
    (define (release)
      (begin
        (mutex 'acquire)
        (decrement-processes)
        (mutex 'release)))
    (define (the-semaphore message)
    (cond ((eq? message 'acquire) acquire)
          ((eq? message 'release) release)))
  the-semaphore))

;b.

(define (test-and-set! cells)
  (if (empty? cells)
      true
      (if (not (car cells))
          (begin
            (set-car! cells true)
            false)
          (test-and-set! (cdr cells)))))

(define (clear! cells)
  (if (not (empty? cells))
      (if (car cells)
          (set-car! cells false)
          (clear! (cdr cells)))))

(define (make-semaphore n)
  (define (make-cells start num)
    (if (= num 0)
        start
        (make-cells (append start (list false)) (- n 1))))
  (let ((cells (make-cells n)))
    (define (acquire)
      (if (test-and-set! cells)
          acquire
          false))
    (define (release)
      (clear! cells))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire) acquire)
            ((eq? m 'release) release)))
    the-semaphore))

