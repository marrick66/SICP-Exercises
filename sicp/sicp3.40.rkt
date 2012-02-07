;Exercise 3.40.  Give all possible values of x that can result from executing

;(define x 10)

;(parallel-execute (lambda () (set! x (* x x)))
;                  (lambda () (set! x (* x x x))))

;Which of these possibilities remain if we instead use serialized procedures:

;(define x 10)

;(define s (make-serializer))

;(parallel-execute (s (lambda () (set! x (* x x))))
;                  (s (lambda () (set! x (* x x x)))))


;For the first part, here's a diagram of where the other procedure can set the x value during processing:

;Proc1 can set x either before:
; Proc2 reads the first x, Proc2 reads the second x, Proc2 reads the third x, or sets x

;Proc2 can set x either before:
; Proc1 reads the first x, Proc1 reads the second x, or Proc1 sets x


 
;For the second part, with each procedure completely serialized, there are only
;two possibilities:

; proc1 -> 100 -> set x = 100
; proc2 -> 1000000 -> set x = 1000000

; proc2 -> 1000 -> set x = 1000
; proc1 -> 1000000 -> set x = 1000000

; Whichever procedure executes first, we still receive the same answer. Since the read and writes are
; Serialized, it comes down to mathematical orders of operation. Multiplication can be done in any order.