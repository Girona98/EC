.kdata
contexto: .word 0,0,0,0 		

.ktext 0x80000180 			# direccion donde comienza la rutina

# guardo registros para utilizar en la rutina
la $k1, contexto
sw $at, 0($k1) 				# guardo en at el valor de la posicion 0 + k1
sw $t0, 4($k1)				# guardo en $t0 el valor de la posicion 4 + $k1
sw $v0, 8($k1)				# guardo en $vo el valor de la posicion 8 + $k1
sw $a0, 12($k1)				# guardo en $a0 el valor de la posicion 12 + $k1

# compruebo si se trata de una interrupción
mfc0 $k0, $13 				# movemos al coprocesador0 para el registro cause
srl $a0, $k0, 2 			# extraemos el campo del código
andi $a0, $a0, 0x1f			
bne $a0, $zero, acabamos 		# si a0 vale 0 saltamos a acabamos

# tratamiento de la interrupcion de excepcion
li $t0, 0xffff0000
lb $a0, 4($t0) 				# lee carácter del teclado

li $v0, 11 				# escribe en la consola el carácter leído
syscall

# Antes de acabar se deja todo iniciado
acabamos:
	mtc0 $0, $13 			# iniciamos registro Cause
	mfc0 $k0, $12 			# leemos registro Status
	andi $k0, 0xfffd 		# iniciamos el bit de excepción
	ori $k0, 0x11 			# habilitamos las interrupciones
	mtc0 $k0, $12 			# reescribimos registro Startus


# Restaurar registros
lw $at, 0($k1) 				# devuelvo a at el valor de 0+k1
lw $t0, 4($k1)				# devuelvo a t0 el valor de 4+k1
lw $v0, 8($k1)				# devielvo a v0 el valor de 8+k1
lw $a0, 12($k1)				# devuelvo a a0 el valor de 12+k1
# Devolver en el programa de usuario
eret
