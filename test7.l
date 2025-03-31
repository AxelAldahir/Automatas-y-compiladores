%option noyywrap
%{
	#include<stdio.h>
%}

%%
[A-Z]    { printf("%c", yytext[0] + ('a' - 'A')); }  
.        { printf("%c", yytext[0]); }                
\n       { printf("\n"); }
%%

int main() {
    yylex();
    return 0;
}
