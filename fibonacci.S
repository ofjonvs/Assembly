;;; Jonas da Silva
;;; 119289334
;;; jdasilva
;;; Implementation that computes the nth fibonacci number.

    .global fib                 ; exposes fib as a label for the linker
fib:                            ; the label: the next instruction starts fib() function.
	
    ;; Add your code here.
  	push r16					;save r16 to stack
	push r17					;save r17 to stack
	push r20					;save r20 to stack
	push r21					;save r21 to stack
	mov r20, r24				;store parameter temporarily
	mov r21, r25
	cpi r24, 0				
	breq 1f						;branch to 1 if parameter is 0
	cpi r24,1					
	breq 1f						;branch to 1 if parameter is 1
	sbiw r24,1
	call fib					;decrement parameter and call fib recursively
	mov r16,r24					;store returned value into r17:16
    mov r17, r25
	mov r24, r20				;restore original parameter
	mov r25, r21
	sbiw r24,2					
	call fib					;decrement parameter by 2 and call fib recursively
	add r24,r16					;adds fib decremented once and fib decremented twice
	adc r25,r17					; to r25:24
1:
	pop r21
	pop r20
	pop r17	
	pop r16						;pops r21:20 and r17:16 from stack
	ret							;returns
