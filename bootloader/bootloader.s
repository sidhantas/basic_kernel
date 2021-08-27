[org 0x7c00]
KERNEL_OFFSET equ 0x1000

    mov [BOOT_DRIVE], dl

    mov bp, 0x9000
    mov sp, bp
 
    mov bx, MSG_REAL_MODE
    call print_string
   
    mov ax, 0x2401
    int 0x15

    mov ah, 0x0   ; clear screen
    int 0x10

    ;mov ah, 0x13
    ;int 0x10

    call load_kernel
    mov ax, 0x0   ; clear screen
    int 0x10

	mov ax, 0x0013
    int 0x10
    
    

    call switch_to_pm
    


    jmp $

%include "print_string.s"
%include "gdt.s"
%include "switch_to_pm.s"
%include "print_string_pm.s"
%include "disk_load.s"

[bits 16]

load_kernel:
    mov bx, MSG_LOAD_KERNEL
    call print_string

    mov bx, KERNEL_OFFSET
    mov dh, 15
    mov dl, [BOOT_DRIVE]
    call disk_load

    ret

[bits 32]
BEGIN_PM: 
    call KERNEL_OFFSET

    jmp $

BOOT_DRIVE db 0
MSG_REAL_MODE db "Started in 16-bit Real Mode", 0
MSG_PROT_MODE db "Successfully landed in 32-bit Protected Mode", 0
MSG_LOAD_KERNEL db "Loading kernel into memory.", 0


times 510-($-$$) db 0
    dw 0xaa55



