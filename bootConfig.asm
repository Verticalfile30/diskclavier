[bits 16]
global bootProcessStart

bootProcessStart:
    pusha
    call newLineSecondStage
    mov bx, bootHelpMsg1
    call printSecondStage
    call newLineSecondStage
    mov bx, bootHelpMsg2
    call printSecondStage
    call newLineSecondStage
    mov bx, bootHelpMsg3
    call printSecondStage
    call newLineSecondStage

firstBootInputLoop:
    mov di, firstInputStringBoot
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingleSecondStage

    cmp al, 13
    je firstBootInputProcessor

    mov [di], al

    jmp firstBootInputLoop

firstBootInputProcessor:
    cmp [di], byte 0x66
    je floppy 
    jne firstBootInputLoop

    cmp [di], byte 0x63
    je cdrom
    jne firstBootInputLoop

floppy:
    mov [bootDrive], byte 0
    jmp secondBootInputStart

cdrom:
    mov [bootDrive], byte 224
    jmp secondBootInputStart

secondBootInputStart:
    mov di, sectorsInString
    mov bx, bootHelpMsg4
    call printSecondStage
    call newLineSecondStage

secondBootInputLoop:
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingleSecondStage

    cmp al, 13
    je secondBootInputProcessor

    mov [di], al
    inc di

    jmp secondBootInputLoop

secondBootInputProcessor:
    call stringToNumber
    mov ax, [finalSector]
    mov [sectorsInNumber], ax

    jmp thirdBootInputStart

thirdBootInputStart:
    mov bx, bootHelpMsg5
    call printSecondStage
    call newLineSecondStage

thirdBootInputLoop:
    mov di, thirdInputStringBoot
    mov ah, 0x00
    int 16h

    mov bl, al
    call printSingleSecondStage

    cmp al, 13
    je thirdBootInputProcessor

    mov [di], al

    jmp thirdBootInputLoop

thirdBootInputProcessor:
    cmp [di], byte 0x79
    je bootConfig


    cmp [di], byte 0x6e
    je hang
    jne thirdBootInputLoop

hang:
    mov bx, bootHelpMsg6
    call printSecondStage
    call newLineSecondStage
    jmp $


bootConfig:
    mov bx, kernelLocationSS ;store read data into this address
    mov dh, [sectorsInNumber] ;sectors to read
    mov dl, [bootDrive] ;disk where image is present
    call readDiskSS ;call readDisk funciton
    call kernelLocationSS

firstInputStringBoot times 1 db 0
thirdInputStringBoot times 1 db 0
;inputStringDrive times 2 db 0
bootHelpMsg1 db "INIT LOW LEVEL DISK SERVICES", 0
bootHelpMsg2 db "SELECT THE BOOT DRIVE", 0
bootHelpMsg3 db "FLOPPY, CDROM", 0
bootHelpMsg4 db "How many sectors?", 0
bootHelpMsg5 db "Continue with boot?", 0
bootHelpMsg6 db "Hanging. . . Restart Machine", 0
bootDrive db 0
sectorsInString times 2 db 0
sectorsInNumber db 0
kernelLocationSS equ 0x9000
