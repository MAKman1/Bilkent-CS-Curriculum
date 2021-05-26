.text
	la	$a0, prompt
        li	$v0,4
        syscall
        #inputting string
        la 	$a0, stringBuffer
        li	$a1, 50
        li	$v0,8
        syscall
        
       
        add	$t0, $a0, $0#t0 is initial index
        add	$t9, $a0, $0
        add	$t3, $0, $0 #t3 is the length
        
        calculateLength:
        	#finding the string length
        	lb	$t1, 0($t0)
        	beq	$t1, $0, findFinalIndex
        	
        	addi	$t0, $t0, 1
        	addi	$t3, $t3, 1
        	
        	j	calculateLength
        
        findFinalIndex:
        	add	$t0, $t9, $0
        	add	$t1, $t0, $0 #t1 is the final index
        	add 	$t4, $0, $0
        	addi	$t5, $t3, -2 #temp variable to iterate to lower length
        	
        	loopIndex:
        		beq	$t4, $t5, checkPalindrome
			
			addi	$t1, $t1, 1
			addi	$t4, $t4, 1
			
			j	loopIndex
			
	checkPalindrome:
		#checking the palindromes through loop
		bgt	$t0, $t1, palindromeOutput
		lb	$t4, 0($t0)
		lb	$t5, 0($t1)
		bne	$t4, $t5, notPalindromeOutput
		
		addi	$t0, $t0, 1
		addi	$t1, $t1, -1
		
		j	checkPalindrome
		
	palindromeOutput:
		la	$a0, pal
        	li	$v0,4
        	syscall
        	
        	li	$v0,10
         	syscall
	
	notPalindromeOutput:
        	la	$a0, notPal
        	li	$v0,4
        	syscall
        	
        	li	$v0,10
         	syscall
        	
.data
	stringBuffer:	.space 50
	prompt:		.asciiz "Enter the string for palindrome check: "
	pal:		.asciiz "Yes, it is a palindrome."
	notPal:		.asciiz "No, it is not a palindrome."
