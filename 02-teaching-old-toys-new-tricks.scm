(load "01-playthings.scm")

(define f02-1
  (let ((x (lambda (a) a))
        (y 'c))
    (x y)))

(define f02-2
  (run* (r)
    (fresh (y x)
      (== `(,y ,x) r))))

(define f02-3
  (run* (r)
    (fresh (v w)
      (== (let ((x v) (y w)) `(,x ,y)) r))))

(define f02-4
  (car `(grape raisin pear)))

(define f02-5
  (car `(a c o r n)))

;; 9
(define caro
  (lambda (p a)
    (fresh (d)
      (== (cons a d) p))))

(define f02-6
  (run* (r)
    (caro `(a c o r n) r)))

(define f02-7
  (run* (q)
    (caro `(a c o r n) 'a)
    (== #t q)))

(define f02-8
  (run* (r)
    (fresh (x y)
      (caro `(,r ,y) x)
      (== 'pear x))))

;; 9
(define caro
  (lambda (p a)
    (fresh (d)
      (== (cons a d) p))))

(define f02-10
  (cons
    (car `(grape raisin pear))
    (car `((a) (b) (c)))))

(define f02-11
  (run* (r)
    (fresh (x y)
      (caro `(grape raisin pear) x)
      (caro `((a) (b) (c)) y)
      (== (cons x y) r))))

(define f02-13
  (cdr `(grape raisin pear)))

(define f02-14
  (car (cdr `(a c o r n))))

;; 16
(define cdro
  (lambda (p d)
    (fresh (a)
      (== (cons a d) p))))

(define f02-15
  (run* (r)
    (fresh (v)
      (cdro `(a c o r n) v)
      (caro v r))))

;; 16
(define cdro
  (lambda (p d)
    (fresh (a)
      (== (cons a d) p))))

(define f02-17
  (cons
    (cdr `(grape raisin pear))
    (car `((a) (b) (c)))))

(define f02-18
  (run* (r)
    (fresh (x y)
      (cdro `(grape raisin pear) x)
      (caro `((a) (b) (c)) y)
      (== (cons x y) r))))

(define f02-19
  (run* (q)
    (cdro `(a c o r n) `(c o r n))
    (== #t q)))

(define f02-20
  (run* (x)
    (cdro `(c o r n) `(,x r n))))

(define f02-21
  (run* (l)
    (fresh (x)
      (cdro l `(c o r n))
      (caro l x)
      (== 'a x))))

;; 28
(define conso
  (lambda (a d p)
    (== (cons a d) p)))

(define f02-22
  (run* (l)
    (conso `(a b c) `(d e) l)))

(define f02-23
  (run* (x)
    (conso x `(a b c) `(d a b c))))

(define f02-24
  (run* (r)
    (fresh (x y z)
      (== `(e a d ,x) r)
      (conso y `(a ,z c) r))))

(define f02-25
  (run* (x)
    (conso x `(a ,x c) `(d a ,x c))))

(define f02-26
  (run* (l)
    (fresh (x)
      (== `(d a ,x c) l)
      (conso x `(a ,x c) l))))

(define f02-27
  (run* (l)
    (fresh (x)
      (conso x `(a ,x c) l)
      (== `(d a ,x c) l))))

;; 28
(define conso
  (lambda (a d p)
    (== (cons a d) p)))

(define f02-29
  (run* (l)
    (fresh (d x y w s)
      (conso w `(a n s) s)
      (cdro l s)
      (caro l x)
      (== 'b x)
      (cdro l d)
      (caro d y)
      (== 'e y))))

(define f02-30
  (null? `(grape raisin pear)))

(define f02-31
  (null? `()))

;; 35
(define nullo
  (lambda (x)
    (== x `())))

(define f02-32
  (run* (q)
    (nullo `(grape raisin pear))
    (== #t q)))

(define f02-33
  (run* (q)
    (nullo `())
    (== #t q)))

(define f02-34
  (run* (x)
    (nullo x)))

;; 35
(define nullo
  (lambda (x)
    (== x `())))

(define f02-36
  (eq? 'pear 'plum))

(define f02-37
  (eq? 'plum 'plum))

;; 40
(define eqo
  (lambda (x y)
    (== x y)))

(define f02-38
  (run* (q)
    (eqo 'pear 'plum)
    (== #t q)))

(define f02-39
  (run* (q)
    (eqo 'plum 'plum)
    (== #t q)))

;; 40
(define eqo
  (lambda (x y)
    (== x y)))

(define f02-43
  (pair? `((split) . pea)))

(define f02-44
  (pair? '()))

(define f02-48
  (car `(pear)))

(define f02-49
  (cdr `(pear)))

(define f02-51
  (cons `(split) 'pea))

(define f02-52
  (run* (r)
    (fresh (x y)
      (== (cons x (cons y 'salad)) r))))

;; 53
(define pairo
  (lambda (p)
    (fresh (a d)
      (conso a d p))))

(define f02-54
  (run* (q)
    (pairo (cons q q))
    (== #t q)))

(define f02-55
  (run* (q)
    (pairo '())
    (== #t q)))

(define f02-56
  (run* (q)
    (pairo 'pair)
    (== #t q)))

(define f02-57
  (run* (x)
    (pairo x)))

(define f02-58
  (run* (r)
    (pairo (cons r 'pear))))
