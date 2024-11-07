
programa
{
	
	funcao inicio()
	{
		inteiro numero = 1
		enquanto (numero <= 25) {
			se (numero % 2 == 1) {
				escreva(numero, "\n")
			}
			numero++
		}
		numero = 1
		enquanto (numero <= 25) {
			escreva(numero, "\n")
			numero += 2
		}
		numero = 25
		enquanto (numero > 0) {
			escreva(numero, "\n")
			numero += -2
		}
		numero = 25
		enquanto (numero > 0) {
			se (numero % 2 == 1){
				escreva(numero, "\n")
			}
			numero += -1
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 419; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
