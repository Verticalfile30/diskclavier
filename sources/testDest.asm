[bits 16]
[org 0x2000]

tes:
    mov bx, testString
    call printTS
    call newLineTS

    jmp $

printTS:
    pusha
    mov ah, 0x0e

printStart:
    
    mov dx, 0
    mov al, [bx]

    cmp al, 0
    je finishPrint

    int 0x10
    inc bx
    jmp printStart

finishPrint:
    popa
    ret

newLineTS:
    pusha

newLineStart:
    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10

newLineDone:    
    popa
    ret

printSingle:
    pusha
    mov ah, 0x0e

singleStart:

    mov al, bl
    int 0x10
    
    popa
    ret

testString db "Welcome to Stage 3", 0