(defun range (start last)
  (loop :for i :from start :to last :collect i))

(defun rnd-select (list count)
  (let ((len (length list)))
    (cond
      ((zerop count) '())
      ((<= 1 count len)
       (loop
          :with indices = '()
          :with result  = '()
          :while (plusp count)
          :for i = (random len)
          :unless (member i indices)
          :do (progn
                (push i indices)
                (push (elt list i) result)
                (decf count))
          :finally (return result)))
      (t (error "Invalid count, must be between 0 and ~A" len)))))
      
; TW 大樂透
; 49 選 6
; hahaha
(defun big-lottery ()
  (sort (rnd-select (range 1 49) 6) #'<))

; n 產生幾組號碼
(defun tw-lottery (n)
  (let ((result nil))
    (dotimes (i n)
      (push (sort (rnd-select (range 1 49) 6) #'<) result))
    result))

; five numbers out of {1..50} 
; two exclusive numbers out of {z, where 0<z<11}
(defun euro-million ()
  (cons
   (sort (rnd-select (range 1 50) 5) '<)
   (sort (rnd-select (range 1 11) 2) '<)))
