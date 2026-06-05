C = fbc
FLAGS = -w all -g
SOURCES = src/parser.bas main.bas

yoar : ${SOURCES}
	${C} ${FLAGS} ${SOURCES} -x yoar

clean :
	@rm yoar
