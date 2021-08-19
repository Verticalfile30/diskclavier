[bits 16]
global bootProcessStart

bootProcessStart:
    pusha
    
bootConfig:
    mov bx, bootHelpMsg7
    call printSecondStage
    call newLineSecondStage
    ;mov EXTRA_SEGMENT, es
    mov ax, 0x0200
    mov es, ax
    mov bx, UnionOS ;store read data into this address
    mov dh, 32 ;[sectorsInNumber] ;sectors to read
    mov dl, [bootDrive] ;disk where image is present drive B:
    call readDiskSS ;call readDisk funciton
    xchg bx, bx
    call kernelSegment:UnionOS


firstInputStringBoot times 1 db 0
thirdInputStringBoot times 1 db 0
bootHelpMsg1 db "INIT LOW LEVEL DISK SERVICES", 0
bootHelpMsg2 db "SELECT THE BOOT DRIVE", 0
bootHelpMsg3 db "FLOPPY, CDROM", 0
bootHelpMsg4 db "How many sectors?", 0
bootHelpMsg5 db "Continue with boot?", 0
bootHelpMsg6 db "Hanging. . . Restart Machine", 0
bootHelpMsg7 db "booting . . .", 0
bootDrive db 1
sectorsInString times 2 db 0
sectorsInNumber db 0
UnionOS equ 0x0000
kernelSegment equ 0x0300
EXTRA_SEGMENT db 0
