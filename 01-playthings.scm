(load "mk.scm")
(load "mkextraforms.scm")

(define U fail)
(define S succeed)

(define f01-10
  (run* (q)
    U))

(define f01-11
  (run* (q)
    (== #t q)))

(define f01-12
  (run* (q)
    U
    (== #t q)))

(define f01-13
  (run* (q)
    S
    (== #t q)))

(define f01-15
  (run* (r)
    S
    (== 'corn r)))

(define f01-17
  (run* (r)
    U
    (== 'corn r)))

(define f01-18
  (run* (q)
    S
    (== #f q)))

(define f01-22
  (run* (x)
    (let ((x #f))
      (== #t x))))

(define f01-23
  (run* (q)
    (fresh (x)
      (== #t x)
      (== #t q))))

(define f01-26
  (run* (q)
    (fresh (x)
      (== x #t)
      (== #t q))))

(define f01-28
  (run* (x)
    S))

(define f01-29
  (run* (x)
    (let ((x #f))
      (fresh (x)
        (== #t x)))))

(define f01-30
  (run* (r)
    (fresh (x y)
      (== (cons x (cons y '())) r))))

(define f01-31
  (run* (s)
    (fresh (t u)
      (== (cons t (cons u '())) s))))

(define f01-32
  (run* (r)
    (fresh (x)
      (let ((y x))
        (fresh (x)
          (== (cons y (cons x (cons y '()))) r))))))

(define f01-33
  (run* (r)
    (fresh (x)
      (let ((y x))
        (fresh (x)
          (== (cons x (cons y (cons x '()))) r))))))

(define f01-34
  (run* (q)
    (== #f q)
    (== #t q)))

(define f01-35
  (run* (q)
    (== #f q)
    (== #f q)))

(define f01-36
  (run* (q)
    (let ((x q))
      (== #t x))))

(define f01-37
  (run* (r)
    (fresh (x)
      (== x r))))

(define f01-38
  (run* (q)
    (fresh (x)
      (== #t x)
      (== x q))))

(define f01-39
  (run* (q)
    (fresh (x)
      (== x q)
      (== #t x))))

(define f01-40
  (run* (q)
    (fresh (x)
      (== #t x)
      (== x q))))
;; q and x are different variables because every variable introduced by fresh
;; (or run) is different from every other variable introduced by fresh or run.

(define f01-41
  (cond
    (#f #t)
    (else #f)))

(define f01-43
  (cond
    (#f S)
    (else U)))

(define f01-44
  (conde 
    (U S)
    (else U)))
;; this does not succeed because the question of the first conde line is the
;; goal #u

(define f01-45
  (conde 
    (U S)
    (else S)))
;; this does suceed because the question of the first conde line is #u so conde
;; tries the second line.

(define f01-46
  (conde
    (S S)
    (else U)))
;; This suceeds because the question of the first conde line is the goal #s so
;; conde tries the answer of the first line.

(define f01-47
  (run* (x)
    (conde
      ((== 'olive x) S)
      ((== 'oil x) S)
      (else U))))

(define f01-49
  (run 1 (x)
    (conde
      ((== 'olive x) S)
      ((== 'oil x) S)
      (else U))))

(define f01-50
  (run* (x)
    (conde
      ((== 'virgin x) U)
      ((== 'olive x) S)
      (S S)
      ((== 'oil x) S)
      (else U))))

(define f01-52
  (run 2 (x)
    (conde
      ((== 'extra x) S)
      ((== 'virgin x) U)
      ((== 'olive x) S)
      ((== 'oil x) S)
      (else U))))

(define f01-53
  (run* (r)
    (fresh (x y)
      (== 'split x)
      (== 'pea y)
      (== (cons x (cons y '())) r))))

(define f01-54
  (run* (r)
    (fresh (x y)
      (conde
        ((== 'split x) (== 'pea y))
        ((== 'navy x) (== 'bean y))
        (else U))
      (== (cons x (cons y '())) r))))

(define f01-55
  (run* (r)
    (fresh (x y)
      (conde
        ((== 'split x) (== 'pea y))
        ((== 'navy x) (== 'bean y))
        (else U))
      (== (cons x (cons y (cons 'soup '()))) r))))

;; 56 
(define teacupo
  (lambda (x)
    (conde 
      ((== 'tea x) S)
      ((== 'cup x) S)
      (else U))))
(define f01-56
  (run* (x)
    (teacupo x)))

(define f01-57
  (run* (r)
    (fresh (x y)
      (conde
        ((teacupo x) (== #t y) S)
        ((== #f x) (== #t y))
        (else U))
      (== (cons x (cons y '())) r))))

(define f01-58
  (run* (r)
    (fresh (x y z)
      (conde
        ((== y x) (fresh (x) (== z x)))
        ((fresh (x) (== y x)) (== z x))
        (else U))
      (== (cons y (cons z '())) r))))

(define f01-59
  (run* (r)
    (fresh (x y z)
      (conde
        ((== y x) (fresh (x) (== z x)))
        ((fresh (x) (== y x)) (== z x))
        (else U))
      (== #f x)
      (== (cons y (cons z '())) r))))

(define f01-60
  (run* (q)
    (let ((a (== #t q))
          (b (== #f q)))
      b)))

(define f01-61
  (run* (q)
    (let ((a (== #t q))
          (b (fresh (x)
               (== x q)
               (== #f x)))
          (c (conde
               ((== #t q) S)
               (else (== #f q)))))
      b)))
