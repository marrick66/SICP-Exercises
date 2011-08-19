;Exercise 2.35.  Redefine count-leaves from section 2.2.2 as an accumulation:

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate +  0 (map (lambda (x) 1)  (enumerate-tree tree)))) ;We need to map a function that returns 1 for every leaf. 


