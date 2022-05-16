.globl _start
.data 
	array1: .word -1, 22, 8, 35, 5, 4, 11, 2, 1, 78
.text
_start:
	la, a0, array1
	li a1, 0		# use a1 to denote i, a2 to denote j
	
loop2_head: 
	li a6, 10		# array length
	ble a6, a1, loop2_end	
	add a2, zero, a1	# j=i
	addi a2, a2, -1		# j=j-1		
	
loop1_head:		
		if1:		# if(0>j) => EXIT 
			bge zero, a2, loop1_end
		if2:		# if(v[k]<v[k+1]) => EXIT
			slli t1, a2, 2		# get the offset of v[k] relative to v[0]
			add t1, a0, t1		# get the address of v[k]
			lw t0, 0(t1)		# load the v[k] to t0
			lw t2, 4(t1)		# load the v[k+1] to t2
			blt t0, t2, loop1_end
		swap:	
			sw t2, 0(t1)		# store t2 to the v[k]
			sw t0, 4(t1)		# store t0 to the v[k+1] 
			
			addi a2, a2, -1	# j--
			j loop1_head	
loop1_end: 
	addi a1, a1, 1			# i++
	j loop2_head
	
loop2_end:	

exit1: 
	lw ra, 16(sp)
	lw s3, 12(sp)
	lw s2, 8(sp)
	lw s3, 4(sp)
	lw s0, 0(sp)
	addi sp, sp, 20
