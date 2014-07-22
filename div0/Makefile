MASM32_ROOT=c:/masm32
NAME=div0

SOURCES = $(wildcard *.asm *.rc)
OBJS = $(patsubst %.asm,%.obj,$(patsubst %.rc,%.RES,$(SOURCES)))

all: $(NAME)

$(NAME): $(NAME).exe


$(NAME).exe: $(OBJS)
	$(MASM32_ROOT)/bin/link.exe //SUBSYSTEM:CONSOLE //LIBPATH:"C:\\masm32\\lib" *.obj *.RES

%.obj: %.asm
	$(MASM32_ROOT)/bin/ml.exe //c //coff //Cp $<

%.RES: %.rc
	$(MASM32_ROOT)/bin/rc.exe $<

clean:
	rm -f *exe *obj *RES
