; Exercise 1.1

; 10
; (+ 5 3 4)
; (- 9 1)
; (/ 6 2)
; (+ (* 2 4) (- 4 6))
; (define a 3)
; (define b (+ a 1))
; (+ a b) (* a b))
; (= a b)
; (if (and (> b a) (< b (* a b)))
;     b
;  	  a)
; (cond ((= a 4) 6)
;	    ((= b 4) (+ 6 7 a))
;	    (else 25))
; (+ 2 (if (> b a) b a))
; (* (cond ((> a b) a)
;		   ((< a b) b)
;		   (else -1))
;    (+ a 1))


; Exercise 1.2

(/ (+ 5 4 
	  (- 2 
		 (- 3 (+ 6 (/ 4 5)))))
   (* 3
	  (* (- 6 2) (- 2 7))))

;; -37/150

; Exercise 1.3

(define (square x) (* x x))

(define (max x y) (if (> x y) x y))

(define (fn x y z)
  (cond ((> x y) (+ (square x) (square (max y z))))
		(else (+ (square y) (square (max x z))))))

; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; The if statement returns either - or +,
;; which is then applied to the operands a, b.

; Exercise 1.5
(define (p) (p))
(define (test x y)
  (if (= x 0)
	0
	y))

;(test 0 (p))

;; Using applicative-order evaluation, the evalution of (test 0 (p))
;; never terminates because (p) is infinitely expanded to itself.
;; Using normal-order evaluation, the expression evaluates, step by step, to 0:

; > (test 0 (p))
; ==================
; (if (= 0 0) 0 (p))
; (if #t 0 (p))
; > 0


; Example: square root using Newton's method

;(define (abs x)
;  (if (< x 0)
;	(- x)
;	x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
