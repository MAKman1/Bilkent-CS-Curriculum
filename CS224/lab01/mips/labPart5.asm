.text		
.globl __start
__start:

	la $a0,prompt	# output prompt message on terminal
	li $v0,4	# syscall 4 prints the string
	syscall
	
	#input the integer
	li $v0, 5	# syscall 5 reads an integer
	syscall
	
	#comparing the number to see if its less than 20
	blt $v0,101,inputNumbers
	
	li $v0,10
	syscall
	
	lw	$s0, 0($sp)
	addi	$sp, $sp, 8
	
	inputNumbers:
		#array first index
		lui 	$s0, 0x1000
		ori 	$s0, $s0, 0x7000
		
		add $t1, $0, $0
		add $t0, $0, $v0	
		
		loopA:
			beq	$t1, $t0, initiateMenu
			
			la $a0,promptB	# output prompt message on terminal
			li $v0,4	# syscall 4 prints the string
			syscall
			li $v0, 5	# syscall 5 reads an integer
			syscall
			
			sw $v0, 0($s0)
			addi $s0, $s0, 4
			
			addi	$t1, $t1, 1
			j	loopA
			
	initiateMenu:
		lui 	$s0, 0x1000
		ori 	$s0, $s0, 0x7000
		addi	$sp, $sp, -8
		sw	$s0, 0( $sp)
		sw	$t0, 4( $sp)
	
	
		la $a0,menuPrompt	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
	
		#input the integer
		li $v0, 5	# syscall 5 reads an integer
		syscall
		
		beq	$v0, 1, partA
		beq	$v0, 2, partB
		beq	$v0, 3, partC
		beq	$v0, 4, partD
		beq	$v0, 5, endProgram
		
		la	$a0, invalidMenuPrompt	# output prompt message on terminal
		li	$v0,4	# syscall 4 prints the string
		syscall
		
		j	initiateMenu
		
		#check the options
		
	partA:
		la $a0,partAinputPrompt	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
	
		#input the integer
		li $v0, 5	# syscall 5 reads an integer
		syscall
		
		#array first index
		lw	$s0, 0($sp)
		lw	$t0, 4($sp)
		addi	$sp, $sp, 8
		
		add $t2, $0, $0
		add $t1, $0, $0 #count the iterations	
		
		loopPartA:
			beq	$t1, $t0, outputPartA
			
			lw	$s1, 0($s0)
			bgt	$s1, $v0, addValue
			addi	$s0, $s0, 4
			addi	$t1, $t1, 1
			j	loopPartA
		
		addValue:
			add	$t2, $t2, $s1
			addi	$s0, $s0, 4
			addi	$t1, $t1, 1
			j	loopPartA
			
		outputPartA:
			la $a0,partAoutputPrompt	# output prompt message on terminal
			li $v0,4	# syscall 4 prints the string
			syscall
			
			move $a0,$t2	# print integer result
			li $v0,1		# using syscall 1
			syscall

			la $a0, newline	# system call to print
			li $v0,4		# out a newline
			syscall
	
	j	initiateMenu
	
	partB:
		la $a0,partBinputPrompt1	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
	
		#input the integer
		li $v0, 5	# syscall 5 reads an integer
		syscall
		move	$s2, $v0
		
		la $a0,partBinputPrompt2	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
	
		#input the integer
		li $v0, 5	# syscall 5 reads an integer
		syscall
		move	$s3, $v0
		
		#array first index
		lw	$s0, 0($sp)
		lw	$t0, 4($sp)
		addi	$sp, $sp, 8
		
		add $t2, $0, $0
		add $t1, $0, $0 #count the iterations	
		
		loopPartB:
			beq	$t1, $t0, outputPartB
			
			lw	$s1, 0($s0)
			bge	$s1, $s2, addValueCheck
			addi	$s0, $s0, 4
			addi	$t1, $t1, 1
			j	loopPartB
		addValueCheck:
			ble	$s1, $s3, addValueB 
			addi	$s0, $s0, 4
			addi	$t1, $t1, 1
			j	loopPartB
			
		addValueB:
			add	$t2, $t2, $s1
			addi	$s0, $s0, 4
			addi	$t1, $t1, 1
			j	loopPartB
			
		outputPartB:
			la $a0,partBoutputPrompt	# output prompt message on terminal
			li $v0,4	# syscall 4 prints the string
			syscall
			
			move $a0,$t2	# print integer result
			li $v0,1		# using syscall 1
			syscall

			la $a0, newline	# system call to print
			li $v0,4		# out a newline
			syscall
	j	initiateMenu
	partC:
		
		la $a0,partCinputPrompt	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
	
		#input the integer
		li $v0, 5	# syscall 5 reads an integer
		syscall
		move	$t4, $v0 #s1 is the divisor
		
		#array first index
		lw	$s0, 0($sp)
		lw	$t0, 4($sp)
		addi	$sp, $sp, 8
		
		add	$t1, $0, $0 #occurence counter
		add	$t2, $0, $0 #iteration counter
		
		loopC:
			beq	$t2, $t0, outputPartC
			
			lw	$s1, 0($s0)
			div	$s1, $t4
			mfhi	$t5
			beq	$0, $t5, addNumberHere
			addi	$s0, $s0, 4
			addi	$t2, $t2, 1
			j	loopC
			
		addNumberHere:
			addi	$t1, $t1, 1
			addi	$s0, $s0, 4
			addi	$t2, $t2, 1
			j	loopC
			
		outputPartC:
			la $a0,partCoutputPrompt	# output prompt message on terminal
			li $v0,4	# syscall 4 prints the string
			syscall
			
			move $a0,$t1	# print integer result
			li $v0,1		# using syscall 1
			syscall

			la $a0, newline	# system call to print
			li $v0,4		# out a newline
			syscall
	j	initiateMenu
	
	partD:
	
		la $a0,partDHeading	# output prompt message on terminal
		li $v0,4	# syscall 4 prints the string
		syscall
		
		#array first index
		lw	$s0, 0($sp)
		lw	$s1, 0( $sp)
		lw	$t0, 4($sp)
		
		add	$t1, $0, $0 #iteration counter
		add	$t2, $0, $0 #iteration counter 2
		add	$t3, $0, $0 #unique counter
		loopD:
			beq	$t1, $t0, outputPartD
			add	$t7, $0, $0
			lw	$t4, 0($s0)
			loopD2:
				beq	$t2, $t0, incrementCount
				
				lw	$t5, 0($s1)
				beq	$t5, $t4, incrementUnique		
				
				addi	$t2, $t2, 1
				addi	$s1, $s1, 4
				j	loopD2
				
			incrementCount:
				ble	$t7, 1, uniqueUp
				
				lw	$s1, 0( $sp)
				add	$t2, $0, $0
				addi	$t1, $t1, 1
				addi	$s0, $s0, 4
				j	loopD
				
			uniqueUp:
				addi	$t3, $t3, 1
				
				move $a0,$t4	# print integer result
				li $v0,1		# using syscall 1
				syscall
				
				la $a0,partDseparator	# output prompt message on terminal
				li $v0,4	# syscall 4 prints the string
				syscall
				
				
			
				lw	$s1, 0( $sp)
				add	$t2, $0, $0
				addi	$t1, $t1, 1
				addi	$s0, $s0, 4
				j	loopD
				
			incrementUnique:
				addi	$t7, $t7, 1
				addi	$t2, $t2, 1
				addi	$s1, $s1, 4
				j	loopD2
			j	loopD
			
			outputPartD:
				la $a0, newline	# output prompt message on terminal
				li $v0,4	# syscall 4 prints the string
				syscall
			
				la $a0,partDoutputPrompt	# output prompt message on terminal
				li $v0,4	# syscall 4 prints the string
				syscall
			
				move $a0,$t3	# print integer result
				li $v0,1		# using syscall 1
				syscall

				la $a0, newline	# system call to print
				li $v0,4		# out a newline
				syscall
		
	addi	$sp, $sp, 8
	j	initiateMenu
	
	endProgram:
		li $v0,10
		syscall
		




.data

prompt:		.asciiz "Enter number of array elements lower than or equal to 100: "
promptB:	.asciiz "Enter number to be entered: "
newline:	.asciiz "\n"


menuPrompt:	.asciiz "MENU\n=================================\nSelect your desired option:\n1. Summation\n2. Summation (in range)\n3. Number of occurences\n4. Number of unique numbers\n5. QUIT!\n Please enter your desired option: "
invalidMenuPrompt:	.asciiz "INVALID SELECTION!\n"


partAinputPrompt:	.asciiz "Please enter the number for comparison: "
partAoutputPrompt:	.asciiz "The summation is: "

partBinputPrompt1:	.asciiz "Please enter initial range number: "
partBinputPrompt2:	.asciiz "Please enter final range number: "
partBoutputPrompt:	.asciiz "The summation is: "

partCinputPrompt:	.asciiz "Please enter the divisor: "
partCoutputPrompt:	.asciiz "The number of divisible occurences is: "

partDoutputPrompt:	.asciiz "The unique numbers are: "
partDseparator:		.asciiz ", "
partDHeading:		.asciiz "Unique elements: "
