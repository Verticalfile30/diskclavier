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
    mov di, inputString
    cmp [di + 0], byte 0x68
    je hTree
    cmp [di], byte 0x68
    jne resetInputString

hTree:
    cmp [di + 1], 0x65
    je eTree
    cmp [di + 1], 0x65
    jne resetInputString

eTree:
    cmp [di + 2], 0x6c
    je lTree
    cmp [di + 2], 0x6c
    jne resetInputString

lTree:
    cmp [di + 3], 0x70
    je helpString
    cmp [di + 3], 0x70
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
helpMsg db "Diskclavier is currently in pre-alpha1 development, new features are coming soon!", 0
