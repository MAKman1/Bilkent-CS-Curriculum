/* dibs.y */
%{ int yylex(void); extern int yylineno; %}

%token BOOLEAN COMMENT_MULTI_LINE COMMENT_LINE NODE_INITIALIZED CONNECTION_RECEIVE CONNECTION_INITIALIZED CONNECTION_DISCONNECT CONNECTION_SEND GET_TIME GET_HUMIDITY GET_LIGHT GET_TEMP SET_SWITCH GET_PRESSURE GET_AIR_QUALITY GET_SOUND_LEVEL GET_AIR_PRESSURE NL LP RP PLUS MIN MUL DIV POW MOD ASSIGN LT GT LTE GTE EQ COMMA NOT_EQ AND OR IF ELSE_IF ELSE FOR WHILE END TO FUNCTION_START FUNCTION_RETURN FUNCTION_CALL FLOAT NUMBER STRING IDENTIFIER CONNECTION_CONNECT PRINT INPUT
%start start

%%
start: program; { printf("Valid program\n");}


program: lines;

lines: line
      | line lines
      ;
      
line: comments
    | function_declaration NL
    | if_st NL
    | assign_st NL
    | connection_st NL
    | for_loop NL
    | while_loop NL
    | function_call NL
    | function_return NL
    | print NL    
    | SET_SWITCH NL    
    | NL 
    ;

comments: COMMENT_LINE
        | COMMENT_MULTI_LINE
        ;

assign_st: IDENTIFIER ASSIGN constant
          | IDENTIFIER ASSIGN IDENTIFIER
          | IDENTIFIER ASSIGN expr
          | IDENTIFIER ASSIGN logic_expr
          | IDENTIFIER ASSIGN function_call
          | IDENTIFIER ASSIGN class_declaration
          | IDENTIFIER ASSIGN CONNECTION_RECEIVE
          | IDENTIFIER ASSIGN input
          | IDENTIFIER ASSIGN primitive_function
          ;

if_st: IF logic_expr NL lines ELSE NL lines END
      | IF logic_expr NL lines END
      ;
      
          
      
while_loop: WHILE logic_expr NL lines END
          ;
          
for_loop:  FOR IDENTIFIER ASSIGN NUMBER TO NUMBER NL lines END
          | FOR IDENTIFIER ASSIGN NUMBER TO IDENTIFIER NL lines END
          | FOR IDENTIFIER ASSIGN IDENTIFIER TO NUMBER NL lines END
          | FOR IDENTIFIER ASSIGN IDENTIFIER TO IDENTIFIER NL lines END
          | FOR IDENTIFIER ASSIGN IDENTIFIER TO expr NL lines END
          | FOR IDENTIFIER ASSIGN expr TO IDENTIFIER NL lines END
          | FOR IDENTIFIER ASSIGN NUMBER TO expr NL lines END
          | FOR IDENTIFIER ASSIGN expr TO NUMBER NL lines END
          | FOR IDENTIFIER ASSIGN expr TO expr NL lines END         

function_call: FUNCTION_CALL RP
            | FUNCTION_CALL multi_params RP
            ;
            
function_declaration: FUNCTION_START LP RP NL lines END
                    | FUNCTION_START LP multi_params RP NL lines END
                    ;                    
function_return: FUNCTION_RETURN expr
                | FUNCTION_RETURN logic_expr
                | FUNCTION_RETURN constant
                | FUNCTION_RETURN IDENTIFIER
                ;

multi_params: IDENTIFIER
            | constant
            | IDENTIFIER COMMA multi_params
            | constant COMMA multi_params
            ;
            
print: PRINT constant RP
      | PRINT IDENTIFIER RP
      | PRINT expr RP
      | PRINT logic_expr RP
      ;
input: INPUT RP
      | INPUT STRING RP
      ;
          
connection_st: CONNECTION_DISCONNECT
              | CONNECTION_SEND
              | CONNECTION_CONNECT
              ;
              
          
expr: expr_base
    | expr_base op operand
    ;
    
                  
expr_base: operand op LP expr_base RP
    | operand op operand
    | LP expr_base RP
    | expr_base op operand op operand
    | expr_base op LP expr_base RP
    ;
    
    
logic_expr: operand comparison_op operand
          | LP logic_expr RP
          | logic_expr boolean_op operand comparison_op operand
          | logic_expr boolean_op LP operand comparison_op operand RP
          ;

operand: IDENTIFIER | constant | function_call | primitive_function;      


class_declaration: NODE_INITIALIZED
                  | CONNECTION_INITIALIZED
                  ;
                  
primitive_function: GET_TIME
                  | GET_HUMIDITY
                  | GET_LIGHT
                  | GET_TEMP
                  | GET_PRESSURE
                  | GET_AIR_QUALITY
                  | GET_SOUND_LEVEL
                  | GET_AIR_PRESSURE
                  ;
                  
arithmetic_op: PLUS | MIN | MUL | DIV | POW | MOD;
comparison_op: LT | GT | LTE | GTE | EQ | NOT_EQ;
boolean_op: AND | OR;
constant: NUMBER | STRING | FLOAT | BOOLEAN;
op: boolean_op | arithmetic_op;
            



%%
#include "lex.yy.c"
int yyerror(char* s){
  fprintf(stderr, "%s at line %d\n",s, yylineno);
  return 1;
}
int main(){
 yyparse();
 return 0;
}
