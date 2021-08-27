[bits 32]

VIDEO_MEMORY equ 0xb8000    ; memory address of VGA frame
WHITE_ON_BLACK equ 0x0f     ; opcode for white text

print_string_pm:
    pusha                   ; push registers onto stack
    mov edx, VIDEO_MEMORY   ; store video memory location

print_string_pm_loop:
    mov al, [ebx]           ; move character in ebx into al
    mov ah, WHITE_ON_BLACK  ; ah stores print type

    cmp al, 0               ; if char is null we finished the string
    je print_string_pm_done 

    mov [edx], ax           ; otherwise put the character into the frame buffer
    add ebx, 1              ; increase the index of the string buffer
    add edx, 2              ; increase the index of the frame buffer

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret
