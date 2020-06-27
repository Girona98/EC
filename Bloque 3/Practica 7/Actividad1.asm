##################################
# 				 #
# Codi exemple de l�activitat 1  #
# Comptar car�cters d'una cadena #
# 				 #
##################################
.data 				#Definim segment de dades
str: .ascii "Estructures de"
     .asciiz "Computadors"
res: .asciiz "El nombre de car�cters de la cadena �s: "
.text 				#Comen�a el programa
la $s0, str
add $s1, $zero, $zero 		#Iniciem comptador a 0
loop:
	add $t0, $s0, $s1 	#adre�a byte a examinar
	lb $t1, 0( $t0 )
	beq $t1, $zero, exit 	# eixim si car�cter
				# llegit='\0'
	addi $s1, $s1, 1	# increment comptador
	j loop
exit: 
	la $a0 res		# almacenamos la frase .asciiz en $a0
	li $v0,4		# mostramos la frase
	syscall
	move $a0, $s1		# movemos el valor del contador a $a0
	li $v0,1		# mosramos el valor del contador 
	syscall
	li $v0, 10		#terminamos el programa
	syscall