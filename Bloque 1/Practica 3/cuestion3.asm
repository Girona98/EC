##################################
# #
# Codi de l�activitat 4 #
# Programa ECHO #
# #
##################################
li $v0,12 	# Funci� 12. Read character
syscall 	# Car�cter llegit en $v0

move $t0,$v0 	# guardamos el caracter en la variable t0
li $a0,'\n'	# guardamos en a0 el caracter de salto de linea
li $v0,11	# imprimimos el salto de linea
syscall
move $a0,$t0	# guardamos en a0 el caracter que queremos imprimir, almacenado en t0


li $v0,11 	# Funci� 11. Print character
syscall
li $v0, 10	#Funci� 10. Acaba programa
syscall
