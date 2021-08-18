[bits 16]

global printSecondStage
global newLineSecondStage
global printSingleSecondStage

printSecondStage:
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

newLineSecondStage:
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

printSingleSecondStage:
    pusha
    mov ah, 0x0e

singleStart:

    mov al, bl
    int 0x10
    
    popa
    ret
