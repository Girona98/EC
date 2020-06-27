.data 
espacio:.space 8
texto1: .asciiz "Introduce el primer valor: "
texto2: .asciiz "Introduce el segundo valor: "


.text
la $s0, espacio

#Primer Numero
la $a0, texto1		# mostramos texto1
li $v0,4
syscall
li $a0, '\n'
li $v0,11
syscall

li $v0,5		# leemos entero y lo guardamos en s1
syscall
move $s1, $v0		# guardamos num1 en $s1
sw $s1,0($s0)		# lo almacenamos en la memoria



#Segundo Numero
la $a0, texto2		# mostramos texto2
li $v0,4
syscall
li $a0, '\n'
li $v0,11
syscall

li $v0,5		#leemos entero y lo guardamos en s2
syscall
move $s2,$v0		#lo guardamos en s2
sw $s2, 4($s0)		# lo almacenamos en memoria

# leer memoria e imprimir

li $a0, '\n'
li $v0, 11
syscall

lw $a0, 0($s0)		# sacamos el primer numero y lo imprimimos
li $v0, 1
syscall

li $a0, '\n'
li $v0, 11
syscall

lw $a0, 4($s0)		# sacamos el segundo numero y lo imprimimos
li $v0, 1
syscall

li $v0,10
syscall


                              
