##################################### 
# 				    # 
#C�digo de partida de la cuesti�n 6 # 
# 			            # 
#################################### 

.data 
Xpide: .asciiz "X = " 
Ypide: .asciiz "Y = " 
MaxRes: .asciiz "El mayor es " 

.text 
la $a0, Xpide 
li $v0,4 
syscall 
li $v0,6 
syscall 
mov.s $f12,$f0 

la $a0, Ypide 
li $v0,4 
syscall 
li $v0,6 
syscall 
mov.s $f14,$f0 

jal max 

la $a0,MaxRes 
li $v0,4 
syscall 
mov.s $f12,$f0 
li $v0,2 
syscall 

li $v0,10 
syscall 

max: 
	c.lt.s $f12, $f14
	bc1t y
	mov.s $f0, $f12
	jr $ra
y: 
	mov.s $f0, $f14
	jr $ra