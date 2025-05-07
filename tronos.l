%option noyywrap
%{
	#include<stdio.h>
	int cont_westeros = 1;
	int cont_invernalia = 1;
	int cont_desembarco = 1;
	int cont_desembarco_rey = 1;
	int cont_nido_aguilas = 1;
	int cont_altojardin = 1;
	int cont_aguasdulces = 1;
	int cont_rocadragon = 1;
	int cont_rocacasterly = 1;
	int cont_bastion_tormentas = 1;
	int cont_dorne = 1;

	int cont_stark = 1;
	int cont_arryn = 1;
	int cont_tully = 1;
	int cont_greyjoy = 1;
	int cont_lannister = 1;
	int cont_tyrell = 1;
	int cont_martell = 1;
	int cont_baratheon = 1;
	int cont_targaryen = 1;

	int eddard = 1;
	int catelyn = 1;
	int arya = 1;
	int sansa = 1;
	int robert = 1;
	int joffrey = 1;
	int stannis = 1;
	int aegon = 1;
	int daenerys = 1;
	int aerys = 1;
	int tywin = 1;
	int jaime = 1;
	int tyrion = 1;
	int cersei = 1;



%}
A[ÁAaá]
B[Bb]
C[Cc]
D[Dd]
E[EeéÉ]
F[Ff]
G[Gg]
H[Hh]
I[IiíÍ]
J[Jj]
K[Kk]
L[Ll]
M[Mm]
N[Nn]
O[OoóÓ]
P[Pp]
Q[Qq]
R[Rr]
S[Ss]
T[Tt]
U[UuúÚ]
V[Vv]
W[Ww]
X[Xx]
Y[Yy]
Z[Zz]
%%

{W}{E}{S}{T}{E}{R}{O}{S} {cont_westeros++; }
{I}{N}{V}{E}{R}{N}{A}{L}{I}{A} {cont_invernalia++;}
{D}{E}{S}{E}{M}{B}{A}{R}{C}{O}[ ]{D}{E}{L}[ ]{R}{E}{Y} {cont_desembarco_rey++;}
{N}{I}{D}{O}[ ]{D}{E}[ ]{A}{G}{U}{I}{L}{A}{S} {cont_nido_aguilas++;}
{A}{L}{T}{O}{J}{A}{R}{D}{I}{N} {cont_altojardin++;}
{A}{G}{U}{A}{S}{D}{U}{L}{C}{E}{S} {cont_aguasdulces++;}
{R}{O}{C}{A}[ ]{D}{R}{A}{G}{O}{N} {cont_rocadragon++;}
{R}{O}{C}{A}[ ]{C}{A}{S}{T}{E}{R}{L}{Y} {cont_rocacasterly++;}
{B}{A}{S}{T}{I}{O}{N}[ ]{D}{E}[ ]{T}{O}{R}{M}{E}{N}{T}{A}{S} {cont_bastion_tormentas++;}
{D}{O}{R}{N}{E} {cont_dorne++;}

{S}{T}{A}{R}{K} {cont_stark++;}
{A}{R}{R}{Y}{N} {cont_arryn++;}
{T}{U}{L}{L}{Y} {cont_tully++;}
{G}{R}{E}{Y}{J}{O}{Y} {cont_greyjoy++;}
{L}{A}{N}{N}{I}{S}{T}{E}{R} {cont_lannister++;}
{T}{Y}{R}{E}{L}{L} {cont_tyrell++;}
{M}{A}{R}{T}{E}{L}{L} {cont_martell++;}
{B}{A}{R}{A}{T}{H}{E}{O}{N} {cont_baratheon++;}
{T}{A}{R}{G}{A}{R}{Y}{E}{N} {cont_targaryen++;}



. {}
%%
int main()
{
	char nombre_archivo[100];

	strcpy(nombre_archivo, "tronos.txt");

	FILE *archivo = fopen(nombre_archivo, "r");  // Abrir el archivo
	   if (!archivo) {
		perror("Error al abrir el archivo");
		return 1;
	}

	yyin = archivo;  // Asigna el archivo de entrada
	yylex();         // Llama al analizador léxico
	fclose(archivo);


	printf("Recuento de veces encontradas ( Western ): %d\n", cont_westeros);
	printf("Recuento de veces encontradas ( Invernalia ): %d\n", cont_invernalia);
	printf("Recuento de veces encontradas ( Desembarco del Rey ): %d\n", cont_desembarco_rey);
	printf("Recuento de veces encontradas ( Nido del aguila ): %d\n", cont_nido_aguilas);
	printf("Recuento de veces encontradas ( Altojarín ): %d\n", cont_altojardin);
	printf("Recuento de veces encontradas ( Aguasdulces ): %d\n", cont_aguasdulces);
	printf("Recuento de veces encontradas ( Roca Dragon ): %d\n", cont_rocadragon);
	printf("Recuento de veces encontradas ( Roca casterly ): %d\n", cont_rocacasterly);
	printf("Recuento de veces encontradas ( Bastión de Tormentas ): %d\n", cont_bastion_tormentas);
	printf("Recuento de veces encontradas ( Dorne ): %d\n", cont_dorne);
	
	

	printf("Recuento de veces encontradas ( Stark ): %d\n", cont_stark);
	printf("Recuento de veces encontradas ( Arryn ): %d\n", cont_arryn);
	printf("Recuento de veces encontradas ( Tully ): %d\n", cont_tully);
	printf("Recuento de veces encontradas ( Greyjoy ): %d\n", cont_greyjoy);
	printf("Recuento de veces encontradas ( Lannister ): %d\n", cont_lannister);
	printf("Recuento de veces encontradas ( Tyrell ): %d\n", cont_tyrell);
	printf("Recuento de veces encontradas ( Martell ): %d\n", cont_martell);
	printf("Recuento de veces encontradas ( Baratheon ): %d\n", cont_baratheon);
	printf("Recuento de veces encontradas ( Targaryen ): %d\n", cont_targaryen);



	   
	return 0;
}
