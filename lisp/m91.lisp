;;; McCarthy 91 function
;;; ==========================================================================
;;; The McCarthy 91 function is a recursive function,
;;; defined by the computer scientist John McCarthy
;;; as a test case for formal verification within
;;; computer science.
;;; ==========================================================================
;;; Definition:
;;;        | n - 10 , n > 100
;;; f(n) = |
;;;        | f(f(n+11)) , otherwise
;;; ==========================================================================
;;; M91: Int -> Int

(defun M91 (n)
  (cond
    ((> n 100) (- n 10))
    (t (M91 (M91 (+ n 11))))))

;;; ==========================================================================
;;; f(89) = f(f(100)) = f(f(f(111)))
;;; = f(f(101)) = f(91) = f(f(102)) = f(92) = ...
;;; Here is a pattern.
;;; Thus we could define a function H to conclude
;;; H(n,m) = f(f(...f(n)...))
;;;             |.. m ..|
;;;          | n , m = 0    , when m = 0
;;; H(n,m) = | H(n-10, m-1) , when m > 0, n > 100
;;;          | H(n+11, m+1) , when m > 0, n <= 100
;;; we then derive...
;;; ==========================================================================
;;; H: Int x Int -> Int

(defun H(n m)
  (cond
    ((zerop m) n)
    ((> n 100) (H (- n 10) (1- m)))
    (t (H (+ n 11) (1+ m)))))

;;; now we can use H to redefine M91 to make it tail-recursive

(defun M91~ (n)
  (H N 1))