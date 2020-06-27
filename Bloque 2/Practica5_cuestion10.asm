#código que lee de teclado dos valores positivos A y B en los que A<B

li $a0,'>'
li $v0, 11
syscall
li $v0, 5	# leemos A
syscall

move $s0, $v0	# guardamos en s1 el numero A

li $a0,'>'
li $v0, 11
syscall
li $v0, 5	# leemos B
syscall

move $s1, $v0	# guardamos en s1 el numero B

bucle:
	move $a0, $s0		# movemos el numero A a a0 para imprimir
	li $v0,1		# imprimos el numero
	syscall
	li $a0,'\n'		# imprimimos un salto de linea
	li $v0,11
	syscall
	beq $s0,$s1, final	# si $s0 es igual a $s1 saltamos a finalizar el programa
	add $s0,$s0,1		# aumentamos el contador
	j bucle
final:
	li $v0, 10
	syscall