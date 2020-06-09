;; Exercise 1.1
10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b)
(if (and (> b a) (< b (* a b)))
    b
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))

;; Exercise 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; Exercise 1.3
(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-of-two-larger-numbers a b c)
  (cond ((and (>= a c) (>= b c)) (sum-of-squares a b))
        ((and (>= a b) (>= c b)) (sum-of-squares a c))
        ((and (>= b a) (>= c a)) (sum-of-squares b c))))

(sum-of-squares-of-two-larger-numbers 4 3 2)
(sum-of-squares-of-two-larger-numbers 3 2 4)
(sum-of-squares-of-two-larger-numbers 2 3 4)
(sum-of-squares-of-two-larger-numbers 4 4 2)

;; Exercise 1.4
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 -4)
(a-plus-abs-b 11 4)

;; Exercise 1.5
;;
;; An applicative order evaluator would never terminate. The value of `p' is
;; expanded prior to the logic of `test' being applied.
;; Conversely, a normal-order evaluator would return 0, it never had the chance to
;; expand `p'

;; Exercise 1.6
(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)


;; The new-if function is a 'de-specialised' form of if, meaning
;; that it is now subject to applicative order, where all of the arguments
;; provided to the function will be evaluated. As a result, sqrt-iter will be
;; evaulated indefinitely, overflowing the call stack.
;;
;; (define (sqrt-iter guess x)
;;   (new-if (good-enough? guess x)
;;           guess
;;           (sqrt-iter (improve guess x) x)))

;; Exercise 1.7

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

;; Original test function
;; (define (good-enough? guess x)
;;   (< (abs (- (square guess) x)) 0.001))

;; Improved test function that checks if any further improvement can be done
;; to the guess.
(define (good-enough? guess x)
  (= (improve guess x) guess))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 9)

(sqrt 0.0001)

;; Go to 1.2.1 Linear Recursion and Iteration to continue
