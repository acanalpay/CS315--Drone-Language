mre:
	lex CS315f20_team19.l
	yacc CS315f20_team19.y
	gcc -o parser y.tab.c
clean:
	rm -f parser y.tab.c lex.yy.c y.output