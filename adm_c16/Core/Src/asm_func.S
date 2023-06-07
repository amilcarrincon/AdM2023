.syntax unified
.thumb
.text

@ Simbolos exportados
.global asm_svc
.global asm_sum
.global asm_zeros
.global asm_productoEscalar32
.global asm_productoEscalar16
.global asm_productoEscalar12
.global asm_filtroVentana10
.global asm_pack32to16
.global asm_max
.global asm_downsampleM
.global asm_invertir
.global asm_corr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   void asm_svc (void)
@
.thumb_func
    asm_svc:
        svc 0
        bx lr


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@ Prototipo en "C":
@   uint32_t asmSum (uint32_t firstOperand, uint32_t secondOperand)
@
@ Parametros recibidos:
@   r0: firstOperand
@   r1: secondOperand
@
@ Valor de retorno:
@   r0: resultado de la suma de firstOperand y secondOperand
@
.thumb_func
    asm_sum:
        add r0, r1  @ r0 = r0 + r1
        bx lr       @ vuelve adonde fue llamada (especificamente, si "pc"
                    @ es la direccion, en el codigo del programa, de la
                    @ instruccion "bl asm_sum" usada para saltar a
                    @ esta funcion, entonces "lr" contiene ese "pc" + 4).
                    @ el valor de retorno debe quedar en el registro r0.
                    @ En este caso, r0 es el resultado de r0 + r1.

        @ Otras alternativas para el retorno
        @ mov pc,lr
        @ bx lr
        @ push {lr} ... pop {pc}

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Prototipo en "C":
@    void zeros (uint32_t *vector, uint32_t longitud)
@ Parametros recibidos:
@   r0:
@   r1:
@
@ Valor de retorno:
@   r0:

 .thumb_func
  	asm_zeros:
      push {lr}  /* guardamos la direccion de retorno en la pila */
      sub	r1,1
      ldr	r2,=0
  	Lazo:
      str	r2,[r0,r1,LSL 2]
      subs r1,#1
      bpl	Lazo
	  //add op1, op2 /* r0 = r0 + r1 */
	  pop {pc}   /* retorno */

@ VecIn r0
@ len   r1
@ valor r2

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@Prototipo en "C":
@void productoEscalar32 (uint32_t *vectorIn, uint32_t *vectorOut uint32_t longitud, uint32_t escalar);


  .thumb_func
	asm_productoEscalar32:
		push {lr}  /* guardamos la direccion de retorno en la pila */
    	sub	r2,1
	Lazo:
		ldr	r4,[r0,r2,LSL 2]
		mul r4,r3
    	str	r4,[r1,r2,LSL 2]
    	subs r2,1
    	bpl	Lazo
		//add op1, op2 /* r0 = r0 + r1 */
		pop {pc}   /* retorno */

@ VecIn  r0
@ VecOut r1
@ len    r2
@ esca   r3
@ resul  r4
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_productoEscalar16:
		push {r4,lr}  /* guardamos la direccion de retorno en la pila */
    	sub	r2,1
	Lazo:
		ldrh r4,[r0,r2,LSL 1]
		mul  r4,r3
    	strh r4,[r1,r2,LSL 1]
    	subs r2,1
    	bpl	Lazo
		//add op1, op2 /* r0 = r0 + r1 */
		pop {r4, pc}   /* retorno */

@ VecIn  r0
@ VecOut r1
@ len    r2
@ esca   r3
@ resul  r4
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_productoEscalar12:
		push {r4,lr}  /* guardamos la direccion de retorno en la pila */
    	sub	r2,1
	Lazo:
		ldrh r4,[r0,r2,LSL 1]
		mul  r4,r3
		usat r4,12,r4
    	strh r4,[r1,r2,LSL 1]
    	subs r2,1
    	bpl	Lazo
		//add op1, op2 /* r0 = r0 + r1 */
		pop {r4, pc}   /* retorno */

