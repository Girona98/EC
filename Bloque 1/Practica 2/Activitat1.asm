##################################
# #
# Codi de l’activitat 1 #
# Imprimir en consola #
# #
##################################
.text 0x00400000
addi $a0,$0,25	# Valor a escriure en $a0
addi $v0,$0,1 	# Funció 1, print integer
syscall		# Escriu en consola $a0