MASM32_ROOT=C:/masm32
SUBSYSTEM=CONSOLE


all:
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomy_libasm.obj my_libasm.asm
	$(MASM32_ROOT)/bin/link.exe //dll //def:my_libasm.def //out:my_libasm.dll my_libasm.obj

	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomy_libmmx.obj my_libmmx.asm
	$(MASM32_ROOT)/bin/link.exe //dll //def:my_libmmx.def //out:my_libmmx.dll my_libmmx.obj

	gcc -shared -std=c99 -o my_libc.dll my_lib.c

	gcc -std=c99 -o main_c.exe main.c my_libc.dll
	gcc -std=c99 -o main_asm.exe main.c my_libasm.dll
	gcc -std=c99 -o main_mmx.exe main.c my_libmmx.dll


	#RUN
	-(time main_c.exe)
	-(time main_asm.exe)
	-(time main_mmx.exe)


clean:
	rm -f *exe *obj *res *lib *lib2 *dll *exp
