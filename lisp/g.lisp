;;; Mysterious function G
(defun g (e r d)
  (cond ((null e) nil)
        ((eq e t) t)
        ((atom E) (ga E R))
        ((eq (car e) 'quote) (cadr e))
        ((eq (car e) 'car) (car (g (cadr e) r d)))
        ((eq (car e) 'cdr) (cdr (g (cadr e) r d)))
        ((eq (car e) 'cons) (cons (g (cadr e) r d) (g (caddr e) r d)))
        ((eq (car e) 'atom) (atom (g (cadr e) r d)))
        ((eq (car e) 'eq (eq (g (cadr e) r) d) (g (caddr e) r d)))
        ((eq (car e) 'list) (gl (cdr e) r d))
        ((eq (car e) 'cond) (gc (cdr e) r d))
        (t (h (gd (car e) d) (gl (cdr e) r d) d))))