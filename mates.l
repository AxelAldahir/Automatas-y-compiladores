%option noyywrap
%{
	#include<stdio.h>
	#include<ctype.h>
	int contadorl = 0;
	int contadorp = 0;
	int contadorc = 0;
	int contadorni = 0;
	int contadornum = 0;
	int contadorbto = 0;
	int contadorjo = 0;
	int contadordig = 0;
	
%}

%%
\n {contadorl++; contadorc++; }
[[:alnum:]]+ {
contadorp++; contadorc += yyleng; 
if (strncmp(yytext, "ni", 2) == 0) contadorni++;
if (strncmp(yytext, "num", 3) == 0 || strncmp(yytext, "núm", 4) == 0) { contadornum++; }

int len = strlen(yytext);
if (len >= 2 && yytext[0] == 'b' && yytext [len - 2] == 't' && yytext[len - 1] == 'o') contadorbto++;
if (len >= 2 && strcmp(yytext + len - 2, "jo") == 0) {
    contadorjo++;
}
    int es_digito = 1;
    int i;
	for (i = 0; i < len; i++) {
        if (!isdigit(yytext[i])) {
            es_digito = 0;
            break;
        }
    }
    if (es_digito) contadordig++;

}
[\t]+ {contadorc += yyleng;}
. {contadorc++; }
%%
int main(int argc, char ** argv) {
	printf("Conteos\n");

    if (argc != 2) {
        printf("Uso: %s <archivo>\n", argv[0]);
        return 1;
    }
    
    FILE *f = fopen(argv[1], "r");
    if (f == NULL) {
        perror("Error al abrir el archivo");
        return 1;
    }
    
    yyin = f;
    yylex(); 
    fclose(f);
    
    printf("Total de lineas: %d\n", contadorl);
    printf("Total de palabras: %d\n", contadorp);
    printf("Total de caracteres: %d\n", contadorc);
    printf("Palabras que inician con 'ni': %d\n", contadorni);
    printf("Palabras que inician con 'num': %d\n", contadornum);
    printf("Palabras que inician con 'b' y terminan con 'to': %d\n", contadorbto);
    printf("Palabras que terminan con 'jo': %d\n", contadorjo);
    printf("Palabras que son solo digitos: %d\n", contadordig);
    return 0;
}