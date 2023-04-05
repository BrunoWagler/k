#include <stdio.h>
#include <stdlib.h>

typedef struct parte2 //tipo de arvorev,tamanho portev,o anov,nome da pessoav;
{	
	int numerocadastro;
	char nomedapessoa[20];
	char tipoarvore[20];
	char tamanho[20];
	int ano;
}setores2;

typedef struct parte1  //formato setorv,tamanho(largura,e alturav) numerov
{
	char formadosetor[20];
	float largura;
	float altura;
	int numero;
	int numerodosetor;
	setores2 pt2[10];
}setores;


void menu();
void cadastrarsetor(setores *s);
void vercadastrosetor(setores s[10], int SETOR);
void cadastroarvore(setores2 pt2[10],int numerodosetor);
void listararvore(setores2 pt2[10],int numerodosetor);
int comparartudo(setores s[10],int SETOR,int localizarnumero);


int main(int argc, char const *argv[])
{
	int comando,SETOR=0,localizarnumero,i;
	setores s[10];
	
	
	
	do{
	menu();
	scanf("%i",&comando);
	
		switch(comando)
		{
			case 1:
				if(SETOR<10)
				{
				cadastrarsetor(&(s[SETOR]));
				s[SETOR].numerodosetor=0;
				SETOR++;
				}
			else
			{
				printf("Limite de 10 ultrapassado!\n");
				break;
				
			}	
			
		   case 2:
		   	{	
		  		
			   vercadastrosetor(s,SETOR);	
			   break;		
		    }
		    case 3:
		    	{
		    		printf("Digite o numero do setor:\n");
		    		scanf("%i",&localizarnumero);
		    		i=comparartudo(s,SETOR,localizarnumero);
		    		if(i>=0)
		    		{
		    			cadastroarvore(s[i].pt2,s[i].numerodosetor);
		    			s[i].numerodosetor++;
					}
		    		else
		    		{
		    			printf("Setor não encontrado\n");
					}
		    		break;
				}
			 
			 case 4:
			     {
			     	printf("Digite o numero do setor:\n");
			     	scanf("%i",&localizarnumero);
			     	i=comparartudo(s,SETOR,localizarnumero);
			     	if(i>=0)
			     	{
			     		listararvore(s[i].pt2,s[i].numerodosetor);
					}
					else
					{
						printf("Setor não encontrado\n");
					}
					break;
			 	
			 	
				 }	
		   	
		   	
	   }		
	
	}while(comando!=0);	
}

void menu()
{
	printf("\n--------------------IFMS-CORUMBA-------------------------------------\n");
	
	printf("Digite 1 para cadastrar setor e os componentes>\n");
	printf("Digite 2 para ver a lista de setor e componentes>\n");
	printf("Digite 3 para cadastrar o tipo de arvore,ano,pessoa>\n");
	printf("Digite 4 para ver a lista do de cima>\n");
	
	printf("Digite 0 para sair do cadastro>\n");
	
	
	
	printf("\n---------------------------------------------------------\n");	

}

void cadastrarsetor(setores *s)
{
	printf("Digite o formato do setor:\n");
	scanf("%s",(*s).formadosetor);
	printf("Digite a largura:\n");
	scanf("%f",&(*s).largura);
	printf("Digite a altura:\n");
	scanf("%f",&(*s).altura);
	printf("Digite o numero do setor:\n");
	scanf("%i",&(*s).numero);	
}

void vercadastrosetor(setores s[10], int SETOR)
{
	int i;
	
	
  for(i=0;i<SETOR;i++)
   {
  
	printf("----------------------------\n");
	
	printf("Formato do setor:%s\n",s[i].formadosetor);
	printf("Largura:%1.f\n",s[i].largura);
	printf("Altura:%1.f\n",s[i].altura);
	printf("Numero:%i\n",s[i].numero);
   }		  
}

void cadastroarvore(setores2 pt2[10],int numerodosetor)
{
	printf("----------------------------------");
	

	printf("Digite o nome da pessoa que plantou:\n");
	scanf(" %s",pt2[numerodosetor].nomedapessoa);
	printf("Digite o tipo de arvore que foi plantada:\n");
	scanf(" %s",pt2[numerodosetor].tipoarvore);
	printf("Digite o tamanho da arvore:\n");
	scanf(" %s",pt2[numerodosetor].tamanho);
	printf("Digite o ano que foi plantada:\n");
	scanf(" %i",&pt2[numerodosetor].ano);
	
}

void listararvore(setores2 pt2[10],int numerodosetor)
{
	int i;
	
	for(i=0;i<numerodosetor;i++)
		{
	
	printf("-----------------------------------\n");
	

	printf("Nome da pessoa que plantou:%s\n",pt2[i].nomedapessoa);
	printf("Tipo de arvore:%s\n",pt2[i].tipoarvore);
	printf("Tamanho:%s\n",pt2[i].tamanho);
	printf("Ano de plantio:%i\n",pt2[i].ano);
		}
}

int comparartudo(setores s[10],int SETOR,int localizarnumero)
{
	int i;
	
	for(i=0;i < SETOR;i++)
	{
		if(s[i].numero==localizarnumero)
		{
			return i;
		}
	}
	return -1;
}
