;Exercise 1.36.  Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives shown in exercise 1.22. 
;Then find a solution to xx = 1000 by finding a fixed point of x   log(1000)/log(x). (Use Scheme's primitive log procedure, which computes natural logarithms.) 
;Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by log(1) = 0.)

;Part 1
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;Part 2
(define (x-to-itself)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

;This takes approximately 35 guesses to converge...

;Part 3
(define (fixed-point-damping f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (average x y)
    (/ (+ x y) 2))
    (define (try guess)
      (display guess)
      (newline)
      (let ((next (f guess)))
        (if (close-enough? guess next)
            guess
            (try (average guess next)))))
    (try first-guess))

(define (x-to-itself-damping)
  (fixed-point-damping (lambda (x) (/ (log 1000) (log x))) 2))

;This one takes approximately 11 guesses to converge...
