MASM32_ROOT=${DRIVE_C}/masm32
SUBSYSTEM=CONSOLE
NAME=loop


SOURCES = $(wildcard *.asm *.rc)
OBJS = $(patsubst %.asm,%.obj,$(patsubst %.rc,%.RES,$(SOURCES)))

all: $(NAME)

$(NAME): $(NAME).exe


$(NAME).exe: $(OBJS)
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:$(SUBSYSTEM) //LIBPATH:"C:\\masm32\\lib" //OUT:$(NAME).exe *.obj *.res

%.obj: %.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp $<

%.res: %.rc
	$(MASM32_ROOT)/bin/rc.exe $<

clean:
	rm -f *exe *obj *res
