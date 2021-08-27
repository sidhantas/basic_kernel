print_string:
    pusha
        
next_char:
    mov al,[bx]  ; move first character in buffer to al 
    cmp al, 0  ; check if the character is null
    je break_prnt ; done if it is null
    mov ah, 0x0e ; prints character
    int 0x10 ; BIOS interrupt
    inc bx ; increase address to next char
    jmp next_char 

break_prnt:
    popa
    ret
