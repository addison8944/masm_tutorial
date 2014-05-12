MASM32_ROOT=c:/masm32

all:
	$(MASM32_ROOT)/bin/ml.exe /AT /c /Fo bootloader.o bootloader.asm
	$(MASM32_ROOT)/bin/link16.exe /TINY bootloader.o,boot.com,null,null,null
	mkdir -p iso_content
	dd if=boot.com of=./iso_content/boot.img ibs=1474560 conv=sync
	#genisoimage -J -R -o boot.iso -b boot.img iso_content
	mkisofs -J -R -o boot.iso -b boot.img iso_content

clean:
	rm -rf *.iso *.o *.com *.exe *.map *.obj iso_content *.img