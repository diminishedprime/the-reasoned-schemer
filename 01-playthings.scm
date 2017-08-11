(load "mk.scm")
(load "mkextraforms.scm")

(define U fail)
(define S succeed)

;; 10
(run* (q)
  U)

;; 11
(run* (q)
  (== #t q))

;; 12
(run* (q)
  U
  (== #t q))

;; 13
(run* (q)
  S
  (== #t q))

;; 15
(run* (r)
  S
  (== 'corn r))

;; 17
(run* (r)
  U
  (== 'corn r))

;; 18
(run* (q)
  S
  (== #f q))

;; 22
(run* (x)
  (let ((x #f))
    (== #t x)))

;; 23
(run* (q)
  (fresh (x)
    (== #t x)
    (== #t q)))

;; 26
(run* (q)
  (fresh (x)
    (== x #t)
    (== #t q)))

;; 28
(run* (x)
  S)

;; 29
(run* (x)
  (let ((x #f))
    (fresh (x)
      (== #t x))))

;; 30
(run* (r)
  (fresh (x y)
    (== (cons x (cons y '())) r)))

;; 31
(run* (s)
  (fresh (t u)
    (== (cons t (cons u '())) s)))

;; 32
(run* (r)
  (fresh (x)
    (let ((y x))
      (fresh (x)
        (== (cons y (cons x (cons y '()))) r)))))

;; 33
(run* (r)
  (fresh (x)
    (let ((y x))
      (fresh (x)
        (== (cons x (cons y (cons x '()))) r)))))

;; 34
(run* (q)
  (== #f q)
  (== #t q))

;; 35
(run* (q)
  (== #f q)
  (== #f q))

;; 36
(run* (q)
  (let ((x q))
    (== #t x)))

;; 37
(run* (r)
  (fresh (x)
    (== x r)))

;; 38
(run* (q)
  (fresh (x)
    (== #t x)
    (== x q)))

;; 39
(run* (q)
  (fresh (x)
    (== x q)
    (== #t x)))

;; 40
(run* (q)
  (fresh (x)
    (== #t x)
    (== x q)))
;; q and x are different variables because every variable introduced by fresh
;; (or run) is different from every other variable introduced by fresh or run.

;; 41
(cond
  (#f #t)
  (else #f))

;; 43
(cond
  (#f S)
  (else U))

;; 44
(conde 
  (U S)
  (else U))
;; this does not succeed because the question of the first conde line is the
;; goal #u

;; 45
(conde 
  (U S)
  (else S))
;; this does suceed because the question of the first conde line is #u so conde
;; tries the second line.

;; 46
(conde
  (S S)
  (else U))
;; This suceeds because the question of the first conde line is the goal #s so
;; conde tries the answer of the first line.

;; 47
(run* (x)
  (conde
    ((== 'olive x) S)
    ((== 'oil x) S)
    (else U)))

;; 49
(run 1 (x)
  (conde
    ((== 'olive x) S)
    ((== 'oil x) S)
    (else U)))

;; 50
(run* (x)
  (conde
    ((== 'virgin x) U)
    ((== 'olive x) S)
    (S S)
    ((== 'oil x) S)
    (else U)))

;; 52
(run 2 (x)
  (conde
    ((== 'extra x) S)
    ((== 'virgin x) U)
    ((== 'olive x) S)
    ((== 'oil x) S)
    (else U)))

;; 53
(run* (r)
  (fresh (x y)
    (== 'split x)
    (== 'pea y)
    (== (cons x (cons y '())) r)))

;; 54
(run* (r)
  (fresh (x y)
    (conde
      ((== 'split x) (== 'pea y))
      ((== 'navy x) (== 'bean y))
      (else U))
    (== (cons x (cons y '())) r)))

;; 55
(run* (r)
  (fresh (x y)
    (conde
      ((== 'split x) (== 'pea y))
      ((== 'navy x) (== 'bean y))
      (else U))
    (== (cons x (cons y (cons 'soup '()))) r)))

;; 56
(define teacupo
  (lambda (x)
    (conde 
      ((== 'tea x) S)
      ((== 'cup x) S)
      (else U))))
(run* (x)
  (teacupo x))

;; 57
(run* (r)
  (fresh (x y)
    (conde
      ((teacupo x) (== #t y) S)
      ((== #f x) (== #t y))
      (else U))
    (== (cons x (cons y '())) r)))

;; 58
(run* (r)
  (fresh (x y z)
    (conde
      ((== y x) (fresh (x) (== z x)))
      ((fresh (x) (== y x)) (== z x))
      (else U))
    (== (cons y (cons z '())) r)))

;; 59
(run* (r)
  (fresh (x y z)
    (conde
      ((== y x) (fresh (x) (== z x)))
      ((fresh (x) (== y x)) (== z x))
      (else U))
    (== #f x)
    (== (cons y (cons z '())) r)))

;; 60
(run* (q)
  (let ((a (== #t q))
        (b (== #f q)))
    b))

;; 61
(run* (q)
  (let ((a (== #t q))
        (b (fresh (x)
             (== x q)
             (== #f x)))
        (c (conde
             ((== #t q) S)
             (else (== #f q)))))
    b))
