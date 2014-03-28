MASM32_ROOT=${DRIVE_C}/masm32
SUBSYSTEM=CONSOLE

all: loop.exe loop2.exe

%.exe: %.obj
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:$(SUBSYSTEM) //LIBPATH:"C:\\masm32\\lib" //OUT:$@ $<

%.obj: %.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp //Fo$@ $<

%.res: %.rc
	$(MASM32_ROOT)/bin/rc.exe $<

clean:
	rm -f *exe *obj *res
