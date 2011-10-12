;Exercise 2.77

;I combined all of the package and generic operators into one file to get an overall picture of the code.
;It looks like adding those entries to the complex package defers the dispatching back to the 
;real-part, imag-part, and magnitude procedures.  Since those are generic procedures themselves, the should dispatch to the proper type.  However, I don't see where it strips off the complex tag, so it looks like it shouldn't work.

;EDIT:  The apply-generic procedure does this for us.  So, the complex type is stripped off on the first call,
;leaving the rectangular/polar type for the second call.