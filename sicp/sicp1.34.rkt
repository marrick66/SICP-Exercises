;Exercise 1.34.  Suppose we define the procedure

;(define (f g)
;  (g 2))

;Then we have

;(f square)
;4

;(f (lambda (z) (* z (+ z 1))))
;6

;What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

;On the first application of f, the function tries to resolve (f 2), which is invalid since f is expecting a procedure as its argument.