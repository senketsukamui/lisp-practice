(defun gcd_e (a b)
  (if (zerop b)
    a 
    (gcd_e b (mod a b))))