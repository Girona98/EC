##################################
# #
# Codi de la qüestió 3 #
# Paraula amagada #
# #
##################################
li $t1, 1215261793

rol $t2,$t1,8		# imprimimos H
move $a0, $t2
li $v0, 11
syscall

rol $t3,$t2,8		# imprimimos O
move $a0, $t3
li $v0,11
syscall

rol $t4	, $t3, 8	# imprimimos L
move $a0, $t4
li $v0, 11
syscall

rol $t5, $t4, 8		# imprimimos A
move $a0,$t5
li $v0, 11
syscall



li $v0, 10
syscall