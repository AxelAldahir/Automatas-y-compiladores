%option noyywrap
%{
	#include<stdio.h>
%}

%%
(usar|aplicar|demostrar|ejecutar|interpretar|implementar) { 
    printf("Verbo de aplicación: %s\n", yytext); 
}
.    { printf("%c", yytext[0]); }
\n   { printf("\n"); }
%%

int main() {
    yylex();
    return 0;
}