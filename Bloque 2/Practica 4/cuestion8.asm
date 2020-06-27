li $a0, '>' 		#Comença demanant un enter
li $v0,11
syscall
li $v0,5
syscall 		#Llig un enter
move $a0, $v0 		#paràmetre a passar en $a0

jal mult60 		#cridem la funció mult60

li $v0,1		# mostramos el resultado
syscall

li $v0, 10
syscall


mult60:
	sll $s0, $a0, 5		# desplazamos 5
	sll $s1, $a0, 4		# desplazamos 4
	sll $s2, $a0, 3		# desplazamos 3
	sll $s3, $a0, 2		# desplazamos 2

	add $s4, $s0, $s1	# sumamos los resultados de los desplazamientos
	add $s5, $s2, $s3	# sumamos los resultados de los desplazamientos
	add $s6, $s4, $s5	# sumamos y obtenemos el total
		
	move $a0, $s6		# movemos el resultado total a a0 para mostrarlo
	jr $ra