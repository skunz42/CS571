%{
#include <stdio.h>
#include "calc.tab.h"

%}

digit	([0-9])

%%

"println"   {   return(TOK_PRINTLN);}

"var"       {   return(TOK_VAR); }

([a-z])([a-zA-Z0-9]*) { 
    sscanf(yytext, "%s", &yylval);
    return TOK_ID;
}

({digit}+[.]{digit}+)	{
		sscanf(yytext, "%f", &yylval);
		return TOK_FLOAT;
}

"," {   return(TOK_COMMA);  }
";"	{	return(TOK_SEMICOLON);	}
"+"	{	return(TOK_ADD);	}
"*"	{	return(TOK_MUL);	}
"=" {   return(TOK_EQUAL);  }

[ \s]   {}
[ \t]   {}
[ \n] 	{}

.	{
        printf("Lexical analysis error: %s\n", 
			yytext);
        //printf("Parsing error: line %d\n", yylineno);
	}

%%

