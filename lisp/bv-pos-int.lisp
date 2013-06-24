(defun bit-vector-to-integer (bit-vector)
  "Convert bit-vector to positive integer"
  (declare (optimize speed))
  (declaim (type 'bit-vector bit-vector))
  (reduce #'(lambda (first second) (+ (ash first 1) second)) bit-vector))

(defun integer-to-bit-vector (integer)
  "Convert positive integer to bit-vector"
  (declare (optimize speed))
  (declaim (type 'integer integer))
  (labels ((int-to-bv (int &optional acc)
             (cond ((> int 0)
                    (multiple-value-bind (q r) (floor int 2)
                      (int-to-bv q (push r acc))))
                   ((null acc) (push 0 acc))
                   (t acc))))
    (coerce (int-to-bv integer) 'bit-vector)))