(load "mk.scm")
(load "mkextraforms.scm")

(define U fail)
(define S succeed)

;; 1
(let ((x (lambda (a) a))
      (y 'c))
  (x y))

;; 2
(run* (r)
  (fresh (y x)
    (== `(,y ,x) r)))

;; 3
(run* (r)
  (fresh (v w)
    (== (let ((x v) (y w)) `(,x ,y)) r)))

;; 4
(car `(grape raisin pear))

;; 5
(car `(a c o r n))

;; 9
(define caro
  (lambda (p a)
    (fresh (d)
      (== (cons a d) p))))

;; 6
(run* (r)
  (caro `(a c o r n) r))

;; 7
(run* (q)
  (caro `(a c o r n) 'a)
  (== #t q))

;; 8
(run* (r)
  (fresh (x y)
    (caro `(,r ,y) x)
    (== 'pear x)))

;; 9
(define caro
  (lambda (p a)
    (fresh (d)
      (== (cons a d) p))))

;; 10
(cons
  (car `(grape raisin pear))
  (car `((a) (b) (c))))

;; 11
(run* (r)
  (fresh (x y)
    (caro `(grape raisin pear) x)
    (caro `((a) (b) (c)) y)
    (== (cons x y) r)))

;; 13
(cdr `(grape raisin pear))

;; 14
(car (cdr `(a c o r n)))

;; 16
(define cdro
  (lambda (p d)
    (fresh (a)
      (== (cons a d) p))))

;; 15
(run* (r)
  (fresh (v)
    (cdro `(a c o r n) v)
    (caro v r)))

;; 16
(define cdro
  (lambda (p d)
    (fresh (a)
      (== (cons a d) p))))

;; 17
(cons
  (cdr `(grape raisin pear))
  (car `((a) (b) (c))))

;; 18
(run* (r)
  (fresh (x y)
    (cdro `(grape raisin pear) x)
    (caro `((a) (b) (c)) y)
    (== (cons x y) r)))

;; 19
(run* (q)
  (cdro `(a c o r n) `(c o r n))
  (== #t q))

;; 20
(run* (x)
  (cdro `(c o r n) `(,x r n)))

;; 21
(run* (l)
  (fresh (x)
    (cdro l `(c o r n))
    (caro l x)
    (== 'a x)))

;; 28
(define conso
  (lambda (a d p)
    (== (cons a d) p)))

;; 22
(run* (l)
  (conso `(a b c) `(d e) l))

;; 23
(run* (x)
  (conso x `(a b c) `(d a b c)))

;; 24
(run* (r)
  (fresh (x y z)
    (== `(e a d ,x) r)
    (conso y `(a ,z c) r)))

;; 25
(run* (x)
  (conso x `(a ,x c) `(d a ,x c)))

;; 26
(run* (l)
  (fresh (x)
    (== `(d a ,x c) l)
    (conso x `(a ,x c) l)))

;; 27
(run* (l)
  (fresh (x)
    (conso x `(a ,x c) l)
    (== `(d a ,x c) l)))

;; 28
(define conso
  (lambda (a d p)
    (== (cons a d) p)))

;; 29
(run* (l)
  (fresh (d x y w s)
    (conso w `(a n s) s)
    (cdro l s)
    (caro l x)
    (== 'b x)
    (cdro l d)
    (caro d y)
    (== 'e y)))

;; 30
(null? `(grape raisin pear))

;; 31
(null? `())

;; 35
(define nullo
  (lambda (x)
    (== x `())))

;; 32
(run* (q)
  (nullo `(grape raisin pear))
  (== #t q))

;; 33
(run* (q)
  (nullo `())
  (== #t q))

;; 34
(run* (x)
  (nullo x))

;; 35
(define nullo
  (lambda (x)
    (== x `())))

;; 36
(eq? 'pear 'plum)

;; 37
(eq? 'plum 'plum)

;; 40
(define eqo
  (lambda (x y)
    (== x y)))

;; 38
(run* (q)
  (eqo 'pear 'plum)
  (== #t q))

;; 39
(run* (q)
  (eqo 'plum 'plum)
  (== #t q))

;; 40
(define eqo
  (lambda (x y)
    (== x y)))

;; 43
(pair? `((split) . pea))

;; 44
(pair? '())

;; 48
(car `(pear))

;; 49
(cdr `(pear))

;; 51
(cons `(split) 'pea)

;; 52
(run* (r)
  (fresh (x y)
    (== (cons x (cons y 'salad)) r)))

;; 53
(define pairo
  (lambda (p)
    (fresh (a d)
      (conso a d p))))

;; 54
(run* (q)
  (pairo (cons q q))
  (== #t q))

;; 55
(run* (q)
  (pairo '())
  (== #t q))

;; 56
(run* (q)
  (pairo 'pair)
  (== #t q))

;; 57
(run* (x)
  (pairo x))

;; 58
(run* (r)
  (pairo (cons r 'pear)))
