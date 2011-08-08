;Exercise 2.22.  Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) 
              (cons (square (car things))
                    answer))))
  (iter items nil))

;Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

;The new list that's created is cons starting with the nil, then each successive car of the remaining list.  So, we get something like:
; (1 2 3 4) -> (cons 4 (cons 3 (cons 2 (cons 1 nil))))

;Louis then tries to fix his bug by interchanging the arguments to cons:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))

;This doesn't work either. Explain.

;First of all, on the first iteration, you're going to cons nil and the square of the car of the list like so:
;(1 2 3 4) -> answer = (cons nil 1), cdr -> (2 3 4)
;Secondly, you're still processing the car of each list passed, which will naturally reverse the items in the list.
;We really need to access the last item in each passed list and process it.