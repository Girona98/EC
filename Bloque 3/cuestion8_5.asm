#cuestion 5 practica 8
.data 
mmask: .word 0x007FFFFF 
emask: .word 0x7F800000 
exp1: .word 255 
error: .asciiz "Error, desbordamiento detectado"
.text 
addi $s0, $0, 1 
sll $s0, $s0, 30 	# $s0 = 2^30 
mtc1 $s0, $f0 
cvt.s.w $f0, $f0 	# $f0 = 2^30 
mul.s $f0, $f0, $f0 	# $f0 = 2^60 
mul.s $f0, $f0, $f0 	# $f0 = 2^120 
mul.s $f0, $f0, $f0 	# $f0 = 2^240 -> overflow 
#Valor a comprobar en $f0 
mfc1 $s0,$f0 
lw $t4,mmask 		# cargar mascara de la mantisas 
and $t0,$s0,$t4 	# extraer mantisa de $s0 
lw $t4,emask 		# cargar mascara del exponente
and $t2,$s0,$t4 	# extraer exponente de $s0 
srl $t2,$t2,23 		# desplazar exponente 
lw $t3,exp1 		#cargamos valor exponente todo a unos 
beq $t2,$t3,exp_a_1 	#exponente todo a unos?

exp_a_1:
	la $a0,error	# cargamos el .asciiz e imprimimos
	li $v0,4
	syscall
	j fin
fin:
	li $v0,10
	syscall
