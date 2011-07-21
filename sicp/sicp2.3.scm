;point code from prior exercises...
(define (make-point x y)
(cons x y))

(define (x-value point)
  (car point))

(define (y-value point)
  (cdr point))

;The first definition defines a rectangle as a set of points as pairs, as in Exercise 2.2...
(define (make-rect point-a point-b point-c point-d)
(cons (cons point-a point-b) (cons point-c point-d))) 


;The second defines a rectangle as a series of 2 x values and two y values, since each point will share either an x or y value with 
;the other point on a side. The make-rect function in this case creates the points for you.

(define (make-rect x1 x2 y1 y2)
  (cons (cons (make-point x1 y2) (make-point x2 y2)) (cons (make-point x1 y1) (make-point x2 y1))))


;These functions can be called regardless of which constructor is used to create the rectangle.

(define (length rect)
  (- (x-value (cdr (car rect))) (x-value (car (car rect)))))

(define (width rect)
  (- (y-value (car (car rect))) (y-value (car (cdr rect)))))

(define (area rect)
  (* (length rect) (width rect)))

(define (perimeter rect)
  (+ (* (length rect) 2)
     (* (width rect) 2)))


;The level of abstraction in this case is limited to the constructor function, make-rect.  If we wanted to keep the 
;rectangle as a series of x and y values, we would also have to create new functions for length and width.  To keep 
;everything aligned and correct, perhaps redefine the area and perimeter as higher order functions and pass in the 
;appropriate length and width functions for that rectangle representation.  In other words, it's similiar to passing
;an object and calling member methods.




