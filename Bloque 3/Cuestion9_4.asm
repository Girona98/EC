##################################### 
# 				    # 
#Código de partida de la cuestión 4 # 
# 				    # 
##################################### 
.data 
Array: .float 1, 2, 30, 4, 5, 6, 7, 8, 9, 10 
long: .word 10 
Suma: .float 0
texto: .asciiz "La media es: "

.text
la $a0, Array
la $a1, long
la $a3, texto
lw $t1, 0($a1)

bucle:
	beq $t1, $a2, final	
	lwc1 $f1,0($a0)		# guardamos el contenido de la posicion por la que vamos
	add.s $f2,$f2,$f1	# vamos sumando los valores del array
	add $a0,$a0,4		# nos desplazamos por el vectior
	add $a2,$a2, 1		# contador para el bucle
	jal bucle
final:
	mtc1 $t1,$f3		#movemos del procesador al coprocesador
	cvt.s.w $f3,$f3		#convertimos a flotante
	div.s $f12,$f2,$f3	#dividimos la suma entre la longitud y lo almacenamos en f12
	move $a0, $a3		# movemos a3 a a0 para imprimir
	li $v0,4
	syscall
	li $v0,2
	syscall
	li $v0,10
	syscall
	