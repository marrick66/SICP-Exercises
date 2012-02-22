;Exercise 3.52.  Consider the sequence of expressions

(define sum 0)
(define (accum x)
  (set! sum (+ x sum))
  sum)
(define seq (stream-map accum (stream-enumerate-interval 1 20)))
(define y (stream-filter even? seq))
(define z (stream-filter (lambda (x) (= (remainder x 5) 0))
                         seq))
(stream-ref y 7)
(display-stream z)

;What is the value of sum after each of the above expressions is evaluated? What is the printed response to evaluating the stream-ref and display-stream expressions? Would these responses differ if we had implemented (delay <exp>) simply as (lambda () <exp>) without using the optimization provided by memo-proc ? Explain.

;Since the implementation of delay uses memo-proc, the sum should remain 210 after the first map of accum. When stream-ref of y is called, the the first 7 even sums should be displayed. Display-stream should show all the sums evenly divisible by 5.

;If memo-proc was not used, the integrity of the streams are compromised every time it's accessed.  Sum is being applied multiple times, when it should only be applied once.

;If 