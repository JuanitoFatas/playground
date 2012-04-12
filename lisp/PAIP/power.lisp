(defun power (x n)
  "Power raises x to the nth power. n must be int > 0.
   O(log n) time, check for even n"
  (cond ((= n 0) 1)
        ((evenp n) (expt (power x (/ n 2)) 2))
        (t (* x (power x (- n 1))))))

(defun native-power (x n)
  (expt x n))