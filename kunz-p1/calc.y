%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Basic outline from: https://www.gnu.org/software/bison/manual/bison.html#Multi_002dfunction-Calc

typedef struct sym_table_elem {
    char * name;
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
    new_node->name = name;
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

void print_list() {
    printf("uwu\n");
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
			fprintf(stdout, "the value is %f\n", $2);
		}
       | TOK_PRINTLN TOK_ID TOK_SEMICOLON
        {
            //fprintf(stdout, "yeet\n");
            sym_table_elem * ret_val = get_val($2);
            fprintf(stdout, "%f\n", ret_val->value);
        }
       | TOK_VAR ids TOK_SEMICOLON
        {
            //fprintf(stdout, "variable name = %s\n", $2);
        }
;

ids:
    TOK_ID
    {
        //fprintf(stdout, "the variable's name is %s\n", $1);
        //insert into symbol table
        put_val($1, 0.0);
    }
    | ids TOK_COMMA ids
    {
        //symbol table insert 0.0
        //$$ = $2;
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
