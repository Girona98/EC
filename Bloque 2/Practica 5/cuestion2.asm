#actividad 2
li $a0,'>'
li $v0,11
syscall
li $v0,5		# leemos A
syscall
move $a1,$v0

li $a0,'>'
li $v0,11
syscall
li $v0,5		# leemos B
syscall
move $a2,$v0

blt $a1, $a2,eti	# comprobamos si t1 es menor que t2
move $a0,$a1		# (A)movemos a1 a a0 para imprimirlo
li $v0,1
syscall
j fin

eti:
	move $a0,$a2	# (B) movemos B a a0 para imprimirlo
	li $v0,1
	syscall
	j fin
fin:
	li $v0,10
	syscall



