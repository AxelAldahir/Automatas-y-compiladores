%option noyywrap
%{
	#include<stdio.h>
%}

%%
(int|float|char|double|void) {
    printf("Tipo de dato: %s\n", yytext);
}
(auto|break|case|const|continue|default|do|else|enum|extern|for|goto|if|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|volatile|while) { 
    printf("Palabra reservada: %s\n", yytext); 
}
[a-zA-Z_][a-zA-Z0-9_]* { 
    printf("Variable: %s\n", yytext); 
}

.        { printf("%c", yytext[0]); }
\n       { printf("\n"); }
%%

int main() {
    yylex();
    return 0;
}