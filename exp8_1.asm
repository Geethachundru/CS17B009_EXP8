.data

	a: .word 1, 2, 1, 1, 2	#array
	n: .word 5			
	c: .word 0			
	x: .word 2			
.text
main:
	la $a0,a
	lw $a1,n
	lw $a2,x
	lw $t1,c
	add $t2,$t2,$1
	add $t3,$t3,$4
	add $t4,$t4,$0
	add $v0,$0,$0
	jal solve
	sw $v0,c
	lw $v1,c
	addi $s7,$v1,0
	li $v0,10
	syscall
solve:	
	sub $sp,$sp,12
	sw $ra,0($sp)
	sw $t6,4($sp)
	sw $t7,8($sp)
	beq $a1,$0,Exit
	lw $t5,0($a0)
	addi $t6,$t5,0
	add $a0,$a0,$4
	sub $a1,$a1,1
	jal solve
	beq $t6,$a2,Exit1
Exit:
	lw $ra,0($sp)
	lw $t6,4($sp)
	lw $t7,8($sp)
	addi $sp,$sp,12
	j $ra
Exit1:
	addi $t7,$0,1
	addi $v0,$v0,1
j Exit
