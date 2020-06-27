############################################
# #
# Código de partida de la cuestión 7 #
# #
############################################
.data
vector: .word -4, 5, 8, -1
msg1: .asciiz "\n La suma de los valores positivos és = "
msg2: .asciiz "\n La suma de los valores negativos és = "
.text
Principal:
	li $s2, 0 	# contador del bucle
	li $s4, 0	# contador de suma negativos
	li $s5, 0	# contador de suma positivos
	
	li $v0, 4 	# Función para imprimir string
	la $a0, msg1 	# Leer la dirección de msg1
	syscall
	la $a0, vector  # dirección del vector como parámetro
	li $a1, 4 	# Longitud del vector como parámetro
	jal sum		# Llamada a la función sum
	
	move $a0, $v0 	# Resultado 1 de la función
	li $v0, 1
	syscall 	# Imprimir suma positivos
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 1
	move $a0, $v1 	# Resultado 2 de la función
	syscall 	# imprimir suma negativos
	li $v0, 10 	# Acabar programa
	syscall
####################################
# 	    Funciones 		   #
####################################

sum: #Código a implementar
	slt $s1, $s2, $a1	# comparamos si el contador ha llegado al limite del vector
	beq $s1, 0, volver	# si es igual a 0, vamos a volver y nos lleva al programa principal

	lw $s3, 0($a0)		# guardamos el datos del vector en s3
	bltz $s3, sumanega
	bgtz $s3, sumaposi
	cont:
		addi $s2, $s2, 1
		addi $a0, $a0, 4
		j sum
	
sumanega:
	add $s4, $s4, $s3	# sumamos los numeros negativos
	j cont
sumaposi:
	add $s5, $s5, $s3	# sumamos los numeros positivos
	j cont
volver:
	move $v1, $s4		# movemos los valores negativos
	move $v0, $s5		# movemos los valores positivos
	jr $ra
	
	
