;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname PLC_HW6_YH) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;============================
;PLC HW6 Yanhong Wang(yz5423)
;============================


;Problem 1 
(define
  (binomial N k) 
  (if(= k 0) ;if k=0, C(N,0)=1
     1
     (if(= k N) ;if k=N, C(N,N)=1
        1
        (+ (binomial (- N 1) k) (binomial (- N 1) (- k 1))) ;else C(N,k)=C(N-1,k)+C(N-1,k-1)
        )
     )
  )
 ;*********Problem 1 Output:
 ;> (binomial 10 3)
 ;120
 ;> (binomial 5 3)
 ;10
 ;**************************


;Problem 2
(define 
  (mod N M)
   (remainder N M) ;return the modulus remainder when dividing N by M
)
 ;*********Problem 2 Output:
 ;> (mod 5 3)
 ;2
 ;> (mod 100 33)
 ;1
 ;**************************


;Problem 3
(define 
  (binaryToDecimal b)
  (if(= b 0) ;if the binary is 0, decimal also 0;
    0
    (+ (remainder b 10) (* 2 (binaryToDecimal (quotient b 10)))) ;else add every digits with correspond 2 times
  )
)
 ;*********Problem 3 Output:
 ;> (binaryToDecimal 1101)
 ;13
 ;> (binaryToDecimal 101)
 ;5
 ;**************************


;Problem 4
(define
  (addBinary binaryList)
  (if(null? binaryList) ;if the list is null, the add is 0
     0
     (+ (binaryToDecimal(car binaryList)) (addBinary(cdr binaryList))) ;else all the binaryToDecimal function dor each elemnt add togther
     )
  )
 ;*********Problem 4 Output:
 ;> (addBinary '(1101 111 10 101))
 ;27
 ;> (addBinary '(11 101 01))
 ;9
 ;**************************


;Problem 5
(define
  (Min list)
  (if (null? list)
      '() ;if the list is empty, returns empty
      (if (null? (cdr list))
          (car list) ;if only onr elements, it is min
          (if (> (car list) (car (cdr list)))
              (Min (cdr list));if the 1st element is greater than 2nd element, check the rest list
              (Min (cons (car list) (cdr (cdr list))))  ;else go through list except the second element.
              )
          )
      )
  )
 ;*********Problem 5 Output:
 ;> (Min '(5 6 7 1 10))
 ;1
 ;> (Min '(9 8 4 23 66))
 ;4
 ;**************************


;Problem 6
(define
  (myRemove num list)
  (if (null? list)
      '() ;if it is the empty list, returns empty
      (if(= (car list) num)
         (cdr list) ;if the first list is num, return the rest of the list
         (cons (car list) (myRemove num (cdr list))) ;else recursive continue check the other elments
         )
      )
  )
 ;*********Problem 6 Output:
 ;> (myRemove 4 '(1 2 3 4 5 6))
 ;(list 1 2 3 5 6)
 ;> (myRemove 9 '(5 6 7 8))
 ;(list 5 6 7 8)
 ;**************************


;Problem 7
(define
  (selectionSort list)
  (if (null? list)
      list ;if the list is empty, return back the empty list
      (if (null? (cdr list))
          list ;if the list has one emelents, return the list
          (cons (Min list) (selectionSort (myRemove (Min list) list))) ;else construct the min elment each time with the new remove list by call the recursive selectionSort
          )
      )
  )
 ;*********Problem 7 Output:
 ;> (selectionSort '(6 5 4 3 2 1))
 ;(list 1 2 3 4 5 6)
 ;> (selectionSort '(7 8 10 5 2 1 12))
 ;(list 1 2 5 7 8 10 12)
 ;**************************
