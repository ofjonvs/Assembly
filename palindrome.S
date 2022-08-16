;;; Jonas da Silva
;;; 119289334
;;; jdasilva

;;; Implementation that determines if a string is a palindrome.
   .data 
pctd: 
    .asciz "%d " 

    .text

    .global is_palindrome 
is_palindrome:                         
    ;; Add your code here.
    push r26                       
    push r27
    push r28
    push r29                ;push callee saved registers onto stack
    mov r16, r24            
    mov r17, r25            ;temporarily stores r25:24
    call strlen
    mov r18, r24            ;sets r18 to length of string parameter
    mov r20, r24            ;sets r20 to length of string parameter
    mov r24, r16            ;restores original r25:24
    mov r25, r17
    mov r26, r24            ; Initializing X register with address of string parameter
    mov r27, r25
    mov r28, r24            ; Initializing Y register with address of string parameter
    mov r29, r25           

1:
    ld r24, Y+              ;increments Y stores in r24
    dec r18                 ;decrements from string length
    cpi r18, 0              ;checks if r18 is 0
    brne 1b                 ;if it is not 0 then continue loop
    ld r18, X               ;load first value of X into r18
    cp r24, r18             ;compare first character of string to last character
    brne 3f                 ;if they are not equal branch to 3
2:
    ld r18, X+              ;increments string from front
    ld r24, -Y              ;decrements string from back
    dec r20                 ;decrements string length
    cp r20, 0               ;checks if r20 is 0
    breq 4f                 ;if true branch to 4
    cp r18, r24             ;compares tail character to head character
    breq 2b                 ;if they are equal continue loop
3:  
    pop r29
    pop r28
    pop r27
    pop r26                 ;popping registers from stack
    clr r24
    ret                     ; returns 0 (false)

4:
    pop r29             
    pop r28
    pop r27
    pop r26                 ;popping registers from stack
    ldi r24, 1              
    ret                     ;returns 1 (true)
