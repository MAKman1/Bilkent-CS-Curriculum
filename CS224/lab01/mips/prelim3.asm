.text
	la	$a0, prompt
        li	$v0,4
        syscall
        
        la	$a0, prompt1
        li	$v0,4
        syscall
        
        li	$v0, 5	# input the value of c
	syscall
	add	$t0, $v0, $0 #t0 is c
	
	la	$a0, prompt2
        li	$v0,4
        syscall
        
        li	$v0, 5	# input the value of d
	syscall
	add	$t1, $v0, $0 #t1 is d
	sub	$t2, $t0, $t1 #t2 stores the c - d
	
	blt	$t2, $0, fixNegative
	
	#output if the difference is positive
	sra	$t3, $t2, 4
	mul	$t4, $t3, 16
	sub	$t4, $t2, $t4 
	
	move	$a0,$t4	# print result
	li	$v0, 1
	syscall
	
	li	$v0,10
        syscall
	
	fixNegative:
		sub	$t3, $0, $t2
		
		#output if the difference is positive
		sra	$t4, $t3, 4
		mul	$t5, $t4, 16
		sub	$t5, $t3, $t5 
		sub	$t5, $0, $t5
		
		move	$a0,$t5	# print result
		li	$v0, 1
		syscall
		
		li	$v0,10
        	syscall

.data
	prompt: .asciiz "Evaluation of x = (c - d) % 16\n==============================\n"
	prompt1: .asciiz "Enter the value of c: "
	prompt2: .asciiz "Enter the value of d: "