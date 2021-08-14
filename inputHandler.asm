[bits 16]

inputHandler:
    pusha
    mov di, inputString

inputLoop:
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingle

    cmp al, 13
    je inputProcessor

    mov [di], al

    jmp inputLoop

inputProcessor:
    cmp [di], byte 0x68
    je helpString
    cmp [di], byte 0x68
    jne resetInputString

helpString:
    mov bx, helpMsg
    call newLine
    call print
    call newLine
    jmp inputLoop

resetInputString:
    call newLine
    mov di, inputString
    jmp inputLoop
    popa
    ret


inputString times 50 db 0
helpMsg db "help msg", 0