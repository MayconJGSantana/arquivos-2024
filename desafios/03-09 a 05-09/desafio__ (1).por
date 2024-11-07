programa
{
        funcao inicio()
        {
		inteiro numero
		inteiro soma
		escreva("Digite o primeiro número: ")
		leia(numero)
		soma = numero
		enquanto (numero != 0) {
			escreva("Digite o próximo número: ")
			leia(numero)
			soma += numero
                }
		escreva("A soma de todos os números é ", soma)
        }
}
