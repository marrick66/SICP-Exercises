;Exercise 3.8.  When we defined the evaluation model in section 1.1.3, we said that the first step in evaluating an expression is to evaluate its subexpressions. But we never specified the order in which the subexpressions should be evaluated (e.g., left to right or right to left). When we introduce assignment, the order in which the arguments to a procedure are evaluated can make a difference to the result. Define a simple procedure f such that evaluating (+ (f 0) (f 1)) will return 0 if the arguments to + are evaluated from left to right but will return 1 if the arguments are evaluated from right to left.

;Having a variable outside the scope of the functions seems to work:
(define value 1)
(define (f n)
  (set! value (* value n))
  value)

;Since we're ahead of the environment model section, I'm not sure they want it done this way, due to the fact that value has to be reset to 1 before each evaluation.

(define f
  (let ((state 1))
    (lambda (n)
      (set! state (* state n))
      state)))



