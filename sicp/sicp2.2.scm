(define (make-point x y)
(cons x y))

(define (x-point point)
(car point))

(define (y-point point)
(cdr point))

(define (make-segment point1 point2)
(cons point1 point2))

(define (segment-first-point segment);Used to abstract away car and cdr...
(car segment))

(define (segment-second-point segment);Same here...
(cdr segment))

(define (midpoint-segment segment)
(make-point
 (/ (- (x-point (segment-second-point  segment)) (x-point (segment-first-point segment))) 2)
 (/ (- (y-point (segment-second-point  segment)) (y-point (segment-first-point segment))) 2)))

(define (print-point p)
(newline)
(display "(")
(display (x-point p))
(display ",")
(display (y-point p))
(display ")"))
