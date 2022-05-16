.globl _start
.data
	array1: .word -1, 22, 78, 35, 5, 4, 11, 2, 1, 8
	x: .word 0
	y: .word 9
.text
_start: 

la a0, array1		# load address of array1[0] into a0
lw a2, x		# load x to a2 
lw a3, y		# load y to a3 
j quicksort

	partition:
	addi t2, a3, -1		# hi-1
	slli t5, a3, 2		# get the offset of v[y] relative to v[0]
	add t6, t5, a0		# get the address of v[y]
	lw a1, 0(t6)		# get value of v[y]
	
	add t0, zero, a2	# i = x
	addi t0, t0, -1		# i--
	
				#----initiate j before loop----------
	add t1, zero, a2	# j = x
				#------initiate j before loop--------
				
	partition_loop_head:		#--------loop condition-------------
		bgt t1, t2, partition_loop_end	# Exit loop when j > y-1
				#----------loop condition------------
		if:
					#--------if condition---------
			slli a7, t1, 2		# get the offset of v[j] relative to v[0]
			add a6, a0, a7		# get the address of v[j]
			lw  t3, 0(a6)		# get value of v[j]
			bgt t3, a1, if_end	# if v[i] > pivot => jump to if_end
					#--------if condition----------
			addi t0, t0, 1		# i++
			swap: 
				slli a4, t0, 2		# get the offset of v[i] relative to v[0]
				add a5, a4, a0		# get the address of v[i]
				lw t4, 0(a5)		# get value of v[i]
				sw t3, 0(a5)		# swap
				sw t4, 0(a6)		# swap
		if_end:
			addi t1, t1, 1		#j++
			j partition_loop_head
			
	partition_loop_end:
					#------swap v[i+1] with v[j]
		addi t0, t0, 1		# i++
		slli a4, t0, 2		# get the offset of v[i] relative to v[0]
		add a5, a4, a0		# get the address of v[i]
		lw t4, 0(a5)		# get value of v[i]
		
		slli t5, a3, 2		# get the offset of v[y] relative to v[0]
		add t6, t5, a0		# get the address of v[y]
		sw a1, 0(a5)		# swap
		sw t4, 0(t6)		# swap
		
	partition_end:
		li s0, 0
		addi s0, t0, 0
		jr ra

quicksort:
if_quicksort:
bge a2, a3, if_quicksort_end	# if(x >= y) jump to if_quicksort_end

	jal partition		# call partition with A, x, y, i.e. partition(A, x, y)
	
	li a3, 0
	add a3, a3, s0		# load p into a3
	addi a3, a3, -1		# a3--
	jal quicksort		# quicksort(A, x, p-1)
	
	addi s2, s0, 1
	li a2, 0
	add a2, a2, s2		# load s2 into a2
	lw a3, y
	jal quicksort		# quicksort(A, p+1, y)
	j exit1
if_quicksort_end:
quicksort_end:
jr ra


exit1:
lw ra, 16(sp)
lw s3, 12(sp)
lw s2, 8(sp)
lw s1, 4(sp)
lw s0, 0(sp)
addi sp, sp, 20

