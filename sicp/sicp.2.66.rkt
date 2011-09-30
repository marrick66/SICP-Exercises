;Exercise 2.66.  Implement the lookup procedure for the case where the set of records is structured as a binary tree, ordered by the numerical values of the keys.

;Prerequisites
(define make-record cons)
(define key car)

(define (make-tree entry left-branch right-branch)
  (list entry left-branch right-branch))

(define entry car)
(define left-branch cadr)
(define right-branch caddr)

;New definition
(define (lookup given-key records)
  (if (null? records)
      false
      (cond ((= given-key (key (entry records))) (entry records))
            ((> given-key (key (entry records))) (lookup given-key (right-branch records)))
            ((< given-key (key (entry records))) (lookup given-key (left-branch records))))))

(define sample-records (make-tree (make-record 2 'record2)
                                  (make-tree (make-record 1 'record1) '() '())
                                  (make-tree (make-record 3 'record3) '() '())))