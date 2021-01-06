%{
#include<stdio.h>
#include<stdlib.h>
#define YYDEBUG 1
%}
%token FLY
%token LAND
%token BEGIN2
%token END
%token IF
%token ELSE
%token WHILE
%token FOR
%token INPUT
%token OUTPUT
%token RETURN
%token LETTER
%token DIGIT
%token SIGN
%token ALPHANUMERIC
%token INTEGER
%token DOUBLE
%token BOOL
%token BOOLEAN
%token LCB
%token RCB
%token LSB
%token RSB
%token LP
%token RP
%token COMMA
%token PLUS
%token MINUS
%token MULTIPLICATION
%token DIVISION
%token MOD
%token OR
%token AND
%token XOR
%token EQUAL
%token LESSTHAN
%token GREATERTHAN
%token LTE
%token GTE
%token NOT
%token NOT_EQUAL
%token SPACE
%token DOT
%token ASSIGNMENT_OP
%token VOID
%token SEMICOLON
%token MOVE
%token GET_ALTITUDE
%token GET_TEMPERATURE
%token SNAP
%token GET_ACCELERATION
%token GET_TIME
%token GET_CONNECTION
%token CAMERA_ON
%token CAMERA_OFF
%token IDENTIFIER
%token COMMENT
%token RETURN
%token CHAR
%token INT
%token INC_AND
%token INC_OR
%token STRING
%token IDENTIFIER
%token ASSIGNMENT_OP

%%
//General Design
program :
	FLY stmts LAND {printf("Program is Valid \n"); return 0;};
stmts :
	stmts stmt
	|
;

stmt :
	if_stmt
	|nonif_stmt
	|COMMENT ;

if_stmt :
	IF LP logic_expr RP BEGIN2 stmts END
	|IF LP logic_expr RP BEGIN2 stmts END ELSE BEGIN2 stmts END ;

nonif_stmt :
	variable
	|loops
	|funct_dec
	|func_call
	|var_dec
	|input_stmt
	|output_stmt ;

types :
	CHAR
	|INTEGER
	|STRING
	|BOOLEAN
	|DOUBLE ;

// Declerations
var_dec :
	IDENTIFIER
	| assignment_stmt ;

loops :
	while_stmt
	|for_stmt ;

funct_dec :
	func_name LP RP BEGIN2 stmts return_statement END
	|func_name LP func_params RP BEGIN2 stmts return_statement END ;

func_call :
	func_name LP RP
	|func_name LP func_params RP
	| primitive_func
;

func_name :
	IDENTIFIER ;

// Loops
while_stmt :
	WHILE LP logic_expr RP BEGIN2 stmts END;


for_stmt :
	FOR LP var_dec SEMICOLON logic_expr SEMICOLON assignment_stmt RP BEGIN2  stmts END ;

return_statement :

	|RETURN IDENTIFIER
	|RETURN ;

func_params :
	func_param
	|func_param COMMA func_params ;

func_param :
	variable
	|IDENTIFIER
 ;

assignment_stmt :
		IDENTIFIER ASSIGNMENT_OP logic_expr

input_stmt :
	INPUT LP IDENTIFIER RP
	|INPUT LP RP ;

output_stmt :
	OUTPUT LP IDENTIFIER RP
	|OUTPUT LP variable RP
	|OUTPUT LP func_call RP ;

primitive_func :
	MOVE LP RP
	|GET_ALTITUDE LP RP
	|GET_TEMPERATURE LP RP
	|SNAP LP RP
	|GET_ACCELERATION LP RP
	|GET_TIME LP RP
	|CAMERA_ON LP RP
	|CAMERA_OFF LP RP
	|GET_CONNECTION LP RP ;

	logic_expr :
	or_expr

	or_expr : and_expr
	|or_expr OR and_expr

	and_expr :
	inc_or_expr
	| and_expr AND inc_or_expr


	inc_or_expr :
	exc_or_expr |
	inc_or_expr INC_OR exc_or_expr


	exc_or_expr :
	inc_and_expr
	| exc_or_expr XOR inc_and_expr


	inc_and_expr :
	 eq_comp
	| inc_and_expr INC_AND eq_comp

	eq_comp :
	relat_comp
	| eq_comp EQUAL relat_comp
	| eq_comp NOT_EQUAL relat_comp

	relat_comp : add_expr
	| relat_comp LESSTHAN add_expr
	|	relat_comp GREATERTHAN add_expr
	|	relat_comp LTE add_expr
	| relat_comp GTE add_expr

add_expr :
	mult_expr
	|add_expr PLUS mult_expr
	|add_expr MINUS mult_expr ;

mult_expr :
	prim_expr
	|mult_expr MULTIPLICATION prim_expr
	|mult_expr DIVISION prim_expr
	|mult_expr MOD prim_expr ;

prim_expr :
	IDENTIFIER
	| types
	| LP logic_expr RP
	| func_call
	| input_stmt
;

variable :
	types ;


%%

#include "lex.yy.c"
	void yyerror(char *s) { printf("%s on line %d\n", s, yylineno); }

int main()
	{
	return	yyparse();
}
