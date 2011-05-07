;Exercise 1.12 - Write a procedure that computes Pascal's triangle via a recursive process.

(define (pascal-value row column)
  (cond ((= row column) 1) ;First number in column is always 1
        ((< column 1) 0) ;When there is no number above left
        ((> column row) 0);When there is no number above right
        (else 
         (+ (pascal-value (- row 1) (- column 1))
            (pascal-value (- row 1) column)))))