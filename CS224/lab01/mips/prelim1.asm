.text
	la $a0,prompt	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	
	#comparing the number to see if its less than 20
	blt $v0,21,func
	
	li $v0,10
	syscall
	
	func:
		#array first index
		lui $s0, 0x1000
		ori $s0, $s0, 0x7000
		
		add $t0, $0, $0
		add $t1, $0, $v0	
		
		loopA:
			beq	$t0, $t1, funcB
			
			la $a0,promptB	# output prompt message on terminal
			li $v0,4	# syscall 4 prints the string
			syscall
			li $v0, 5	# syscall 5 reads an integer
			syscall
			
			sw $v0, 0($s0)
			addi $s0, $s0, 4
			
			addi	$t0, $t0, 1
			j	loopA

	funcB:
		lui	$s0, 0x1000
		ori	$s0, $s0, 0x7000
		
		add	$t0, $0, $0
		
		loopB:
			beq	$t0, $t1, funcC
			
			#outputting the current value of array
			lw	$t5, 0($s0)
			li	$v0,1
			move	$a0, $t5
			syscall
			
			la	$a0,newline
			li	$v0,4
			syscall
			
			addi	$s0, $s0, 4
			addi	$t0, $t0, 1
			j	loopB
			
	funcC:
		lui	$s1, 0x1000
		ori	$s1, $s1, 0x7000 #final array pointer
	
		add	$t0, $0, $0
		addi	$t2, $t1, -1
		
		loopC: 
			beq	$t0, $t2, funcD
			
			addi	$s1, $s1, 4
			addi	$t0, $t0, 1
			
			j	loopC
			
	funcD:
	
		lui	$s0, 0x1000
		ori	$s0, $s0, 0x7000 #initial array pointer
		
		sra	$t4, $t1, 1
		
		add	$t0, $0, $0
		
		loopD:
			bge	$t0, $t4, funcE
			
			lw	$t6, 0($s0)
			lw	$t7, 0($s1)
			sw	$t7, 0($s0)
			sw	$t6, 0($s1)
			
			addi	$t0, $t0, 1
			addi	$s0, $s0, 4
			addi	$s1, $s1, -4
			
			j	loopD
	
	funcE:
		la	$a0, reversed	# output prompt message on terminal
		li	$v0,4	# syscall 4 prints the string
		syscall
		
		add	$t0, $0, $0
		
		lui	$s0, 0x1000
		ori	$s0, $s0, 0x7000 #initial array pointer
		
		loopE:
			beq	$t0, $t1, endCall
			
			lw	$t5, 0($s0)
			li	$v0,1
			move	$a0, $t5
			syscall
			
			la	$a0,newline
			li	$v0,4
			syscall
			
			addi	$s0, $s0, 4
			addi	$t0, $t0, 1
			j	loopE
			
	endCall:
		li	$v0,10		# system call to exit
		syscall		#    bye bye
			
.data
	prompt:		.asciiz "Enter number of array elements lower than or equal to 20: "
	promptB:	.asciiz "Enter number to be entered: "
	newline:	.asciiz "\n"
	reversed:	.asciiz "the reversed numbers are: \n"
