
main: inputHandler.asm main.asm print.asm
	nasm main.asm -f bin -o firstStage.bin
	nasm inputHandler.asm -f bin -o secondStage.bin
	nasm testDest.asm -f bin -o test.bin
	cat firstStage.bin secondStage.bin > diskclavier.bin
	dd if=/dev/zero of=floppy.img bs=1024 count=1440
	dd if=diskclavier.bin of=floppy.img seek=0 conv=notrunc


twoDisk: inputHandler.asm main.asm print.asm
	nasm main.asm -f bin -o firstStage.bin
	nasm inputHandler.asm -f bin -o secondStage.bin
	nasm testDest.asm -f bin -o test.bin
	cat firstStage.bin secondStage.bin test.bin > diskclavier.bin
	dd if=/dev/zero of=floppy.img bs=1024 count=1440
	dd if=diskclavier.bin of=floppy.img seek=0 conv=notrunc
	dd if=/dev/zero of=floppy2.img bs=1024 count=1440
	dd if=test.bin of=floppy2.img seek=0 conv=notrunc

mainDepr: inputHandler.asm main.asm print.asm
	nasm main.asm -f bin -o firstStage.bin
	nasm inputHandler.asm -f bin -o secondStage.bin
	nasm testDest.asm -f bin -o test.bin
	cat firstStage.bin secondStage.bin > diskclavier.bin
	dd if=/dev/zero of=floppy.img bs=1024 count=1440
	dd if=diskclavier.bin of=floppy.img seek=0 conv=notrunc
	dd if=/dev/zero of=floppy2.img bs=1024 count=1440
	dd if=test.bin of=floppy2.img seek=0 conv=notrunc
