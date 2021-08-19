[bits 16]
global stringToNumber

stringToNumber:
    pusha
    mov di, sectorsInString
    mov al, [di]
    sub al, byte 48
    ;mul al, 10
    mov [tensDigit], al

    inc di
    mov al, [di]
    sub al, 48
    mov [onesDigit], al
    
    mov al, [tensDigit]
    mov bl, [onesDigit]
    add al, bl

    mov [finalSector], al


    
    popa
    ret 


tensDigit db 0
onesDigit db 0
finalSector db 0
