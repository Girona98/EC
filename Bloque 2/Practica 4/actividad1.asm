##################################
# #
# Codi de l�activitat 1 #
# Prova de cridada a una funci� #
# #
##################################
.text
li $a0, '>' 		# Comen�a programa principal
li $v0,11
syscall
li $v0,5
syscall 		# Llig un enter del teclat
addi $t1,$v0,10
move $a0, $t1 		# argument a passar a la
# funci� en $a0
jal imprim 		# crida a la funci� imprim
add $t1, $t1,$t1
move $a0, $t1 		# argument a passar en $a0
jal imprim		# crida a la funci� imprim
li $v0,10 		#Acaba el programa
syscall

###########################
# Funcions #
###########################
imprim: 
	addi $v0,$0,1 	# comen�a la funci�
	syscall 	# Escriu un valor
	li $a0, '\n' 	# salt de l�nia
	li $v0,11
	syscall
	jr $ra 		#Torna al programa principal