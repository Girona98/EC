####################################
# #
# Codi de l�activitat 2 #
# Llegir valor introdu�t per teclat #
# i imprimir-lo en la consola #
# #
####################################
.text
addi $v0,$0,5 # Funci� 5, read integer
syscall # Valor llegit en $v0
addi $a0,$v0,0 # Movem el valor llegit a $a0
addi $v0,$0,1 # Funci� 1, print integer
syscall # Escriu en consola $a0