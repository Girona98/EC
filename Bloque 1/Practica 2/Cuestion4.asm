##################################
# #
# Codi de l’activitat 4 #
# Aritmètica d’enters #
# #
##################################
.text 0x00400000
addiu $t0, $zero, 25
addiu $t1, $zero, 5
sub $t2,$t0,$t1
addi $v0, $zero, 10 #Eixir del programa
syscall