/* DIBS language lex file */


digit [0-9]
char [A-Za-z]
string \"[^"]*\"
float [-]?{digit}+(\.){digit}+
int [-]?{digit}+
boolean  ([tT][rR][uU][eE])|([fF][aA][lL][sS][eE])
var  {char}({char}|{digit})*


%%

{boolean}  return(BOOLEAN );

\#\#([^#]*(\n)*)*[^#]*\#\#\#  { 
                                int count = 0;
                                while( count < strlen(yytext)){
                                  if( yytext[count] == '\n')
                                    yylineno++;
                                  count++;
                                } 

                                return(COMMENT_MULTI_LINE );
                              }
\#[^#\n]*(\n)   {yylineno++; return(COMMENT_LINE );}
[nN][eE][wW][ ][nN][oO][dD][eE][\(][\)]  return(NODE_INITIALIZED );

[iI][nN][pP][uU][tT](\()  return( INPUT );
[pP][rR][iI][nN][tT](\()  return( PRINT);

{var}(\.)[rR][eE][cC][eE][iI][vV][eE](\()(\))  return(CONNECTION_RECEIVE );
[nN][eE][wW][ ][cC][oO][nN][nN][eE][cC][tT][iI][oO][nN](\()[ ]*(\")(.)+(\")[ ]*(\))  return(CONNECTION_INITIALIZED );
[nN][eE][wW][ ][cC][oO][nN][nN][eE][cC][tT][iI][oO][nN](\()[ ]*{var}[ ]*(\))  return(CONNECTION_INITIALIZED );
{var}(\.)[dD][iI][sS][cC][oO][nN][nN][eE][cC][tT](\()(\))  return(CONNECTION_DISCONNECT );
{var}(\.)[cC][oO][nN][nN][eE][cC][tT](\()[ ]*(\")(.)+(\")[ ]*(\))  return(CONNECTION_CONNECT );
{var}(\.)[cC][oO][nN][nN][eE][cC][tT](\()[ ]*{var}[ ]*(\))  return(CONNECTION_CONNECT );
{var}(\.)[sS][eE][nN][dD](\(){int}(\))  return(CONNECTION_SEND );
{var}(\.)[sS][eE][nN][dD](\(){var}(\))  return(CONNECTION_SEND );


{var}(\.)[gG][eE][tT][tT][iI][mM][eE](\()(\))  return(GET_TIME );
{var}(\.)[gG][eE][tT][hH][uU][mM][iI][dD][iI][tT][yY](\()(\))  return(GET_HUMIDITY );
{var}(\.)[gG][eE][tT][lL][iI][gG][hH][tT](\()(\))  return(GET_LIGHT );
{var}(\.)[gG][eE][tT][tT][eE][mM][pP][eE][rR][aA][tT][uU][rR][eE](\()(\))  return(GET_TEMP );
{var}(\.)[sS][eE][tT][sS][wW][iI][tT][cC][hH](\(){digit}(\,)[ ]*{boolean}(\))  return(SET_SWITCH );

{var}(\.)[gG][eE][tT][pP][rR][eE][sS][sS][uU][rR][eE](\()(\))  return(GET_PRESSURE );
{var}(\.)[gG][eE][tT][aA][iI][rR][qQ][uU][aA][lL][iI][tT][yY](\()(\))  return(GET_AIR_QUALITY );
{var}(\.)[gG][eE][tT][sS][oO][uU][nN][dD][lL][eE][vV][eE][lL](\()(\))  return(GET_SOUND_LEVEL);
{var}(\.)[gG][eE][tT][aA][iI][rR][pP][rR][eE][sS][sS][uU][rR][eE](\()(\))  return(GET_AIR_PRESSURE);



\n	  {yylineno++; return(NL );}
\(	  return(LP );
\)	  return(RP );
\+    return(PLUS );
\-    return(MIN );
\*    return(MUL );
\/    return(DIV );
\*\*  return(POW );
\%    return(MOD );
\=    return(ASSIGN );
\<    return(LT );
\>    return(GT );
\<=   return(LTE );
\>=   return(GTE );
\==   return(EQ );
\,    return(COMMA );
\!=  return(NOT_EQ );


[aA][nN][dD]  return(AND );
[oO][rR]  return(OR );


[iI][fF]  return(IF );

[eE][lL][sS][eE]  return(ELSE );

 
[fF][oO][rR]   return(FOR );


[wW][hH][iI][lL][eE] return(WHILE );

[eE][nN][dD]   return(END );
[tT][oO]   return(TO );

[fF][uU][nN][cC][tT][iI][oO][nN][ ]{var}  return(FUNCTION_START );
[rR][eE][tT][uU][rR][nN]  return(FUNCTION_RETURN );
{var}(\()  return(FUNCTION_CALL);

{float}	return(FLOAT );
{int} return(NUMBER );
{string}  return(STRING );
{var}  return(IDENTIFIER );
.  ;
%%
int yywrap(){ return 1; }
