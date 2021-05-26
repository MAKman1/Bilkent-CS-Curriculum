.text
	main:
		la	$a0, main_menu
		li	$v0, 4
		syscall
		
		la	$a0, input_option
		li	$v0, 4
		syscall
		
		#input options
		li	$v0, 5
		syscall
		
		beq	$v0, 1, option1
		beq	$v0, 2, option2
		beq	$v0, 3, option3
		beq	$v0, 4, option4
		beq	$v0, 5, option5
		beq	$v0, 6, option6
		beq	$v0, 7, option7
		beq	$v0, 8, option8
		
		j	main
		
	option1:
		la	$a0, opt1
		li	$v0, 4
		syscall
		
		#input options
		li	$v0, 5
		syscall
		move $s1, $v0
		
		mul	$a0, $s1, $s1
		addi	$t1, $zero, 4
		mul	$a0, $a0, $t1
		li	$v0, 9
		syscall
		
		move	$s0, $v0
		
		add	$t1, $zero, $zero
		add	$t2, $zero, $zero
		add	$t3, $zero, $s0
		loopInputOuter1:
		beq	$t1, $s1, loopInput1
		addi	$t1, $t1, 1
		
			loopInputInner1:
			beq	$t2, $s1, incrementInput1
			addi	$t2, $t2, 1
			
			la	$a0, input_value
			li	$v0, 4
			syscall
			move	$a0, $t1
			li	$v0, 1
			syscall
			la	$a0, comma
			li	$v0, 4
			syscall
			move	$a0, $t2
			li	$v0, 1
			syscall
			la	$a0, endbracket
			li	$v0, 4
			syscall
		
			#input options
			li	$v0, 5
			syscall
			
			sw	$v0, 0($t3)
			addi	$t3, $t3, 4
			
			j	loopInputInner1
			
		incrementInput1:
		add	$t2, $zero, $zero
		j	loopInputOuter1
		
		loopInput1:
		j	main
			
			
		
		
	option2:
		la	$a0, opt1
		li	$v0, 4
		syscall
		
		#input options
		li	$v0, 5
		syscall
		move $s1, $v0
		
		mul	$a0, $s1, $s1
		addi	$t1, $zero, 4
		mul	$a0, $a0, $t1
		li	$v0, 9
		syscall
		
		move	$s0, $v0
		
		add	$t1, $zero, $zero
		add	$t2, $zero, $zero
		add	$t3, $zero, $s0
		addi	$t4, $zero, 1
		loopInputOuter2:
		beq	$t1, $s1, loopInput2
		addi	$t1, $t1, 1
		
			loopInputInner2:
			beq	$t2, $s1, incrementInput2
			addi	$t2, $t2, 1
			
			sw	$t4, 0($t3)
			addi	$t3, $t3, 4
			addi	$t4, $t4, 1
			
			j	loopInputInner2
			
		incrementInput2:
		add	$t2, $zero, $zero
		j	loopInputOuter2
		
		loopInput2:
		j	main
	option3:
		la	$a0, opt3
		li	$v0, 4
		syscall
		
		#input options
		li	$v0, 5
		syscall
		move $t0, $v0
		
		la	$a0, opt4
		li	$v0, 4
		syscall
		
		#input options
		li	$v0, 5
		syscall
		move $t1, $v0
		
		subi	$t0, $t0, 1
		subi	$t1, $t1, 1
		
		#skipping rows
		addi	$t5, $zero, 4
		mul	$t2, $t0, $s1
		mul	$t3, $t2, $t5
		
		#skipping columns
		mul	$t2, $t5, $t1
		add	$t3, $t3, $t2
		add	$t3, $s0, $t3
		
		lw	$t2, 0($t3)
		move	$a0, $t2
		li	$v0, 1
		syscall
		
		la	$a0, newline
		li	$v0, 4
		syscall

		j	main
		
	option4:
		
		add	$t1, $zero, $zero
		add	$t2, $zero, $zero
		add	$t3, $zero, $s0
		loopInputOuter4:
		beq	$t1, $s1, loopInput4
		
			loopInputInner4:
			beq	$t2, $s1, incrementInput4
			
			lw	$t4, 0($t3)
			move	$a0, $t4
			li	$v0, 1
			syscall
			addi	$t3, $t3, 4
			
			la	$a0, space
			li	$v0, 4
			syscall		
			
			addi	$t2, $t2, 1
			j	loopInputInner4
			
		incrementInput4:
		la	$a0, newline
		li	$v0, 4
		syscall
			
		addi	$t1, $t1, 1
		add	$t2, $zero, $zero
		j	loopInputOuter4
		
		loopInput4:
		j	main
		
	option5:
		add	$t0, $zero, $zero
		addi	$t5, $zero, 4
		add	$v0, $zero, $zero
		
			loopThrough5:
			beq	$t0, $s1, endOption5
			
			#skipping rows
			mul	$t1, $t0, $s1
			mul	$t2, $t1, $t5
		
			#skipping columns
			mul	$t3, $t5, $t0
			add	$t4, $t3, $t2
			add	$t3, $s0, $t4
			
			lw	$t4, 0($t3)
			
			add	$v0, $v0, $t4
			
			addi	$t0, $t0, 1
			j	loopThrough5
			
			endOption5:
			move	$t0, $v0
			
			la	$a0, option5_prompt
			li	$v0, 4
			syscall
			
			move	$a0, $t0
			li	$v0, 1
			syscall
		
			la	$a0, newline
			li	$v0, 4
			syscall
			
			j	main
			
			
		
	option6:
		add	$t0, $s1, $zero
		addi	$t5, $zero, 4
		add	$v0, $zero, $zero
		
			loopThrough6:
			beq	$t0, $zero, endOption6
			subi	$t0, $t0, 1
			
			#skipping rows
			mul	$t1, $t0, $s1
			mul	$t2, $t1, $t5
		
			#skipping columns
			mul	$t3, $t5, $t0
			add	$t4, $t3, $t2
			add	$t3, $s0, $t4
			
			lw	$t4, 0($t3)
			
			add	$v0, $v0, $t4
			
			j	loopThrough6
			
			endOption6:
			move	$t0, $v0
			
			la	$a0, option6_prompt
			li	$v0, 4
			syscall
			
			move	$a0, $t0
			li	$v0, 1
			syscall
		
			la	$a0, newline
			li	$v0, 4
			syscall
			
			j	main
	option7:
		add	$t0, $zero, $zero
		add	$t1, $zero, $zero
		add	$t2, $zero, $zero
		addi	$t5, $zero, 4
		
		
		loopInputOuter7:
		beq	$t0, $s1, loopInput7
		
			loopInputInner7:
			beq	$t1, $s1, incrementInput7
			
			
			#skipping rows
			mul	$t3, $t0, $s1
			mul	$t4, $t3, $t5
		
			#skipping columns
			mul	$t3, $t5, $t1
			add	$t3, $t3, $t4
			add	$t3, $s0, $t3
		
			lw	$t4, 0($t3)
			addi	$t3, $t3, 4
			add	$t2, $t2, $t4
			
			addi	$t1, $t1, 1
			j	loopInputInner7
			
		incrementInput7:
		add	$t1, $zero, $zero
		addi	$t0, $t0, 1
		j	loopInputOuter7
		
		loopInput7:
		la	$a0, option7_prompt
		li	$v0, 4
		syscall
			
		move	$a0, $t2
		li	$v0, 1
		syscall
		
		la	$a0, newline
		li	$v0, 4
		syscall
		
		j	main
	option8:
		add	$t0, $zero, $zero
		add	$t1, $zero, $zero
		add	$t2, $zero, $zero
		addi	$t5, $zero, 4
		
		
		loopInputOuter8:
		beq	$t0, $s1, loopInput8
		
			loopInputInner8:
			beq	$t1, $s1, incrementInput8
			
			
			#skipping columns
			mul	$t3, $t1, $s1
			mul	$t4, $t3, $t5
		
			#skipping rows
			mul	$t3, $t5, $t0
			add	$t3, $t3, $t4
			add	$t3, $s0, $t3
		
			lw	$t4, 0($t3)
			addi	$t3, $t3, 4
			add	$t2, $t2, $t4
			
			addi	$t1, $t1, 1
			j	loopInputInner8
			
		incrementInput8:
		add	$t1, $zero, $zero
		addi	$t0, $t0, 1
		j	loopInputOuter8
		
		loopInput8:
		la	$a0, option8_prompt
		li	$v0, 4
		syscall
			
		move	$a0, $t2
		li	$v0, 1
		syscall
		
		la	$a0, newline
		li	$v0, 4
		syscall
		
		j	main
	


