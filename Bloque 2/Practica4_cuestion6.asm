##################################
# #
# Codi de l�activitat 3 #
# Multiplicaci� per 4 #
# #
##################################
# Codi de partida de l�activitat 3
#
# Multiplicaci� per 4
#
.text
li $a0, '>' 		#Comen�a demanant un enter
li $v0,11
syscall
li $v0,5
syscall 		#Llig un enter
move $a0, $v0 		#par�metre a passar en $a0
jal mult10 		#cridem la funci� mult4
move $a0, $v0 		#par�metre a passar en $a0
jal imprim 		#cridem la funci� imprim
li $v0,10 		#Acaba el programa
syscall
#########################
# #
# Funcions #
# #
######################
imprim: 
	addi $v0,$0,1 		#funci� imprim
	syscall 		#Escriu el valor en $a0
	li $a0, '\n' 		#Salt de l�nia
	li $v0,11
	syscall
	jr $ra 			#Torna al programa principal
mult10: 
	sll $v0, $a0, 3 	#Funci� multiplica per 4
	add $v0,$v0,$a0		# para realizar la multiplicacion por 5 multiplicamos primero por 4
	add $v0,$v0,$a0		# y despues sumamos una vez el numero al resultado de la multiplicacion
	jr $ra
