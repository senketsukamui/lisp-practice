(defun diff/variable? (x) (symbolp x))

(defun diff/same-variable? (v1 v2)
  (and (diff/variable? v1) (diff/variable? v2) (eq v1 v2)))

(defun diff/make-sum (a1 a2) (list '+ a1 a2))

(defun diff/make-sub (a1 a2) (list '- a1 a2))

(defun diff/sub? (x) 
  (and (listp x) (eq (car x) '-)))

(defun diff/sum? (x)
  (and (listp x) (eq (car x) '+)))

(defun diff/addend (s) (cadr s))

(defun diff/augend (s) (caddr s))

(defun diff/make-product (m1 m2) (list '* m1 m2))

(defun diff/product? (x)
  (and (listp x) (eq (car x) '*)))

(defun diff/multiplier (p) (cadr p))

(defun diff/multiplicand (p) (caddr p))

(defun diff (exp var)
  (cond ((numberp exp) 0)
    ((diff/variable? exp)
      (if (diff/same-variable? exp var) 1 0))
    ((diff/sub? exp)
      (diff/make-sub (diff (diff/addend exp) var) (diff (diff/augend exp) var)))
    ((diff/sum? exp)
      (diff/make-sum (diff (diff/addend exp) var) (diff (diff/augend exp) var)))
    ((diff/product? exp)
      (diff/make-sum
        (diff/make-product (diff/multiplier exp) (diff (diff/multiplicand exp) var))
        (diff/make-product (diff (diff/multiplier exp) var) (diff/multiplicand exp))))
    (t (error "err" exp))))