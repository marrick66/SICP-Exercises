;Exercise 2.27.  Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the 
;list with its elements reversed and with all sublists deep-reversed as well. For example,

(define x (list (list 1 2) (list 3 4)))

;x
;((1 2) (3 4))

;(reverse x)
;((3 4) (1 2))

;(deep-reverse x)
;((4 3) (2 1))

;Prerequisite code:
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (map condition proc items)
  (if (null? items)
      nil
      (cons 
       (if (condition (car items))
           (proc (car items))
           (car items))
            (map condition proc (cdr items)))))

(define (deep-reverse items)
  (let ((reversed-list (reverse items)))
    (map (lambda (x) (pair? x)) reverse reversed-list)))

    

