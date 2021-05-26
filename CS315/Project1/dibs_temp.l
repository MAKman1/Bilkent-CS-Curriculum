/* DIBS language lex file */

%option main
digit [0-9]
char [A-Za-z]
string ({char}|{digit})+
float [+-]?{digit}+(\.){digit}+
int [+-]?{digit}+
boolean  ([tT][rR][uU][eE])|([fF][aA][lL][sS][eE])


%%

{boolean}  printf("BOOLEAN ");

\#\#([^#]*(\n))*[^#]*\#\#\#  printf("COMMENT_MULTI_LINE ");
\#(.)*(\n)   printf("COMMENT_LINE ");

[nN][eE][wW][ ][nN][oO][dD][eE][\(][\)]  printf("NODE_INITIALIZED ");

{string}(\.)[rR][eE][cC][eE][iI][vV][eE](\()(\))  printf("CONNECTION_RECEIVE ");
[nN][eE][wW][ ][cC][oO][nN][nN][eE][cC][tT][iI][oO][nN](\()(\")(.)+(\")(\))  printf("CONNECTION_INITIALIZED ");
{string}(\.)[dD][iI][sS][cC][oO][nN][nN][eE][cC][tT](\()(\))  printf("CONNECTION_DISCONNECT ");
{string}(\.)[sS][eE][nN][dD](\(){int}(\))  printf("CONNECTION_SEND ");


{string}(\.)[gG][eE][tT][tT][iI][mM][eE](\()(\))  printf("GET_TIME ");
{string}(\.)[gG][eE][tT][hH][uU][mM][iI][dD][iI][tT][yY](\()(\))  printf("GET_HUMIDITY ");
{string}(\.)[gG][eE][tT][lL][iI][gG][hH][tT](\()(\))  printf("GET_LIGHT ");
{string}(\.)[gG][eE][tT][tT][eE][mM][pP][eE][rR][aA][tT][uU][rR][eE](\()(\))  printf("GET_TEMP ");
{string}(\.)[sS][eE][tT][sS][wW][iI][tT][cC][hH](\(){digit}(\,)[ ]*{boolean}(\))  printf("SET_SWITCH ");

{string}(\.)[gG][eE][tT][pP][rR][eE][sS][sS][uU][rR][eE](\()(\))  printf("GET_PRESSURE ");
{string}(\.)[gG][eE][tT][aA][iI][rR][qQ][uU][aA][lL][iI][tT][yY](\()(\))  printf("GET_AIR_QUALITY ");
{string}(\.)[gG][eE][tT][sS][oO][uU][nN][dD][lL][eE][vV][eE][lL](\()(\))  printf("GET_SOUND_LEVEL");
{string}(\.)[gG][eE][tT][aA][iI][rR][pP][rR][eE][sS][sS][uU][rR][eE](\()(\))  printf("GET_AIR_PRESSURE");



\n	  printf("NL ");
\(	  printf("LP ");
\)	  printf("RP ");
\+    printf("PLUS ");
\-    printf("MIN ");
\*    printf("MUL ");
\/    printf("DIV ");
\*\*  printf("POW ");
\%    printf("MOD ");
\=    printf("ASSIGN ");
\<    printf("LT ");
\>    printf("GT ");
\<=   printf("LTE ");
\>=   printf("GTE ");
\==   printf("EQ ");
\,    printf("COMMA ");
\!=  printf("NOT_EQ ");


[aA][nN][dD]  printf("AND ");
[oO][rR]  printf("OR ");

[iI][fF][ ]*(\()    printf("IF LP ");
[iI][fF]  printf("IF ");

[eE][lL][sS][eE][iI][fF][ ]*(\()  printf("ELSE_IF LP ");
[eE][lL][sS][eE][iI][fF]  printf("ELSE_IF ");

[eE][lL][sS][eE]  printf("ELSE ");

[fF][oO][rR][ ]*(\()  printf("FOR LP "); 
[fF][oO][rR]   printf("FOR ");

[wW][hH][iI][lL][eE][ ]*(\() printf("WHILE LP ");
[wW][hH][iI][lL][eE] printf("WHILE ");

[eE][nN][dD]   printf("END ");
[tT][oO]   printf("TO ");

[fF][uU][nN][cC][tT][iI][oO][nN][ ]{string}  printf("FUNCTION_START ");
[rR][eE][tT][uU][rR][nN][ ]((\"{string}\")|{string}|{int}|{float})  printf("FUNCTION_RETURN ");
{string}(\()  printf("FUNCTION_CALL LP ");

{float}	printf("FLOAT ");
{int} printf("NUMBER ");
\"([ ]*{string}[ ]*)*\"  printf("STRING ");
{string}  printf("IDENTIFIER ");
.  ;
