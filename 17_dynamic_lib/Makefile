MASM32_ROOT=C:/masm32
SUBSYSTEM=CONSOLE


all:
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomy_lib.obj my_lib.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fomain.obj main.asm

	@#Windows DLL
	$(MASM32_ROOT)/bin/link.exe //dll //def:my_lib.def //out:my_lib.dll my_lib.obj

	rm -f *exp my_lib.lib
	$(MASM32_ROOT)/bin/lib.exe //MACHINE:IX86 //DEF:my_lib.def
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:$(SUBSYSTEM)  //OUT:main.exe main.obj

	@#GNU GCC DLL
	ld -shared --enable-stdcall-fixup --add-stdcall-alias -o my_lib_gcc.dll my_lib.obj $(MASM32_ROOT)/lib/masm32.lib "C:/WINDOWS/system32/kernel32.dll"
	ld --enable-stdcall-fixup -o main_gcc.exe main.obj "C:/WINDOWS/system32/kernel32.dll" my_lib_gcc.dll
	ld --enable-stdcall-fixup -o main_gcc2.exe main.obj "C:/WINDOWS/system32/kernel32.dll" my_lib.dll

	@#RUN
	./main.exe
	./main_gcc.exe
	./main_gcc2.exe


clean:
	rm -f *exe *obj *res *lib *dll *exp
