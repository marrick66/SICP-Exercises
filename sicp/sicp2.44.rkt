(define (up-split painter times)
  (if (= times 0)
      painter
      (let ((smaller (up-split painter (- times 1))))
        (below painter (beside smaller smaller)))))

(define (right-split painter times)
  (if (= times 0)
      painter
      (let ((smaller (right-split painter (- times 1))))
        (beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((base (corner-split painter n)))
    (let ((top-right base)
          (top-left  (flip-horiz base))
          (bottom-left (flip-vert (flip-horiz base)))
          (bottom-right (flip-vert base)))
    (beside (below bottom-left top-left)
            (below bottom-right top-right)))))


              


