####################################
# 				   #
#Código de partida de la cuestión 5#
#       print string 	           #
# 				   #
####################################
.data 
 
cadena: .space 32 
 
 .eqv ControlTeclado 0  
 .eqv BufferTeclado 4  
 .eqv ControlDisplay 8  
 .eqv BufferDisplay 12 
 
.text    
       la $a0,cadena  
       jal read_string  
       la $a0,cadena 
       jal print_string       
       li $v0,10  
       syscall 
 
 read_string:
      lui $t0,0xffff #Se hace una seleccion
      li $t1 , 0 #Se inicia un contador de iteraciones
   getc:  
      lw $t2 , ControlTeclado($t0)
      andi $t2, $t2 , 1 #Extrae bit previamente leido por teclado
      addiu $t1 , $t1 , 1 #Se incrementa contador
      beqz $t2 , getc #Si es 0 se vuelve a extraer el siguient byte por teclado
      lbu $t1,0($a0)  #Carga el byte almacenado
      beqz $t1,final #Si el contador es 0 se salta al final
      lw $v0 , BufferTeclado($t0)
      j getc
 
 
 
print_string:  
        la $t0,0xFFFF0000
       sync:  
       lw $t1, ControlDisplay($t0) 
       andi $t1,$t1,1  
       beqz $t1,sync 
 
       lbu $t1,0($a0)  
       beqz $t1,final  
       sw $t1, BufferDisplay($t0) 
       addi $a0 , $a0 , 1 
       j sync 
       
final:  jr $ra 
 
