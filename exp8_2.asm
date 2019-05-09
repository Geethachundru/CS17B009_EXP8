.data

	a: .word 1, 0, 1, 1, 0	#array
	n: .word 5		#size
		
.text

main:
	la $a0,a
	la $a2,a
	lw $a1,n
	add $t2,$0,$1
	add $t3,$0,$0
	add $s3,$s3,$4
	add $s4,$0,$0
	add $s7,$0,$0
	add $v0,$0,$0
	jal solve
	add $t1,$v1,$0
	add $t2,$v0,$0
	add $t6,$v1,$0
	add $t7,$v0,$0
	jal loop1
	li $v0,10
	syscall	
solve:	
	sub $sp,$sp,8
	sw $ra,0($sp)
	sw $s6,4($sp)
	beq $a1,$0,Exit
	lw $s5,0($a0)
	add $s6,$s5,$0
	add $a0,$a0,$4
	sub $a1,$a1,1
	jal solve
	beq $s6,$t2,Exit1
	beq $s6,$t3,Exit2
Exit:
	lw $ra,0($sp)
	lw $s6,4($sp)
	add $sp,$sp,$8
	j $ra
Exit1:
	add $v0,$v0,$1
	j Exit
Exit2:
	add $v1,$v1,$1
	j Exit
loop1:
	slt $t3,$0,$t1
	beq $t3,$0,loop2
	add $t4,$0,$0
	sw $t4,0($a2)
	add $a2,$a2,$4
	sub $t1,$t1,1
	j loop1
loop2: 
	slt $t3,$0,$t2
	beq $t3,$0,loop3
	add $t4,$0,$1
	sw $t4,0($a2)
	add $a2,$a2,$4
	sub $t2,$t2,1
	j loop2
loop3:
j $ra
