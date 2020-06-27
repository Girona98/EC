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
str: .asciiz "\n Introduce numero: "
.text 				#Comença el programa
la $s0, A 			# Adreça base del vector A
la $s1, B 			# Adreça base del vector B
li $s5, 5 			# Grandària del vector

#rellenamos el vector B con enteros leido por teclado
li $s7,0			# contador
#li $s6,0			# desplazamiento de memoria

# primer numero
la $a0, str
li $v0,4
syscall
li $v0,5
syscall
sw $v0,0($s1)
#segundo numero
la $a0, str
li $v0,4
syscall
li $v0,5
syscall
sw $v0,4($s1)
# tercer numero
la $a0, str
li $v0,4
syscall
li $v0,5
syscall
sw $v0,8($s1)
#cuarto numero
la $a0, str
li $v0,4
syscall
li $v0,5
syscall
sw $v0,12($s1)
#quinot numero
la $a0, str
li $v0,4
syscall
li $v0,5
syscall
sw $v0,16($s1)
j loop

loop:
	add $t1, $s0, $t0
	add $t2, $s1, $t0
	addi $s2, $s2, 1 	# Índex del vector
	lw $t3, 0($t1)
	sw $t3, 0($t2)
	sll $t0, $s2, 2 	# Índex del vector x4
	bne $s2, $s5, loop

li $v0, 10 			#Acaba el programa
syscall