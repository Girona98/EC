####################################
#                                  #
#Código de partida de la cuestión 2#
#         getc y putc              #
# 				   #
####################################
.text
main:
	li $t6, '\n'
	move $a0, $v0				# lo llevamos a a0 para imprimirlo
	jal getc	
	move $s0,$v0				# almacenamos el valor en s0
	subi $v0, $v0, 32			# restamos 32 al valor introducido

	jal putc
	beq $s0 ,$t6, fin			# si el valor introducido es un salto de linea finaliza el programa
	j main

getc:
	lui $t0, 0xffff
	li $t1, 0				# contador de bucle
	bucle:
		lw $t2, 0($t0)			# cargamos en t2 el dato introducido
		andi $t2, $t2, 1		# con esto extraemos el bit de ready
		addiu $t1, $t1, 1		# aumentamos el contador en 1
		beqz $t2, bucle			# si t2 es igual a 0, volvemos al bucle
		lw $v0, 4($t0)			# cargamos en v0 el dato introducido
		jr $ra

putc:
	lui $t0, 0xffff
	bucleput:
		lw $t1, 8($t0)			# cargamos en t1 el valor que hay en t0+8
		andi $t1, $t1, 0x0001		# ponemos el bit ready a 1
		beq $t1, $zero, bucleput	# si t1 es 0, volvemos a bucle2
		sw $a0, 12($t0)			# almacenamos el valor de $a0 en la direccion 12+$t0
		jr $ra

fin:
	li $v0,10
	syscall
