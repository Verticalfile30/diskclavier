[bits 16]
[org 0x1000]
global inputHandler

inputHandler:
    pusha


inputLoop:
    mov di, inputString
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingleSecondStage

    cmp al, 13
    je inputProcessor

    mov [di], al

    jmp inputLoop

inputProcessor:
    cmp [di], byte 0x68
    je helpString
    cmp [di], byte 0x62
    je bootYes
    jne resetInputString

bootYes:
    call bootProcessStart

helpString:
    mov bx, helpMsg
    call newLineSecondStage
    call printSecondStage
    call newLineSecondStage
    mov bx, helpMsg2
    call printSecondStage
    call newLineSecondStage
    mov bx, helpMsg3
    call printSecondStage
    call newLineSecondStage    
    jmp inputLoop


resetInputString:
    call newLineSecondStage

    jmp inputLoop
    popa
    ret


inputString times 1 db 0 
helpMsg db "Diskclavier Commands:", 0
helpMsg2 db "h = display this message", 0
helpMsg3 db "b = begin boot process (Low Level Disk Services)", 0

%include "printSecondStage.asm"
%include "bootConfig.asm"
%include "stringToNumber.asm"
%include "diskReadSS.asm"