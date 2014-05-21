MASM32_ROOT=c:/masm32

all:
	$(MASM32_ROOT)/bin/ml.exe //AT //c //Fo bootloader.o bootloader.asm
	$(MASM32_ROOT)/bin/link16.exe //TINY bootloader.o,boot.com,null,null,null
	mkdir -p iso_content
	dd if=boot.com of=./iso_content/boot.img ibs=1474560 conv=sync
	#genisoimage -J -R -o boot.iso -b boot.img iso_content
	mkisofs -J -R -o boot.iso -b boot.img iso_content

	# No emulation
	mkdir -p iso_content2
	cp boot.com iso_content2/boot.com
	mkisofs -J -R -o boot2.iso -b boot.com -no-emul-boot iso_content2

	# Hard drive
	mkdir -p iso_content3
	cp boot.com iso_content3/boot.com
	mkisofs -J -R -o boot3.iso -b boot.com -hard-disk-boot iso_content3

	# USB/FLOPPY
	perl -pe 's/^.*mov si, offset msg.*$$/\tmov si, offset msg + 7c00h/g' bootloader.asm | \
	perl -pe 's/SUPER/HYPER/g' > bootloader.tmp
	$(MASM32_ROOT)/bin/ml.exe //AT //c //Fo bootloader.o bootloader.tmp
	$(MASM32_ROOT)/bin/link16.exe //TINY bootloader.o,boot.mbr,null,null,null
	dd if=boot.mbr of=floppy.img ibs=1474560 conv=sync


clean:
	rm -rf *.iso *.o *.com *.exe *.map *.obj iso_content* *.img *.tmp *.mbr