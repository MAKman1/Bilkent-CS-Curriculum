;Function definition for Pair-up
;-------------------------------

;Pair up function that takes two lists in input
;and returns an associative list
(define (pair-up listKeys listValues)
  (cond
    ;assuming that both lists are equal in size
    ;if listKeys is null, listValues is null too
    ;return null if input list is null
    ((null? listKeys) '())
    
    ;If listKeys is not a list and a single element
    ;listValues is single element too, so return a single
    ;pair of the two input elements (atoms)
    ;This also applies to the end case of the recursion when
    ;only one element is left in the list
    ((not (list? listKeys)) (cons (cons listKeys listValues) '())
  )
  
  ;If the input array is a proper array
  (else
    ;Merge the current pair and the associative list returned
    ;by the further recursive calls to the function
    (cons
    
      ;Make a pair from the first elements from both lists
      (cons (car listKeys) (car listValues))
      
      ;Tail recursive function call to get further paired
      ;elements for the asociative list
      (pair-up (cdr listKeys) (cdr listValues))
    )
  )
))

; Defining Associative Arrays
;----------------------------

;Creating a function that makes an
;associative list from two elements(atoms)
(define list_test_1 (pair-up 'Arham 'Khan))
(display list_test_1)
(display "\n")

;Creating a function that makes an
;associative list from null elements
;and returns a null list
(define list_test_2 (pair-up '() '()))
(display list_test_2)
(display "\n")

;Creating a function that makes an
;associative list from two lists
(define list_test_3 (pair-up '(Qveen Taylor Cardi Billie Camila) '(Herby Swift B Eilish Cabello)))
(display list_test_3)
(display "\n")

;Creating a function that makes an
;associative list from two lists
(define list_test_4 (pair-up '(A B C D) ( list 1 2 3 4)))
(display list_test_4)
(display "\n\n____________\n\n")


;Validating Associative Arrays
;-----------------------------

;Testing for the existence of Arham in
;list returned by list_test_3
;which doesn't contain "Arham: key so
;returns #f
(display (assq 'Arham list_test_3))
(display "\n")

;Testing for the existence of Arham in
;list returned by list_test_1
;returns the pair
(display (assq 'Arham list_test_1))
(display "\n")

;Testing for the existence of Arham in
;list returned by list_test_3
;returns the pair with mentioned key
(display (assq 'Billie list_test_3))
(display "\n")

;Testing for the existence of Arham in
;list returned by list_test_4
;returns the pair
(display (assq 'B list_test_4))
(display "\n")