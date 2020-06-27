
li $a0, '>'	# imprimimos el caracter >
li $v0, 11
syscall

li $v0, 5	# leemos un entero
syscall

move $a0, $v0	# Movemos el numero que introducimos a a0 para pasarlo por parametro
jal quadruple


li $v0,1	# para que pueda ser impreso por pantalla
syscall


li $v0,10	# terminamos el programa
syscall

quadruple:
	rol $a0,$a0,2	# desplazamos 2 posiciones ya que 2^2 es 4
	jr $ra
