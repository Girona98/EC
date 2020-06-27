####################################
# #
# Codi de l’activitat 3 #
# Llegir valor introduït per teclat #
# imprimir-lo en la consola #
# i acabar el programa #
# #
####################################
.text
addi $v0,$0,5 	# Funció 5, read integer
syscall		# Valor llegit en $v0
addi $a0,$v0,1 	#Movem el valor a escriure a $a0
addi $v0,$0,1 	# Funció 1, print integer
syscall 	# Escriu en consola $a0
addi $v0,$0,10 	# Funció 10, exit
syscall 	#Acaba el programa
