[org 0x7c00]
[bits 16]

    xor ax, ax
    mov ds, ax
    mov es, ax
    mov bx, 0x8000
    cli

    mov ss, bx
    mov sp, ax
    mov bp, sp 
    sti
    cld

    mov sp, bp

    mov bx, welcome
    call print
    call newLine

    mov cx, 0fh ;time delay
    mov dx, 4240h
    mov ah, 86h
    int 15h  

    mov bx, license
    call print
    call newLine

    call inputHandler




welcome db "Welcome to Xenoware Diskclavier!", 0
license db "Diskclavier is licensed under MIT", 0
help db "Press h for help", 0

times 510 - ($-$$) db 0
dw 0xaa55