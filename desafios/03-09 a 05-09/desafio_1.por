programa
{
	
	funcao inicio()
	{
		inteiro elefantes = 1
		inteiro i
		enquanto (elefantes <= 100) {
			se (elefantes % 2 == 1) {
				escreva(elefantes, " incomodam muita gente\n")
			}
			senao {
				escreva(elefantes)
				para (i = 0; i < elefantes; i++) {
					escreva(" incomodam")
				}
				escreva(" muito mais\n")
			}
			elefantes++
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 245; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */