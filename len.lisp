(defun len (list)
  (if list 
    (1+ (len (cdr list)))
    0))