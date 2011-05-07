;Exercise 1.11
;Write procedures for the iterative and recursive processes of computing the function
;f(n) = n for n < 3, f(n-1) + 2(n-2) + 3(n-3) for n >= 3

(define (rec-f n) ;Writing it as a recursive process is straight forward, using tree recursion with three recursive
  (if (< n 3) n   ;procedure calls per branch
      (+
       (rec-f (- n 1))
       (* 2 (rec-f (- n 2)))
       (* 3 (rec-f (- n 3))))))

;This one is more difficult, I'll admit, I cheated on this after a while.  I couldn't figure out how to definitively calculate the value.  I found a similiar solution to this one online,
;but it seems to take an unnecessary number of steps. For a simple example, when considering 4 as the input, it needs 5 steps to calculate (n + 1), or just O(n).  However, we get down to the original value
;of a (2), it can terminate using the current value of a.  The second procedure takes this into consideration.  It's still O(n), but those two extra steps were driving me crazy.
(define (iter-f n)
  (define (iter-f-params counter a b c)
    (if (= counter 0)
        c
        (iter-f-params (- counter 1) 
         (+ a (* 2 b) (* 3 c))
         a b)))
  (iter-f-params n 2 1 0))

(define (iter-f2 n)
  (define (iter-f-params counter stoppoint a b c)
    (if (= counter stoppoint) a
        (iter-f-params (- counter 1) stoppoint
                       (+ a (* 2 b) (* 3 c))
                       a b)))
  (iter-f-params n 2 2 1 0))
