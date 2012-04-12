
(defun count-anywhere (item tree)
  "Count the item appears anywhere within tree"
  (cond ((eql item tree) 1)
        ((atom tree) 0)
        (t (+ (count-anywhere item (first tree))
              (count-anywhere item (rest tree))))))