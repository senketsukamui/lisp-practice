(load "./diff.lisp")
(load "./lst.lisp")
(load "./len.lisp")
(load "./gcd.lisp")


(format t "(diff '(- x (* 3 x)) 'x) => ~S~%" (diff '(- x (* 3 x)) 'x))
(format t "(diff '(+ x (* 3 x)) 'x) => ~S~%" (diff '(+ x (* 3 x)) 'x))
(format t "(diff '(* x ( + x 1)) 'x) => ~S~%" (diff '(* x ( + x 1)) 'x))

(format t "len '(x y z) => ~S~%" (len '(x y z)))
(format t "len () => ~S~%" (len ()))

(format t "gcd (5 10) => ~S~%" (gcd_e 5 10))
(format t "gcd (7 19) => ~S~%" (gcd_e 7 19))

(format t "lst () => ~S~%" (lst ()))
(format t "lst '(x y z) => ~S~%" (lst '(x y z)))
