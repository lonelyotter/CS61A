(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cdr (cdr s))))

(define (sign num)
  (cond 
    ((< num 0) -1)
    ((= num 0) 0)
    ((> num 0) 1)))

(define (square x) (* x x))

(define (pow x y)
  (if (= y 1)
      x
      (if (even? y)
          (square (pow x (/ y 2)))
          (* x (square (pow x (floor (/ y 2))))))))

(define (unique s)
  (if (null? s)
      nil
      (cons (car s)
            (unique (filter (lambda (x) (not (eq? x (car s))))
                            (cdr s))))))

(define (replicate x n)
  (define (rep_help x n s)
    (if (= n 0)
        s
        (rep_help x (- n 1) (cons x s))))
  (rep_help x n nil))

(define (accumulate combiner start n term)
  (define (helper combiner i term)
    (if (= i n)
        (term n)
        (combiner (term i) (helper combiner (+ i 1) term))))
  (combiner start (helper combiner 1 term)))

(define (accumulate-tail combiner start n term)
  (define (helper combiner i term ans)
    (if (= i n)
        (combiner ans (term n))
        (helper combiner
                (+ i 1)
                term
                (combiner ans (term i)))))
  (helper combiner 1 term start))

(define-macro
 (list-of map-expr for var in lst if filter-expr)
 `(map (lambda (,var) ,map-expr)
       (filter (lambda (,var) ,filter-expr) ,lst)))

(list-of (* x x) for x in '(3 4 5) if (odd? x))
