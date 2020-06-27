##################################
# #
# Codi exemple de l’activitat 2 #
# Recórrer un vector d’enters #
# #
##################################
.data 				#Definim segment de dades
A: .word 2, 4, 6, 8, 10 	#Vector A iniciat amb valors
B: .word 0:4			#Vector B buit
C: .space 50 			#Altra definició vector buit
.text 				#Comença el programa
la $s0, A 			# Adreça base del vector A
la $s1, B 			# Adreça base del vector B
li $s5, 5 			# Grandària del vector
loop:
	add $t1, $s0, $t0
	add $t2, $s1, $t0
	addi $s2, $s2, 1 	# Índex del vector
	lw $t3, 0($t1)
	sw $t3, 0($t2)
	sll $t0, $s2, 2 	# Índex del vector x4
	bne $s2, $s5, loop

li $v0, 10 #Acaba el programa
syscall