
li $a0, '>'	# imprimimos el caracter >
li $v0, 11
syscall

li $v0, 5	# leemos un entero
syscall

jal quadruple


move $a0,$s0	# Movemos el numero que hemos calculado en la funcion en $a0
li $v0,1	# para que pueda ser impreso por pantalla
syscall


li $v0,10	# terminamos el programa
syscall

quadruple:
	move $s0, $v0	# movemos el entero leido a la variable $s0
	rol $s0,$s0,2	# desplazamos 2 posiciones ya que 2^2 es 4
	jr $ra
