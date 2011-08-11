;Exercise 2.29.  A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

;A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

;a.  Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.

;b.  Using your selectors, define a procedure total-weight that returns the total weight of a mobile.

;c.  A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.

;d.  Suppose we change the representation of mobiles so that the constructors are

;(define (make-mobile left right)
;  (cons left right))
;(define (make-branch length structure)
;  (cons length structure))

;How much do you need to change your programs to convert to the new representation?

;a: these use operators shown in the footnotes...
(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

;b:
(define mobile? pair?)

(define (branch-weight branch)
  (if (mobile? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;c:
(define (torque branch)
  (if (mobile? (branch-structure branch))
      (* (branch-length branch) (total-weight (branch-structure branch)))
      (* (branch-length branch) (branch-structure branch))))

(define (branch-balanced? branch)
  (if (mobile? (branch-structure branch))
      (balanced? (branch-structure branch))
      true))

(define (balanced? mobile)
  (and
   (= (torque (left-branch mobile))
      (torque (right-branch mobile)))
   (and
    (branch-balanced? (left-branch mobile))
    (branch-balanced? (right-branch mobile)))))

;I took the approach that branches and mobiles are independent objects, and made separate
;procedures for each.  I think it makes it much more readable, and is much more flexible
;if lists are replaced as the underlying representation.

;d:

(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

;We need to redefine the accessors to retrieve the appropriate data, otherwise our 
;other code should work as designed, hence the usefulness of data abstraction

(define left-branch car)
(define right-branch cdr)
(define branch-length car)
(define branch-structure cdr)

;test mobiles
(define mobile1 (make-mobile (make-branch 1 2) (make-branch 2 (make-mobile (make-branch 1 2) (make-branch 1 2))))) ;unbalanced
(define mobile2 (make-mobile (make-branch 5 6) (make-branch 3 (make-mobile (make-branch 2 5) (make-branch 2 5))))) ;balanced