.data
	main_menu:	.asciiz "1. Ask the user the matrix size in terms of its dimensions (N), and then ask the user enter matrix elements row by row.\n2. Ask the user the matrix size in terms of its dimensions (N), and initialize the matrix entries with consecutive values  (1, 2, 3 ...) \n3. Display a desired element of the matrix by specifying its row and column number, \n4. Display entire matrix row by row \n5. Obtain trace of the matrix and display,\n6. Obtain trace like summation using the other diagonal of the matrix and display,\n7. Obtain sum of matrix elements by row-major (row by row) summation,\n8. Obtain sum of matrix elements by column-major (column by column) summation."
	input_option:	.asciiz "\nPlease select your option: "
	
	input_value:	.asciiz	"Enter value for ("
	comma:		.asciiz ", "
	endbracket:	.asciiz "):"
	space:		.asciiz " "
	newline:	.asciiz "\n"
	opt1:	.asciiz "Enter matrix size in dimensions (N): "
	opt3:	.asciiz "Please enter row: "
	opt4:	.asciiz "Please enter column: "
	option5_prompt:		.asciiz "The trace is: "
	option6_prompt:		.asciiz "The reverse trace is: "
	option7_prompt:		.asciiz "Row-by-row sum is: "
	option8_prompt:		.asciiz "column-by-column sum is: "
