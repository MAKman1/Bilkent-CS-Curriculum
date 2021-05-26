.text
	la $a0,promptA	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	move	$t0, $v0
	
	la $a0,promptB	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	move	$t1, $v0
	
	la $a0,promptC	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	move	$t2, $v0
	
	
	la $a0,promptD	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	move	$t3, $v0
	
	
	calculation:
		mul	$t1, $t1, 3
		add	$t0, $t0, $t1
		mul	$t0, $t0, 3
		
		div	$t2, $t2, 4
		
		mul	$t0, $t0, $t2
		
		
		div	$t0, $t3
		mfhi	$t1
		
	output:
		la $a0,outputPrompt	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
		
		move $a0,$t1	# print integer result
		li $v0,1		# using syscall 1
		syscall

		la $a0, newline	# system call to print
		li $v0,4		# out a newline
		syscall
		
		li $v0,10
		syscall
		


.data
	promptA:	.asciiz "Value for a: "
	promptB:	.asciiz "Value for b: "
	promptC:	.asciiz "Value for c: "
	promptD:	.asciiz "Value for d: "
	newline:	.asciiz "\n"
	
	outputPrompt:	.asciiz "The output is: "