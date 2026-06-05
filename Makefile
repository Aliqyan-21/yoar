C = fbc
FLAGS = -w all -g
INCLUDES = -i inc
SOURCES = src/main.bas src/parser.bas src/generator.bas

yoar : ${SOURCES}
	${C} ${FLAGS} ${SOURCES} ${INCLUDES} -x yoar

clean :
	@rm yoar
