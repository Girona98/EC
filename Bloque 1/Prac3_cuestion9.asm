
eti1:
	li $v0,12	# LEEMOS CARACTER
	syscall
	
	addi $v0,$v0,32	# AL CARACTER LEIDO LE SUMAMOS 32
	move $a0, $v0	# GUARDAMOS EL CARACTER EN A0
	
eti2:
	li $v0,11	# IMPRIMIMOS CARACTER
	syscall
	j eti1
