MASM32_ROOT=${DRIVE_C}/masm32
SUBSYSTEM=CONSOLE


all:
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomy_lib.obj my_lib.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomain.obj main.asm
	$(MASM32_ROOT)/bin/link.exe //dll //def:my_lib.def //out:my_lib.dll my_lib.obj
	rm -f *exp
	mv my_lib.lib my_lib.lib2
	$(MASM32_ROOT)/bin/lib.exe //MACHINE:IX86 //DEF:my_lib.def
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:$(SUBSYSTEM)  //OUT:main.exe main.obj

clean:
	rm -f *exe *obj *res *lib *lib2 *dll *exp
