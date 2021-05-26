.text
	main:
		#initialize stack
		addi	$sp, $sp, -20
		add	$s0, $0, $0
		add	$s1, $0, $0
		add	$s2, $0, $0
		add	$s3, $0, $0
		add	$s4, $0, $0
		
		loopMenu:
			la	$a0, menuPrompt
			li	$v0, 4
			syscall
		
			li	$v0, 5
			syscall
			 
			beq	$v0, 1, inputArray
			beq	$v0, 2, optionA
			beq	$v0, 3, optionB
			beq	$v0, 4, printArrayMenu
			beq	$v0, 5, quit
			
			j	loopMenu

	inputArray:
		#input array
		jal	readArray
		j	loopMenu
	optionA:
		#loop through array anbd print
		lw	$s0, 0( $sp)
		lw	$s1, 4( $sp)
		move	$a0, $s0
		move	$a1, $s1
		
		#sort array
		jal	insertionSort
		j	loopMenu
	optionB:
		#loop through array anbd print
		lw	$s0, 0( $sp)
		lw	$s1, 4( $sp)
		move	$a0, $s0
		move	$a1, $s1
		
		#sort array
		jal	insertionSort
		
		#load size and index values from stack
		lw	$s0, 0( $sp)
		lw	$s1, 4( $sp)
		move	$a0, $s0
		move	$a1, $s1
		
		#calculate median
		jal	medianMode
	
		#get values from returned values
		move	$s3, $v0
		move	$s4, $v1
		
		#output median and mode
		la	$a0, median
		li	$v0, 4
		syscall
		move	$a0, $s3
		li	$v0, 1
		syscall
		la	$a0, newline
		li	$v0, 4
		syscall
		
		la	$a0, mode
		li	$v0, 4
		syscall
		move	$a0, $s4
		li	$v0, 1
		syscall
		la	$a0, newline
		li	$v0, 4
		syscall
		
		j	loopMenu
	
	printArrayMenu:
		jal	printArray
		j	loopMenu
		
	quit:
		li	$v0, 10
		syscall
	
		
	printArray:
		#loop through array anbd print
		lw	$s0, 0( $sp)
		lw	$s1, 4( $sp)
		
		add	$s2, $0, $0
		loopPrint:
			beq	$s1, $s2, endLoop
			
			lw	$s3, 0( $s0)
			move	$a0, $s3
			li	$v0, 1
			syscall
			
			la	$a0, separator
			li	$v0, 4
			syscall
			
			addi	$s0, $s0, 4
			addi	$s2, $s2, 1
			
			j	loopPrint
		endLoop:
			la	$a0, newline
			li	$v0, 4
			syscall
		
			lw	$s0, 0( $sp)
			jr	$ra
	
	readArray:
		#input size
		la	$a0, numberCountPrompt
		li	$v0, 4
		syscall
		
		li	$v0, 5
		syscall
		move	$s1, $v0
		
		move	$a0, $v0
		li	$v0, 9  
		syscall
		move	$s0, $v0
		
		la	$a0, newline
		li	$v0, 4
		syscall
		
		#save values to stack
		sw	$s0, 0( $sp)
		sw	$s1, 4( $sp)
		sw	$s2, 8( $sp)
		sw	$s3, 12( $sp)
		sw	$s4, 16( $sp)
		
		add	$s2, $0, $0
		addNumbers:
			#iterate  through and add numbers
			beq	$s2, $s1, numbersAdded
			
			la	$a0, numberEntryPrompt
			li	$v0, 4
			syscall
			li	$v0, 5
			syscall
			
			blt	$v0, 0, addNumbers
			bgt	$v0, 100, addNumbers
			
			sw	$v0, 0( $s0)
			addi	$s0, $s0, 4
			addi	$s2, $s2, 1
			j	addNumbers
		numbersAdded:
			#all numbers added so return
			lw	$s0, 0($sp)
			move	$v0, $s0
			move	$v1, $s1
			
			jr	$ra
			
	insertionSort:
		move	$s0, $a0
		move	$s1, $a1
	
		add	$s2, $0, $0
		loopA:
			#loop through all values
			beq	$s2, $s1, endSort
			move	$s3, $s2
			move	$s6, $s0
			loopB:
				#take value and keep switching until prev value is lesser
				blt	$s3, 1, endLoopB
				lw	$s4, 0($s6)
				lw	$s5, -4($s6)
				bgt	$s5, $s4, incrementLoopB
				j	endLoopB
				
				incrementLoopB:
					#switch values and go back
					sw	$s5, 0($s6)
					sw	$s4, -4( $s6)
					addi	$s6, $s6, -4
					addi	$s3, $s3, -1
					j	loopB
					
			endLoopB:
				#go to next value in array
				addi	$s2, $s2, 1
				addi	$s0, $s0, 4
				j	loopA
					
			endSort:
				#return sorted values arrau
				lw	$s0, 0( $sp)	
				move	$v0, $s0
				move	$v1, $s1
				jr	$ra
				
	medianMode:
		#finding median
		move	$s0, $a0
		move	$s1, $a1
		
		div	$s2, $s1, 2
		mfhi	$s3
		add	$s4, $0, $0
			loopToMedian:
				#go to median position
				addi	$s0, $s0, 4
				addi	$s4, $s4, 1
				blt	$s4, $s2, loopToMedian
				
		
		beq	$s3, 0, evenMedian
		lw	$s2, 0( $s0)
		sw	$s2, 8( $sp)
		j	findMode
		
		evenMedian:
			#if number of elements is even
			addi	$s0, $s0, -4
			lw	$s2, 0( $s0)
			
			addi	$s0, $s0, 4
			lw	$s3, 0( $s0)
			
			add	$s2, $s2, $s3
			div	$s2, $s2, 2
			
			sw	$s2, 8( $sp)
						
		findMode:
			#calc mode
			lw	$s0, 0( $sp)
			lw	$s1, 4( $sp)
			
			
			move	$s4, $0 #last number
			add	$s2, $0, $0 #current Counter
			add	$s5, $0, $0 #iteration
			add	$s6, $0, $0 #max count
			move	$s7, $0	#max number
		
			loopThrough:
				#go to each value and check if its last
				beq	$s5, $s1, endMode
				
				lw	$s3, 0( $s0)
				#if value is not equal to previous, check if previous was max
				bne	$s4, $s3, checkMax
				
				#increment
				addi	$s2, $s2, 1
				addi	$s5, $s5, 1
				move	$s4, $s3
				addi	$s0, $s0, 4
				
				j	loopThrough
				
				checkMax:
					#if current count was greater than max count
					beq	$s2, $0, setMax
					bgt	$s2, $s6, isMax
					
					add	$s2, $0, $0
					addi	$s2, $s2, 1
					addi	$s5, $s5, 1
					move	$s4, $s3
					addi	$s0, $s0, 4
					
					j	loopThrough
					 
				setMax:
					#for first value
					move	$s7, $s3
					add	$s6, $0, 1
					
					addi	$s2, $0, 1
					
					addi	$s5, $s5, 1
					move	$s4, $s3
					addi	$s0, $s0, 4
				
					j	loopThrough
				isMax:
					#change max value to this value
					move	$s7, $s4
					move	$s6, $s2
					
					add	$s2, $0, $0
					addi	$s2, $s2, 1
					
					addi	$s5, $s5, 1
					move	$s4, $s3
					addi	$s0, $s0, 4
				
					j	loopThrough
					
			endMode:
				#mode found, return median and mode
				lw	$v0, 8( $sp) #median
				move	$v1, $s7 #mode
				jr	$ra
			
			
			
			
		
		
		
				
				
		
		
		
		


.data
numberCountPrompt:	.asciiz "Please enter the number of array elements: "
numberEntryPrompt:	.asciiz "Enter number: "
newline:	.asciiz	"\n"
test:	.asciiz "test\n"
median:		.asciiz "median: "
mode:		.asciiz "mode: "
separator:	.asciiz	", "
sorted:		.asciiz "sorted: "
unsorted:	.asciiz "unsorted: "
menuPrompt:	.asciiz "Menu:\n 1. input array\n 2. sort array \n 3. calculate median and mode\n 4. print array \n 5. quit\n selection: "