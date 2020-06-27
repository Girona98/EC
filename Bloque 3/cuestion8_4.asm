#cuestion 4 practica 8
li $t0,1
mtc1 $t0,$f1		# movemos al coprocesador el 1
cvt.s.w $f1,$f1		# lo convertimos a simple precision

li $t1,-2
mtc1 $t1,$f2		# movemos al coprocesador el -2
cvt.s.w $f2,$f2		# lo convertimos a simple precision

