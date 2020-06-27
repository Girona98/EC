##################################
# #
# Codi de l’activitat 3 #
# Multiplicació per 4 #
# #
##################################
# Codi de partida de l’activitat 3
#
# Multiplicació per 4
#
.text
li $a0, '>' 		#Comença demanant un enter
li $v0,11
syscall
li $v0,5
syscall 		#Llig un enter
move $a0, $v0 		#paràmetre a passar en $a0
jal mult4 		#cridem la funció mult4
move $a0, $v0 		#paràmetre a passar en $a0
jal imprim 		#cridem la funció imprim
li $v0,10 		#Acaba el programa
syscall
#########################
# #
# Funcions #
# #
######################
imprim: 
	addi $v0,$0,1 	#funció imprim
	syscall 		#Escriu el valor en $a0
	li $a0, '\n' 		#Salt de línia
	li $v0,11
	syscall
	jr $ra 			#Torna al programa principal
mult4: 
	sll $v0, $a0, 2 	#Funció multiplica per 4
	jr $ra