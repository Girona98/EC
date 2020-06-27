##################################
# #
# Codi de l’activitat 1 #
# Càlcul del valor absolut #
# d'un enter #
# #
##################################

.text
li $a0, '>' 		# Es demana introduir un enter
li $v0,11
syscall
li $v0,5
syscall 		# Llig l’enter A
bltz $v0, else 		# Si (A >= 0) salta a else
move $a0, $v0 	# En $a0 el valor A
j exit 			# Acaba part if-then
else: 
	sub $a0, $zero, $v0 	# En $a0 el negatiu de A

exit: 
	li $v0, 1 	# Imprimim el valor en $a0
	syscall
	li $v0, 10 	# Acaba el programa
	syscall
