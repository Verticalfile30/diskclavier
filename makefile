
main: inputHandler.asm main.asm print.asm
	nasm main.asm -f bin -o firstStage.bin
	nasm inputHandler.asm -f bin -o secondStage.bin
	nasm testDest.asm -f bin -o test.bin
	cat firstStage.bin secondStage.bin test.bin > diskclavier.bin