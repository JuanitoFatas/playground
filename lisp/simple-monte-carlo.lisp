;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; simple monte carlo localization examples
;;; a car with 2 wheels and one heading direction
;;; x' = x + v*Δt*cosΘ
;;; y' = y + v*Δt*sinΘ
;;; Θ' = Θ + ω*Δt
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun x* (x v Θ Δt)
  "calculate: x' = x + v*Δt*cosΘ"
    (+ x (* v Δt (cos Θ)))) 

(defun y* (y v Θ Δt)
  "y' = y + v*Δt*sinΘ"
    (+ y (* v Δt (sin Θ)))) 

(defun a* (Θ ω Δt)
  "Θ' = Θ + ω*Δt"
  (+ Θ (* ω Δt)))

(defun loc ()
  "return a list of (x' y' Θ')"
  (list (x* *x* *v* *theta* *delta-t*)
        (y* *y* *v* *theta* *delta-t*)
        (a* *theta* *omega* *delta-t*)))

(defun set-values (x y Θ Δt v ω)
  "x y Θ Δt v ω"
  (progn
    (setf *x* x)
    (setf *y* y)
    (setf *theta* Θ)
    (setf *delta-t* Δt)
    (setf *v* v)
    (setf *omega* ω)
    NIL))
                     