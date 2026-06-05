C = fbc
FLAGS = -w all -g
INCLUDES = -i inc
SOURCES = src/parser.bas src/generator.bas src/main.bas

yoar : ${SOURCES}
	${C} ${FLAGS} ${SOURCES} ${INCLUDES} -x yoar

clean :
	@rm yoar
