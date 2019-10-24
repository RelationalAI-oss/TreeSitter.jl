UNAME := $(shell uname)
ifeq ($(UNAME), Linux)
TARGET = libmylang-parser.so
SHAREDLIBFLAG = -shared
else ifeq ($(UNAME), Darwin)
TARGET = libmylang-parser.dylib
SHAREDLIBFLAG = -dynamiclib
endif

CFLAGS= -fPIC -I tree-sitter/lib/include -I tree-sitter/lib/utf8proc
LDFLAGS= $(SHAREDLIBFLAG)

SOURCES = $(shell echo *.c src/parser_*.c tree-sitter/lib/src/lib.c)
OBJECTS = $(SOURCES:.c=.o)

all: $(TARGET)

clean:
	rm -f $(OBJECTS) $(TARGET)

$(TARGET) : $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o $@ $(LDFLAGS)
