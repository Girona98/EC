.text
main:

jal getc 				#Leer caracter de teclado
beq $v0, '\n',fin
move $s0, $v0 				#Muevo el valor leido a un registro auxiliar

subi $v0, $v0, 32 			#Resto 32 para obtener la mayuscula en ASCI

move $a0, $v0 				#Paso el caracter en mayuscula a $a0 para imprimir por pantalla

jal putc 				#Imprimo el caracter en consola

j main


getc:
lui $t0, 0xffff 			# Direccecion del registro de control del teclado
li $t1, 0 				#Registro donde se almacena el contador de iteraciones
	
	otra:

lw $t2, ($t0) 				#Lee el registro control del teclado
andi $t2, $t2, 1 			#Extrae bit
addiu $t1, $t1, 1 			#Aumento el contador

beqz $t2, otra 				#Si el bit == 0 entonces no hay carácter, por lo espera
	
lw $v0, 4($t0) 				#Lee registro de datos del teclado

jr $ra

putc:
lui $t0,0xffff

	repite:
	
lw $t1,8($t0) #Cargo la informacion

andi $t1,$t1,0x0001 #Se sincroniza
beq $t1,$0,repite #Si ready == 0 repite

sw $a0,12($t0) #Sino, iemprime en la consola el contenido de $a0
jr $ra 
	
fin:
li $v0,10
syscall
