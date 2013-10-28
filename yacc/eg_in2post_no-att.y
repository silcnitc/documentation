%{

#include <stdio.h>
int pos = 0;			/* Corresponds to the order of occurence of the number in the input expression */

%}

%token DIGIT 			

%% 

start: expr '\n'	{exit(1);} 
	; 

expr:  expr '+' expr	{printf("+ ");} 
	| expr '*' expr	{printf("* ");} 
	| '(' expr ')'	 
	| DIGIT		{printf("NUM%d ",pos);} 
	; 

%% 

yyerror() 
{ 
	printf("error");	/* Prints this message if the input does not meet the CFG specifications in the Rules */  
	return;
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
