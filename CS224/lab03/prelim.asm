.text
	main:
		addi	$a0, $0, 3
		addi	$a1, $0, 1
		move	$s1, $0
		move	$s2, $a0
		
		jal	recursiveDivision
		
		la	$a0, divisionPrompt
		li	$v0, 4
		syscall
		
		move	$a0, $v1
		li	$v0, 1
		syscall
		
		la	$a0, remainderPrompt
		li	$v0, 4
		syscall
		
		sub	$s2, $s2, $s1
		move	$a0, $s2
		li	$v0, 1
		syscall
		
		la	$a0, newline
		li	$v0, 4
		syscall
		
		
		
		
		#multiply
		addi	$a0, $0, 12767
		
		jal	multiplyDigits
		
		la	$a0, multiple
		li	$v0, 4
		syscall
		
		move	$a0, $v1
		li	$v0, 1
		syscall
		
		la	$a0, newline
		li	$v0, 4
		syscall
		
		li	$v0, 10
		syscall
		
		
	recursiveDivision:
		#importing arguments
		move	$t0, $a0
		move	$t1, $a1
		#checking if b is 0, to avoid error
		beq	$t1, 0, return0
		#checking if a == b so to return 1
		sub	$t2, $t0, $t1
		beq	$t2, 0, return1
		#checking if a is less than b so zero maybe returned
		blt	$t0, $t1, return0
		
		sub	$t0, $t0, $t1
		#counting quotient
		add	$s1, $s1, $t1
		#saving value of ra to stack
		addi	$sp, $sp, -4
		sw	$ra, 0( $sp)
		#calling the function recursively with a = a - b and b = b
		move	$a0, $t0
		move	$a1, $t1
		jal	recursiveDivision
		
		#retrieving returned values
		addi	$v1, $v1, 1
		lw	$ra, 0( $sp)
		addi	$sp, $sp, 4
		jr	$ra
		
		return0:
			add	$v1, $0, $0
			jr	$ra
		return1:
			addi	$v1, $0, 1
			#counting quotient
			add	$s1, $s1, $t1
			jr	$ra
	
	multiplyDigits:
		#saving arguments
		move	$s0, $a0
		#checking if last digit
		blt	$s0, 10, endMultiply
		#finding the last character
		div	$s0, $s0, 10
		mfhi	$s1
		#saving current data to stack before recursion
		addi	$sp, $sp, -8
		sw	$ra, 0( $sp)
		sw	$s1, 4( $sp)
		#calling recursively with num = num/10
		move	$a0, $s0
		jal	multiplyDigits
		#loading previous data from stack
		lw	$ra, 0( $sp)
		lw	$s1, 4( $sp)
		addi	$sp, $sp, 8
		#multiplying values collected
		mul	$v1, $v1, $s1
		jr	$ra
		
		endMultiply:
			move	$v1, $s0
			jr	$ra
	
.data

divisionPrompt:		.asciiz "Answer: "
remainderPrompt:	.asciiz	"\nRemainder: "
newline:		.asciiz	"\n"
multiple:		.asciiz "multiplication: "