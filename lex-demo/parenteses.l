%{
#include<stdio.h>

%}

%%

[}] {
	printf("abre\n");
}

[}] { printf("fecha\n");}

%%

int main()
{
	yylex();
	return 0;
}
