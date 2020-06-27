
li $v0,5
syscall
add $t2,$zero,$v0
li $v0,5
syscall
add $t3,$zero,$v0
sub $t1,$t2,$t3
add $a0,$zero,$t1
li $v0,1
syscall


li $v0,5
syscall
add $t2,$zero,$v0
li $v0,5
syscall
add $t3,$zero,$v0
subu $t1,$t2,$t3
add $a0,$zero,$t1
li $v0,1
syscall