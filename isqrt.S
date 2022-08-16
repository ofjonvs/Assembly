;;; Jonas da Silva
;;; 119289334
;;; jdasilva

;;; computes square root

    .global isqrt                 ; exposes fib as a label for the linker
isqrt:                            ; the label: the next instruction starts fib() function.
    ;; Add your code here.
    push r18                        ; push callee saved register to stack
    mov r18, r24                    ; save passed in parameter
    cpi r24, 2                      
    brlo 2f                         ; if parameter is less than 2 branch to epilogue
    lsr r24
    lsr r24                         ; shift right twice
    call isqrt                      ; recursive call
    lsl r24                         ; shifts left once
    mov r16, r24                    ; saves small value
    subi r24,lo8(-(1)) 
    mov r22, r24                    ; saves large value
    mul r24, r24                    ; multiplies large value by itself
    mov r26, r0                     ; saves value
    cp r26, r18                     ; if large * large is greater than or equal
    brsh 3f                         ; to original parameter branch to 3
    jmp 5f                          ; else jump to 5f

2:
    pop r18                         ; pop r18
    ret                             ; return
3:
    cp r26, r18                     
    breq 5f                         ; if r26 and r18 are equal branch to 5
4:
    mov r24, r16                    ; sets return value to small value
    jmp 2b
5:
    mov r24, r22                    ; sets return value to large value
    jmp 2b