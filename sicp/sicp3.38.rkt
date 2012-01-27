;Exercise 3.38.  Suppose that Peter, Paul, and Mary share a joint bank account that initially contains $100. ;Concurrently, Peter deposits $10, Paul withdraws $20, and Mary withdraws half the money in the account, by ;executing the following commands:
;Peter:	(set! balance (+ balance 10))
;Paul:	(set! balance (- balance 20))
;Mary:	(set! balance (- balance (/ balance 2)))

;a. List all the different possible values for balance after these three transactions have been completed, ;assuming that the banking system forces the three processes to run sequentially in some order.

;b. What are some other values that could be produced if the system allows the processes to be interleaved? Draw ;timing diagrams like the one in figure 3.29 to explain how these values can occur.


a. If the processes are performed sequentially, the permutations are as follows:
Initial->Peter->Paul->Mary
$100->$110->$90->$45
Initial->Peter->Mary->Paul
$100->$110->$55->35
Initial->Paul->Peter->Mary
$100->$80->$90->$45
Initial->Paul->Mary->Peter
$100->$80->$40->$50
Initial->Mary->Peter->Paul
$100->$50->$60->$40
Initial->Mary->Paul->Peter
$100->$50->$30->$40

b. A simple interleaved example, where each person completes each step in turn:
Peter accesses balance -> $100
Paul accesses balance -> $100
Mary accesses balance -> $100
Peter calculates new balance -> $110
Paul calculates new balance -> $80
Mary calculates new balance -> $50
Peter sets new balance -> $110
Paul sets new balance -> $80
Mary sets new balance -> $50

Since these were interleaved without respect to each other, Mary sets the value last with the final balance being
$50.