parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f19_group06.yacc lex.yy.c
	yacc CS315f19_group06.yacc
lex.yy.c: CS315f19_group06.lex
	lex CS315f19_group06.lex
clean:
	rm -f lex.yy.c y.tab.c out