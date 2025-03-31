%option noyywrap
%{
	#include<stdio.h>
%}


%%
(analizar|comparar|distinguir|examinar|clasificar)      { printf("Verbo analizar: %s\n", yytext); }
(bello|hermoso|bueno|genial|amable|sabio)               { printf("Adjetivo positivo: %s\n", yytext); }
(y|e|ni|o|u|pero|aunque|sin_embargo)                    { printf("Conjuncion: %s\n", yytext); }
(en|de|a|con|sin|por|para|sobre|tras)                   { printf("Preposición: %s\n", yytext); }
(yo|tú|él|ella|nosotros|vosotros|ellos|ellas|usted)     { printf("Pronombre: %s\n", yytext); }
.        { printf("%c", yytext[0]); }
\n       { printf("\n"); }
%%

int main() {
    yylex();
    return 0;
}