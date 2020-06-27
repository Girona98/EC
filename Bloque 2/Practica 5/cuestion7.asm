####################################
# #
# Código ejemplo #
# Bucle FOR-WHILE #
# #
####################################
li $s0, 1 			#Iniciamos contador
li $s1, 11 			#Condición de finalización
li $s2,0 			#Contador
inicio_dowhile: 
	#operaciones dentro del bucle
	add $s2, $s2, $s0 	#cuerpo del bucle
	addi $s0, $s0, 1 	#incremento del contador
	#condiciones de finalizacion
	sle $t1, $s0, $s1	# nos indica si s0 es menor o igual que s1, si no lo es, pone t1 a 0
	beqz $t1, final_dowhile # si t1 es igual a 0, el bucle finaliza
	j inicio_dowhile


final_dowhile:
	li $v0,10
	syscall
 