@ VecIn  r0
@ VecOut r1
@ len    r2
@ esca   r3
@ resul  r4
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_filtroventana10:
		push 	{r4-r8, lr}  /* guardamos la direccion de retorno en la pila */
		mov		r8, #10
		add 	r4, r2, r8
		add		r3, r0, r2, LSL 1
		sub		r3, #20
		mov		r5, r2
		sub		r5, r8
	loop:
		mov 	r4, r8
		mov		r7, #0
	loopVentana:
		subs 	r4, #1
		ldrh 	r6,[r3, r4, LSL 1] // vector = *(vector + (incice << 2))
		add		r7, r7, r6
		usat 	r6,16,r6
		bne 	loopVentana
		udiv	r7, r7, r8
		strh	r7, [r1, r5, LSL 1]
		sub		r3, #2
		subs	r5, #1
		bpl		loop
		pop 	{r4-r8, pc}   /* retorno */

@ vectorIn 		r0
@ vectorOut 	r1
@ longitudIn	r2
@ baseVent		r3
@ indiceV		r4
@ indiceI		r5
@ auxiliar		r6
@ acumulador	r7
@ Ventana		r8


@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

@ VecIn 	r0
@ VecOut 	r1
@ len		r2
@ resul	    r3

.thumb_func
	asm_pack32to16:
 		push 	{lr}  /* guardamos la direccion de retorno en la pila */
		sub		r2, 1
	Lazo:
		ldr		r3,[r0,r2,LSL 2]
		asr		r3,16
    	strh	r3,[r1,r2,LSL 1]
		subs	r2, #1
		bpl		Lazo
		pop 	{pc}   /* retorno */

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_max:
	 	push 	{r4,lr}  /* guardamos la direccion de retorno en la pila */
		sub		r1, 1
 		ldr		r3,[r0,r1,LSL 2]
	Lazo:
		ldr		r2,[r0,r1,LSL 2]
		cmp		r2,r3
		bge		Maximo
	Resta:
		subs	r1, #1
		bpl		Lazo
		mov		r0,r3
		pop 	{r4,pc}   /* retorno */
		//str		resul,[VecOu,len,LSL 2]
	Maximo:
		ldr		r3,[r0,r1,LSL 2]
		ldr		r4,[r0,r1,LSL 2]
		b		Resta

@ VecIn 	r0
@ len		r1
@ resul		r2
@ maxi		r3
@ VecOu		r4

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_downsampleM:
 		push 	{r4,lr}  /* guardamos la direccion de retorno en la pila */
		sub		r1, 1
 		ldr		r3,[r0,r1,LSL 2]
	Lazo:
		ldr		r2,[r0,r1,LSL 2]
		cmp		r2,r3
		bge		Maximo
	Resta:
		subs	r1, #1
		bpl		Lazo
		mov		r0,r3
		pop 	{r4,pc}   /* retorno */
		//str		resul,[VecOu,len,LSL 2]
	Maximo:
		ldr		r3,[r0,r1,LSL 2]
		ldr		r4,[r0,r1,LSL 2]
		b		Resta

@ VecIn 	r0
@ len		r1
@ resul		r2
@ maxi		r3
@ VecOu		r4

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_invertir:
 		push 	{r4,lr}  /* guardamos la direccion de retorno en la pila */
		sub		r1, 1
		mov		r4,#0
	Lazo1:
		ldrh	r2,[r0,r1,LSL 1]
 		ldrh	r3,[r0,r4,LSL 1]
 		strh	r2,[r0,r4,LSL 1]
 		strh	r3,[r0,r1,LSL 1]
 		add		r4,#1
		sub		r1, #1
		cmp		r1,r4
		bge		Lazo1
		pop 	{r4,pc}   /* retorno */

@ VecIn 	r0
@ len		r1
@ resul		r2
@ resul2	r3
@ j			r4

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

.thumb_func
	asm_corr:
		push 	{r4-r7,lr}  /* guardamos la direccion de retorno en la pila */
 		mov		r6,#0
 		mov		r4,r2
 		sub		r4,#1
	loopCopy:		//Para que arranque en el (echo - 1)
		ldrb	r3, [r0, r4]
		add		r6,r3
		subs 	r4, #1
		bpl 	loopCopy
		udiv	r6,r2
		mov		r4,#10
		sub		r4,#1
		mov		r5,#0
	Lazo:
		ldrb	r5, [r0, r4]
		sub		r5,r6
		strb	r5, [r1, i]
		subs 	r4, #1
		bpl 	Lazo
		pop 	{r4-r7,pc}   /* retorno */

@ VecIn 	r0
@ VecOu		r1
@ len		r2
@ resul		r3
@ i			r4
@ aux		r5
@ aux2		r6
@ Zero		r7
