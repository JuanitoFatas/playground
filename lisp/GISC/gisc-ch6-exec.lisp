;;; chapter 6 exercise

;;; 6.6
;;; take the last element of a list, not cons cell
(defun last-element (lst)
  (car (last lst)))

(defun last-element2 (lst)
  (car (reverse lst)))

(defun last-element3 (lst)
  (and lst ; avoid the nil case
       (nth (1- (length lst)) lst)))

;;; 6.7 NEXT-TO-LAST
;;; returns the next-to-last element of a list

(defun next-to-last (lst)
  (car (cdr (reverse lst))))

(defun next-to-last2 (lst)
  (and (reverse lst)
       (nth (- (length lst) 2) lst)))

(defun next-to-last3 (lst)
  (second (reverse lst)))

;;; 6.8 my-butlast
;;; returns a list with the last element removed
;;; very bad way to do this

(defun my-butlast (lst)
  (cons (car lst)
        (nthcdr 1 (reverse (nthcdr 1 (reverse lst))))))

(defun my-butlast (lst)
  (reverse (cdr (reverse lst))))

;;; 6.9 car!

;;; 6.10 
;;; palindromep 
;;; returns true if its input is a palindrome

(defun palindromep (lst)
  (equal lst (reverse lst)))

;;; 6.11 make-palindrome

(defun make-palindrome (lst)
  (append lst (reverse lst)))

;;; 6.15 CONTAINS-THE-P

(defun contains-article-p (sent)
  (intersection '(the a an) sent))

(defun contains-article-p2 (sent)
  (or (member 'the sent)
      (member 'a sent)
      (member 'an sent)))

(defun contains-article-p3 (sent)
  (not (and (not (member 'the sent))
            (not (member 'a sent))
            (not (member 'an sent)))))

;;; 6.21

(defun my-subsetp (x y)
  (null (SET-DIFFERENCE x y)))

;;; MINI KEYBOARD EXERCISE

;;; 6.26
;;; (LARGE RED SHINY CUBE -VS- SMALL SHINY RED FOUR-SIDED PYRAMID)

(defun right-side (lst)
  (cdr (member '-vs- lst)))
(defun left-side (lst)
  (cdr (member '-vs- (reverse lst))))
(defun count-common (a b)
  (length (intersection a b)))
(defun compare (lst)
  (cons (COUNT-COMMON (left-side lst)
                (right-side lst))
                '(COMMON FEATURES)))

;;; 6.31

(defun who-wrote (bookname)
  (cdr (assoc bookname book)))

(defun what-wrote (author)
  (car (rassoc author book)))

(defun state-cities (state)
  (list (assoc state *ATLAS*)
        (assoc state (cdr *ATLAS*))))

;;; CH6 REVIEW EXEC

(defun swap-first-last (lst)
  (let* ((a (reverse (cdr lst)))
         (b (reverse (cdr a))))
    (cons (first a)
          (append b (list (first lst))))))

(defun rotate-left (lst)
  (append (cdr lst)
          (list (first lst))))

(defun rotate-right (lst)
  (let ((r (reverse lst)))
    (cons (first r)
          (reverse (cdr r)))))

;;; CH6 KEYBOARD EXERCISE

(SETF *LOC* 'PANTRY)

(SETF *ROOMS*
      '((LIVING-ROOM (NORTH FRONT-STAIRS)
                     (SOUTH DINING-ROOM)
                     (EAST KITCHEN))
        (UPSTAIRS-BEDROOM (WEST LIBRARY)
                          (SOUTH FRONT-STAIRS))
        (DINING-ROOM (NORTH LIVING-ROOM)
                     (EAST PANTRY)
                     (WEST DOWNSTAIRS-BEDROOM))
        (KITCHEN (WEST LIVING-ROOM)
                 (SOUTH PANTRY))
        (PANTRY (NORTH KITCHEN)
                (WEST DINING-ROOM))
        (DOWNSTAIRS-BEDROOM (NORTH BACK-STAIRS)
                            (EAST DINING-ROOM))
        (BACK-STAIRS (SOUTH DOWNSTAIRS-BEDROOM)
                     (NORTH LIBRARY))
        (FRONT-STAIRS (NORTH UPSTAIRS-BEDROOM)
                      (SOUTH LIVING-ROOM))
        (LIBRARY (EAST UPSTAIRS-BEDROOM)
                 (SOUTH BACK-STAIRS))))

;;; CHOICES that takes the name of a room as input and
;;; returns the table of permissible directions robbie may take from that room

(defun choices (room)
  (cdr (assoc room *ROOMS*)))

(defun look (direction room)
  (cadr (assoc direction (choices room))))

(defun set-robbie-location (place)
  (setf loc place))

(defun how-many-choices ()
  (length (choices *loc*)))

(defun upstairsp (place) 
  (or (equal place 'LIBRARY)
      (equal place 'UPSTAIRS-BEDROOM)))

(defun onstairsp (place)
  (or (equal place 'FRONT-STAIRS)
      (equal place 'BACK-STAIRS)))


        

          
  