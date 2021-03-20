%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yyerror(char *s);
extern int yylineno;

typedef struct sym_table_elem {
    char name[100];
    float value;
    struct sym_table_elem * next;
} sym_table_elem;

sym_table_elem *sym_table = NULL;

sym_table_elem * get_val(char *name) {
    if (sym_table == NULL) {
        return NULL;
    } else {
        sym_table_elem * runner = sym_table;
        while (runner != NULL) {
            if (runner == NULL) {
                break;
            }
            if (strcmp(runner->name, name) == 0) {
                return runner;
            }
            runner = runner->next;
        }
    }
    return NULL;        
}

void put_val(char *name, float val) {
    sym_table_elem * new_node = malloc(sizeof(sym_table_elem));
    strcpy(new_node->name, name);
    new_node->value = val;
    new_node->next = NULL;
    if (get_val(name) == NULL) {
        if (sym_table == NULL) {
            sym_table = new_node;
        } else {
            sym_table_elem * runner = sym_table;
            while (runner != NULL) {
                if (runner->next == NULL) {
                    runner->next = new_node;
                    break;
                }
                runner = runner->next;
            }
        }
    } else {
        sym_table_elem * runner = sym_table;
        while (runner != NULL) {
            if (runner == NULL) {
                break;
            }
            if (strcmp(runner->name, name) == 0) {
                runner->value = val;
                break;
            }
            runner = runner->next;
        }
    }
}

void print_table() {
    sym_table_elem * runner = sym_table;
    while (runner != NULL) {
        if (runner == NULL) {
            break;
        }
        printf("%s\t%f\n", runner->name, runner->value);
        runner = runner->next;
    }
}

%}

%token TOK_SEMICOLON TOK_ADD TOK_MUL TOK_FLOAT TOK_PRINTLN TOK_VAR TOK_ID TOK_COMMA TOK_EQUAL

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
			fprintf(stdout, "%f\n", $2);
		}
       /*| TOK_PRINTLN TOK_ID TOK_SEMICOLON
        {
            sym_table_elem * ret_val = get_val($2);
            if (ret_val != NULL) {
                fprintf(stdout, "%f\n", ret_val->value);
            }
        }*/
       | TOK_VAR ids TOK_SEMICOLON
        {
        }
       | TOK_ID TOK_EQUAL expr TOK_SEMICOLON
        {
            if (get_val($1) != NULL) {
                put_val($1, $3);
            } else {
                yyerror("");
                return 0;
            }
        }
;

ids:
    TOK_ID
    {
        //fprintf(stdout, "the variable's name is %s\n", $1);
        //insert into symbol table
        if (get_val($1) == NULL) {
            put_val($1, 0.0);
        }
    }
    | ids TOK_COMMA ids
    {
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
	| TOK_ID
      {
        if (get_val($1) != NULL) {
            $$ = get_val($1)->value;
        } else {
            yyerror("");
            return 0;
        }
      }
    | TOK_FLOAT
	  { 	
		$$ = $1;
	  }
;


%%

int yyerror(char *s)
{
	printf("Parsing error: line %d\n", yylineno);
	return 0;
}

int main()
{
   yyparse();
   return 0;
}
