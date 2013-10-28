/* Beginning of Declarations part */

%{      /* Beginning of C declarations */

#include<stdio.h>
int pos = 0;

%}      /* End of C declarations */

	/* Beginning of YACC declarations  */

%token DIGIT 

	/* End of YACC declarations */
	
/* End of Declarations Part */


%%	

/* Rules Section begins here */

start: expr '\n'	{exit(1);} 
	; 

expr:  	expr '+' expr	{printf("+ ");} 
	| expr '*' expr	{printf("* ");} 
	| '(' expr ')'	 
	| DIGIT		{printf("NUM%d ",pos);} 
	; 

/* Rules Section ends here */

%% 	
	
/* Beginning of Auxiliary functions part */

yyerror() 
{ 
	printf("error"); 
} 

yylex() 
{ 
	int c; 
	c = getchar(); 
	if(isdigit(c)) 
	{
		pos++;
		return DIGIT;
	} 
	return c; 
}

main() 
{ 
	yyparse(); 
	return 1; 
}

/* End of Auxiliary functions*/

