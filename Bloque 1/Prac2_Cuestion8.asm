
addi $v0,$zero,5	#leemos x
syscall
addi $t0,$v0,0		#guardamos el numero leido en $t0

addi $v0,$zero,5	#leemos y
syscall
addi $t1,$v0,0		#movemos y a $t1


add $a0,$t0,$t1		#almacenamos la suma de X e Y en a0
addi $v0,$zero,1	#imprimimos el numero por pantalla
syscall