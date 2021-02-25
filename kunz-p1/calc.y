%{
#include <stdio.h>
%}

%token TOK_SEMICOLON TOK_ADD TOK_MUL TOK_FLOAT TOK_PRINTLN TOK_ID

%union{
        float float_val;
        char id[100];
}

/*%type <int_val> expr TOK_NUM*/
%type <float_val> expr TOK_FLOAT
%type <id> TOK_ID

%left TOK_ADD
%left TOK_MUL

%%

stmt: 
	| stmt expr_stmt
;

expr_stmt:
	   expr TOK_SEMICOLON
	   | TOK_PRINTLN expr TOK_SEMICOLON 
		{
			fprintf(stdout, "the value is %f\n", $2);
		} 
;

expr: 	 
	expr TOK_ADD expr
	  {
		$$ = $1 + $3;
	  }
	| expr TOK_MUL expr
	  {
		$$ = $1 * $3;
	  }
	| TOK_FLOAT
	  { 	
		$$ = $1;
	  }
;


%%

int yyerror(char *s)
{
	printf("syntax error\n");
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
