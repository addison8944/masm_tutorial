MASM32_ROOT=${DRIVE_C}/masm32
SUBSYSTEM=CONSOLE


all:
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomy_lib.obj my_lib.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomain.obj main.asm
	$(MASM32_ROOT)/bin/lib.exe my_lib.obj /out:my_lib.lib
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:$(SUBSYSTEM) //OUT:main.exe main.obj

clean:
	rm -f *exe *obj *res *lib
