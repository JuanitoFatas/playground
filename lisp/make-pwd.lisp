;;; Given a note it then generates password of a given length
;;; each password is composed of capital, small letters and nubmers
;;; and save it at Desktop/password.dat
;;; this frees you from thinking of passwords 
;;; while registering unimportant sites

(defun gen-pwd (length)
  (let ((capital (char-code #\A))
        (small (char-code #\a))
        (number (char-code #\0)))
    (coerce (loop for i from 0 to length
                  and p = (random 3)
                  when (= p 0) collect (code-char (+ capital (random 26)))
                  when (= p 1) collect (code-char (+ small (random 26)))
                  when (= p 2) collect (code-char (+ number (random 10))))
            'string)))

(defun gen-pwd2 (length)
  (let ((capital (char-code #\A))
        (small (char-code #\a))
        (number (char-code #\0))
        (symbol (char-code #\!)))
    (coerce (loop for i from 0 to length
              and p = (random 4)
                  when (= p 0) collect (code-char (+ capital (random 26)))
                  when (= p 1) collect (code-char (+ small (random 26)))
                  when (= p 2) collect (code-char (+ number (random 10)))
                  when (= p 3) collect (code-char (+ symbol (random 16))))
            'string)))

(defconstant *month-names*
  '(jan feb mar apr may jun jul aug sep oct nov dec))

(defun parse-month (n)
  (nth (1- n) *month-names*)) 

(defun print-date ()
  (multiple-value-bind
      (s m h date month year) (get-decoded-time)
    (declare (ignore s m h))
    (list date 
          (parse-month month) 
          year)))

(defun make-password ()
  (format t "~&Type in notes about this password: ")
  (let ((note (read)))
    (format t "~&Length of password: ")
    (let ((len (or (parse-integer (read-line) :junk-allowed t) 8))) ;; default 8 length long password.
      (with-open-file (stream "~/Desktop/password.dat"
                          :direction :output
                          :if-exists :append
                          :if-does-not-exist :create)
    (format stream "~&~10A~S" "date: " (print-date))
    (format stream "~&~10A~S" "note: " note)
    (format stream "~&~10A~S~%~%" "password: " (gen-pwd len))
    (format t "~&your file is stored at ~A~%" "~/Desktop/password.dat")))))
           