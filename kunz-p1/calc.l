%{
#include <stdio.h>
#include "calc.tab.h"
%}

digit	([0-9])

%%

"println"       {       return(TOK_PRINTLN);}


({digit}+[.]{digit}*)|({digit}*[.]{digit}+)	{
		sscanf(yytext, "%f", &yylval);
		return TOK_FLOAT;
		}

";"	{	return(TOK_SEMICOLON);	}

"+"	{	return(TOK_ADD);	}
"*"	{	return(TOK_MUL);	}

[ \n] 	{}

.	{printf("Invalid character '%c', ignored\n", 
			yytext[0]);
	}

%%

