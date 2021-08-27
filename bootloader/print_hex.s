table:
    db "0123456789ABCDEF", 0

prefix:
    db "0x", 0
HEX_OUT:
    db "1234", 0

print_hex:
    mov cx, 0

hex_loop:
    cmp cx, 4        ; check if all the hex values have been written
    je break_hex_loop; if yes break
    mov ax, dx       ; otherwise load dx into ax
    and ax, 0xF000   ; get the highest bit
    shr ax, 12       
    mov bx, table    ; get the ascii
    xlat
    mov bx, HEX_OUT  ; 
    add bx, cx       ;
    mov [bx], al     ; 
    shl dx, 4
    inc cx
    jmp hex_loop
    
break_hex_loop:
    mov bx, prefix
    call print_string
    mov bx, HEX_OUT
    call print_string
    ret 
