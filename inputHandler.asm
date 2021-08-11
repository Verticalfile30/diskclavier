[bits 16]

inputHandler:
    pusha

inputLoop:

    mov ah, 0x00
    int 16h

    cmp al, 0x0d
    je inputProcessor

    mov bl, al
    call printSingle

    jmp inputLoop

inputProcessor:
    popa
    ret
