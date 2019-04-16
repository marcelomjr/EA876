%{

/*
   As secoes do codigo-fonte sao divididas por %%, da seguinte forma:

   SECAO 1 - DEFINICOES
   %%
   SECAO 2 - REGRAS
   %%
   SECAO 3 - SUBROTINAS

   */

  /* Os delimitadores %{ e %} separam codigo C na secao de definicoes */

#include <stdio.h>
#include <string.h>

float soma = 0;

/* Criteiros de desempate:
   1 - Maior match
   2 - Regra que vem antes */
%}


LETRA   [a-zA-Z]
DIGITO  [0-9]

PALAVRA  {LETRA}+
INTEIRO  {DIGITO}+

%%


{INTEIRO} { 
	printf("Inteiro! %d\n", atoi(yytext));
	soma += atoi(yytext);

}

{INTEIRO}+\.{INTEIRO}+ {
	printf("Ponto flutuante: [%s]\n", yytext);
	soma += atof(yytext);
}

-{INTEIRO} { printf("Inteiro negativo %d\n", atoi(yytext)); }

[a-zA-Z]+ { printf("Encontrei a palavra %s\n", yytext); } /* yytext e o texto que
                                                           deu match na
                                                           expressao regular */

[[:space:]]+ {
// Match with space, tab, new line
//	printf("error with space: [%s]\n", yytext);
}

[[:^space:]]+ {
	printf("error with no space: [%s]\n", yytext);
}

[\n]* ;

%{
/*
[.]* {printf("whatever with []: [%s]\n", yytext);}
.+ {printf("whatever: [%s]\n", yytext);}

*/
%}

%%

int main() {
  yylex();

  printf("Soma: %f\n", soma);

  return 0;
}
