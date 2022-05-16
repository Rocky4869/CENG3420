.globl _start
.data

var1: .word 15
var2: .word 19
var1_txt1_add: .asciz "var1 address: "
var2_txt1_add: .asciz "var2 address: "
var1_txt2_add: .asciz "var1: "
var2_txt2_add: .asciz "var2: "
var1_txt3_add: .asciz "Swap var1: "
var2_txt3_add: .asciz "Swap var2: "
new_line: .string "\n"

.text


_start:

# Print address of var1 and var2 
la a0, var1_txt1_add	
li a7, 4	
ecall	# print "var1 address: "

la a0, var1
li a7, 1	
ecall	# print address of var1

la a0, new_line
li a7, 4	
ecall	# print "\n"

la a0, var2_txt1_add
li a7, 4	
ecall	# print "var2 address: "

la a0, var2
li a7, 1	
ecall	# print address of var2

la a0, new_line
li a7, 4	
ecall	# print "\n"


# Add and Multiply
la a0, var1_txt2_add
li a7, 4	
ecall	# print "var1: "

lw a0, var1	# load var1 to a0
addi a0, a0, 1	# Add var1 by 1
la a1, var1
sw a0, 0(a1)
li a7, 1
ecall

la a0, new_line
li a7, 4	
ecall	# print "\n"

la a0, var2_txt2_add
li a7, 4	
ecall	# print "var2: "

lw a0, var2	# load var2 to a0
li t0, 4
mul a0, a0, t0	# multiply var2 by 4
la a1, var2
sw a0, 0(a1)
li a7, 1
ecall

la a0, new_line
li a7, 4	
ecall	# print "\n"

# swap var1 and var2
la t0, var1	# load address of var1
la t1, var2	# load address of var2
lw a0, var1	# load var1 to a0
lw a1, var2	# load var2 to a1
sw a0, 0(t1)	# store a0 to var2
sw a1, 0(t0)	# store a1 to var1

la a0, var1_txt3_add	
li a7, 4	
ecall	# print "Swap var1: "

lw a0, var1
li a7, 1
ecall

la a0, new_line
li a7, 4	
ecall	# print "\n"

la a0, var1_txt3_add	
li a7, 4	
ecall	# print "Swap var2: "

lw a0, var2
li a7, 1
ecall








