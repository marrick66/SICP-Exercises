;Exercise 3.39
;Which of the five possibilities in the parallel execution shown above remain 
;if we instead serialize execution as follows:
;
;(define x 10)
;(define s (make-serializer))
;(parallel-execute
;	(lambda () (set! x ((s (lambda () (* x x))))))
;	(s (lambda () (set! x (+ x 1)))))

;possibility 1: proc1 -> 100 -> proc2 -> set x = 11 -> set x = 11
;possibility 2: proc1 -> 100 -> set x = 100 -> proc2 -> set x = 101
;possibility 3: proc2 -> set x = 11 -> proc1 -> 121 -> set x = 121

