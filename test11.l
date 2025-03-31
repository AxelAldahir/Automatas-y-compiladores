%option noyywrap
%{
	#include<stdio.h>
%}

%%
"//".*                { printf("Comentario de linea: %s\n", yytext); }
"/""*"([^*]|("*"+[^*/]))*"*"+"/"  { printf("Comentario multilinea: %s\n", yytext); }
printf\(.*\)          { printf("Texto en pantalla: %s\n", yytext); }
[ \t]                 ; /* Ignorar espacios en blanco */
.                     { printf("%c", yytext[0]); }
\n                    { printf("\n"); }
%%

int main() {
    yylex();
    return 0;
}