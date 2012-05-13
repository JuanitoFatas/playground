(define Y
    (lambda (f)
      ((lambda (x)
         (f (lambda arg (apply (x x) arg))))
      (lambda (x)
         (f (lambda arg (apply (x x) arg)))))))

(define fib*
    (lambda (not-fib)
       (lambda (n)
         (if (< n 2) n
             (+ (not-fib (- n 1))
                (not-fib (- n 2)))))))

(define fib (Y fib*))