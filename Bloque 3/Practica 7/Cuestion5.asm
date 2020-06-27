####################################
# 				   #
# C�digo ejemplo de la actividad 2 #
# Recorrer un vector de enteros    #
# 				   #
####################################
.data
A: .word 2, 4, 6, 8, 10 	# vector A iniciado con valores
B: .word 0:4 			# Vector B vac�o
C: .space 50 			# Otra definici�n de vector vacio
.text
la $s0, A 			# Direcci�n base del vector A
la $s1, B 			# Direcci�n base del vector B
la $s3, C
li $s5, 5 			# Tama�o del vector
loop:
	add $t1, $s0, $t0
	add $t2, $s1, $t0
	addi $s2, $s2, 1 		# �ndice del vector
	lw $t3, 0($t1)
	sw $t3, 0($t2)
	sll $t0, $s2, 2 		# �ndice del vector x4
	bne $s2, $s5, loop

li $t0,0
li $t3,0
suma: 
	add $t1, $s0, $t0
	add $t2, $s1, $t0
	add $t3, $s3, $t0
	addi $s4, $s4, 1
	lw $t4, 0($t1)			# guardamos el valor del vector A
	lw $t5, 0($t2)			# guardamos el valor del vector B
	add $t6, $t4, $t5		# sumamos los vectores
	sw $t6, 4($t3)			# almacenamos el contenido de la suma en la posicion dada
	sll $t0 , $s4, 2	
	bne $s4, $s5, suma
	
li $v0, 10 			# Acaba el programa
syscall