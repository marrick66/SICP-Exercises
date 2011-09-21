;Exercise 2.60.  We specified that a set would be represented as a list with no duplicates.
;Now suppose we allow duplicates. For instance, the set {1,2,3} could be represented as the list (2 3 2 1 3 2 2). Design procedures element-of-set?, adjoin-set, union-set, and intersection-set that operate on this representation. How does the efficiency of each compare with the corresponding procedure for the non-duplicate representation? Are there applications for which you would use this representation in preference to the non-duplicate one?

;Since a set can have multiple instances of the same item, we
;don't need to check if it exists in the set already.
(define (adjoin-set element set)
  (append (list element) set))

;There's no change to this procedure, it just finds the first instance of the element if it exists.
(define (element-of-set? element set)
  (cond ((null? set) false)
        ((eq? element (car set)) true)
        (else (element-of-set? element (cdr set)))))

;This procedure is much more efficient than the previous one, there's no 
;scouring set2 for instances of the elements in set1, since they can be 
;duplicated
(define (union-set set1 set2)
  (append set1 set2))


(define (intersection-set set1 set2)
  (define (intersection-remove-dupes set1 set2 current-intersection)
  (cond ((or (null? set1) (null? set2)) current-intersection)
        ((and 
          (element-of-set? (car set1) set2) 
          (not (element-of-set? (car set1) current-intersection)))        
               (intersection-remove-dupes (cdr set1) set2 (cons (car set1) current-intersection)))
        (else (intersection-remove-dupes (cdr set1) set2 current-intersection))))
  (intersection-remove-dupes set1 set2 '()))
