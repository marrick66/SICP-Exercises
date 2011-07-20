(define (make-point x y)
(cons x y))

;The first definition defines a rectangle as a list of points, as in Exercise 2.2...
(define (make-rectangle point-a point-b point-c point-d)
(cons point-a point-b point-c point-d)) 

(define (point-a rect)
(car rect))

(define (point-b rect)

(car (cdr rect))

(define (point-c rect)
(car (cdr (cdr rect))))

(define (point-d rect)
(cdr (cdr (cdr rect))))

;This is under the assumption that the points are valid for a rectangle.
;For example, The A point's x value equals C's x value, A's y value equals B's y value, etc.

(define (make-rect-shared x1 x2 y1 y2)
(cons x1 x2 y1 y2))

(define (point-a rect)
(make-point (car rect) (car (cdr (cdr rect))))))

(define (point-b rect)
(make-point (car (cdr rect)) (cdr (cdr (cdr rect)))))

(define (point-c rect)
(make-point (car rect) (car (cdr (cdr rect)))))

(define (point-d rect)
(make-point (car (cdr rect)) (car (cdr (cdr rect)))))
