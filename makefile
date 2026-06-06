CC = fbc
SOURCES = src/main.bas src/scanner.bas src/utils.bas src/parser.bas src/generator.bas
INCLUDES = -i inc
FLAGS = -g -w all -exx
OUTPUT = bin/yoar

${OUTPUT}: ${SOURCES}
	mkdir -p bin
	${CC} ${FLAGS} ${SOURCES} ${INCLUDES} ${LIBS} ${LFLAGS} -x ${OUTPUT}

clean:
	rm bin/yoar

run:
	./bin/yoar
