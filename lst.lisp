(load "./len.lisp")

(defun lst (list)
  (if list
    (elt list (- (len list) 1))
    NIL)
  )