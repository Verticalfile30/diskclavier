[bits 16]

global print
global newLine

print:
    pusha
    mov ah, 0x0e

printStart:
    
    mov dx, 0
    mov al, [bx + dx]

    cmp al, 0
    je finishPrint

    int 0x10
    inc dx
    jmp printStart

finishPrint:
    popa
    ret

newLine:
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