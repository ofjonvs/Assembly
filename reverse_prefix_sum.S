;;; Jonas da Silva
;;; 119289334
;;; jdasilva


;;; Transform an array by adding the value at an index to the sum of the remainder of the array

.text
    .global reverse_prefix_sum               
reverse_prefix_sum:                           
    ;; Add your code here.
    push r28                    ;push callee saved registers r29:28 to stack
    push r29
    mov r28, r24                ;save pointer parameter to r29:28
    mov r29, r25
    movw r30, r24
	ld r24, Z
    cpi r24, -1                 ;if current value is -1 branch to epilogue
    breq 3f
    mov r24, r28
    mov r25, r29                ;restore original values
    adiw r24, 1                 ; recursively call with advanced pointer
    call reverse_prefix_sum
    mov r18, r24                ;save new value to r19:r18
    mov r19, r25                  
    mov r24, r28                ;restore original value
    mov r25, r29
    mov r30,r24
	ld r24, Z
    clr r25
    add r24, r18                ;add recursive returned value to original value
    adc r25, r19
    mov r20, r24                ;save new value to r21:20
    mov r21, r25
    mov r18, r20
    mov r24, r28                ;restores original value
    mov r25, r29
    mov r30, r24
    st Z, r18                   ;sets pointer to r18 value
    mov r24, r20                ;returns sum
    mov r25, r21
    jmp 4f

3:
    clr r24
    clr r25
4:
    pop r29
    pop r28                     ;pops callee saved registers
    ret                         ; returns.  necessary.





.data 
pctd: 
    .asciz " %d" 

pctd2:
    .asciz "%d"
    .text
    
	.global	print_array
	.type	print_array, @function
print_array:
    mov r26, r24                ; Initializing X pointer register
    mov r27, r25    
    ld r24, X+                  ;loads first array value into r24 and advances pointer
    clr r25                     ;clears r25
    cpi r24, -1                 
    breq 2f                     ;if value is -1 then branch to epilogue
    clr r25
    ldi r22, lo8(pctd2)         ; sets r23:22 to byte addresses to print first value
    ldi r23, hi8(pctd2) 
    call pint                   ;prints value
1:
    ld r24, X+                  ;loads current pointer value into r24 and advances pointer
    clr r25
    cpi r24, -1                 
    breq 2f                     ;if value is -1 then branch to epilogue
    clr r25                     ; clears upper byte register
    ldi r22, lo8(pctd)          ; sets r23:22 to byte address with space in front
    ldi r23, hi8(pctd)          ; to format properly
    call pint                   ;prints value
    jmp 1b                      ;jumps back loop
2:
    ldi r24, 10                 ;loads newline into r24
    clr r25
    call putchar                ;prints newline character
	ret                         ;returns

pint:
    push r27
    push r26
    push r25
    push r24
    push r23
    push r22
    call printf
    pop r22
    pop r23
    pop r24
    pop r25
    pop r26
    pop r27
    ret



    