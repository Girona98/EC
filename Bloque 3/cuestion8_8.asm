#ejercicio 8 practica 8
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
long: .word 10
suma :.word 0

.text
    la $a0, array 
    la $a1, long
    lw $a2, 0($a1) 
    jal sum

    sum:    
    	beq $t0, $a2, acabar 
        beq $t0, $a2, avg
        lw $t1, 0($a0) 			# cargamos el valor del array en t1
        add $t2, $t2, $t1		# sumamos los valores, y los almacenamos en t2
        add $t0, $t0, 1			# aumentamos el contador en 1 
        add $a0, $a0, 4			# aumentamos a0 en 4 para movernos por el vector
        sw $t2, suma 
        jal sum 

    avg:    
    	mtc1 $t2, $f0 			# el valor de t2 se encuentra en f0
        cvt.s.w $f0,$f0 
        mtc1 $a2, $f1 			# el valor de a2 se encuentra en f1
        cvt.s.w $f1,$f1 		
        div.s $f0, $f0, $f1 
        mov.s $f12,$f0 
        li $v0, 2 
        syscall

        li $v0,10 #Fin del programa
        syscall

    acabar:    
    	jal avg #Salta a la funcion media
