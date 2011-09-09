;Exercise 2.42

;Prerequisite functions

(define (enumerate-interval start end)
  (if (> start end)
      nil
      (cons start (enumerate-interval (+ start 1) end))))

(define (map func sequence)
  (if (null? sequence)
      nil
      (cons (func (car sequence))
            (map func (cdr sequence)))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate func initial sequence)
  (if (null? sequence)
      initial
      (func (car sequence)
            (accumulate func initial (cdr sequence)))))

(define (flatmap func sequence)
  (accumulate append nil (map func sequence)))

;Given queens procedure:
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;Procedures needed to complete queens procedure:
(define (adjoin-position row k existing)
 (cons (cons k row) existing))

(define empty-board (list (cons 0 0))) ;An empty board is a list with the position (0,0)

(define (safe? k positions)
 true)

;Sample scratch data:
(define first-possibility (list (cons 2 1) (cons 1 1) (cons 0 0)))
(define second-possibility (list (cons 2 1) (cons 1 2) (cons 0 0)))

