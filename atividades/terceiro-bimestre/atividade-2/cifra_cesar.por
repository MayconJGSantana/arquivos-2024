programa
{
	inclua biblioteca Texto
	inclua biblioteca Tipos
	inclua biblioteca Util
	inclua biblioteca Matematica
	
	funcao inicio()
	{
		/* Exemplos:
		 *  Palavra original: BRASILSIL
		 *  Chave = 3
		 *  Palavra criptografada: eudvlovlo
		 *  
		 *  Palavra criptografada: Lo uvpz xbl cvh iybehv
		 *  Chave = 7
		 *  Palavra original: Eh nois que voa bruxao
		 *  
		 *  1 - S UYI QI TVISGYTE RES S KVMXS HSW QEYW I S WMPIRGMS HSW FSRW
		 *  
		 *  2 - DVJ YNBBXJ ZDN WDWLJ LXVNCND DV NAAX WDWLJ CNWCXD JUPX WXEX
		 *  
		 *  3 - E MQEKMREGES I QEMW MQTSVXERXI UYI S GSRLIGMQIRXS
		 *  
		 *  4 - MFD VZJ JSIZWJHJW UJWT XNS UJWIJW QFYJWSZWF OFRFX
		 *  
		 *  5 - VH YRFH QDR FRQVHJXH VHU IHOLC FRP SRXFDV FRLVDV, QDR FRQVHJXLUD VHU IHOLC FRP PXLWD FRLVDV
		 *  
		 *  6 - BJX JB WXBBJB NBLXUQJB, VJRB MX ZDN JB WXBBJB LJYJLRMJMNB, ZDN VXBCAJV ZDNV ANJUVNWCN BXVXB
		 *  
		 *  7 - EDSTGPD RDGIPG IDSPH PH UADGTH BPH CPD EDSTGPD STITG P EGXBPKTGP
		 *  
		 *  8 - OAY SDMZPQE BAPQDQE HQY SDMZPQE DQEBAZEMNUXUPMPQE
		 *  
		 *  9 - CKS AEO O CEK DKPPKBOV
		 *  
		 *  10 - JHKH ZLNBUKV L ALTWV KL TBKHY ABKV WYH ZLTWYL.
		 *  
		 *  11 - PBZCHGNQBERF FNB VAHGRVF, RYRF NCRANF QNB ERFCBFGNF
		 *  
		 *  12 - KCQ TYISKIIQE FHEBEDWQTQ IYWDYVYSQ GKU QCRQI QI FQHJUI UIJQE UHHQTQI
		 *  
		 *  13 - RGTFGT VGORQ GO CRTGPFGT EQKUCU SWG PCQ KPVGTGUUCO, RTKXC-PQU FG FGUEQDTKT EQKUCU KPVGTGUUCPVGU
		 *  
		 *  14 - XBLT WLUZH WVBJV, LYYH TBPAV
		 *  
		 *  15 - OHRBUH THAHAH
		 */
		 
		faz_atividade()
	}

	funcao inteiro numero_letra(caracter letra) {
		caracter alfabeto[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
		caracter ALFABETO[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
		logico achou_letra = falso
		inteiro indice_letra
		inteiro numero = 0

		para (indice_letra = 0; indice_letra < 26; indice_letra++) {
			se (letra == alfabeto[indice_letra]) {
				achou_letra = verdadeiro
				numero = indice_letra + 1
				pare
			}
		}

		se (nao achou_letra) {
			para (indice_letra = 0; indice_letra < 26; indice_letra++) {
				se (letra == ALFABETO[indice_letra]) {
					numero = indice_letra + 1 + 100
					pare
				}
			}
		}

		retorne numero
	}

	funcao cadeia codifica_frase(inteiro chave, cadeia texto_original) {
		cadeia texto_criptografado
		inteiro indice_caracter
		caracter caracter_atual
		inteiro posicao_letra
		
		texto_criptografado = ""
		para (indice_caracter = 0; indice_caracter < Texto.numero_caracteres(texto_original); indice_caracter++) {
			caracter_atual = Texto.obter_caracter(texto_original, indice_caracter)	
			posicao_letra = numero_letra(caracter_atual)
			se (posicao_letra == 0) {
				texto_criptografado += caracter_atual
			}
			senao {
				texto_criptografado += codificar_caracter(chave, posicao_letra)
			}
		}

		retorne texto_criptografado
	}

	funcao cadeia decodifica_frase(inteiro chave, cadeia texto_criptografado) {
		inteiro indice_caracter
		caracter caracter_atual
		cadeia texto_original
		inteiro posicao_letra
		
		texto_original = ""
		para (indice_caracter = 0; indice_caracter < Texto.numero_caracteres(texto_criptografado); indice_caracter++) {
			caracter_atual = Texto.obter_caracter(texto_criptografado, indice_caracter)
			posicao_letra = numero_letra(caracter_atual)
			se (posicao_letra == 0) {
				texto_original += caracter_atual
			}
			senao {
				texto_original += decodificar_caracter(chave, posicao_letra)
			}
		}

		retorne texto_original
	}

	funcao vazio descobre_decodificacao(cadeia texto_criptografado) {
		caracter caracter_atual
		cadeia texto_original = ""
		inteiro posicao_letra
		inteiro chave
		inteiro indice_caracter
		
		para (chave = 1; chave < 27; chave++) {
			texto_original = decodifica_frase(chave, texto_criptografado)
			
			escreva(chave, " - ", texto_original)
			se (chave != 26) {
				pula_linha()
				pula_linha()
			}
		}
	}

	funcao inteiro parte_menu(cadeia opcao_menu[]) {
		inteiro opcao_escolhida
		
		cabecalho(50, "Cifra de Cesar")
		
		faz_menu(opcao_menu)

		aguarda(1000)
		pula_linha()

		opcao_escolhida = escolha_opcao(opcao_menu)

		retorne opcao_escolhida
	}

	funcao vazio parte_descobrir_decodificacao() {
		cadeia texto_criptografado

		pergunta("Entre com o texto que queres decodificar")
		leia(texto_criptografado)

		aguarda(1000)
		pula_linha()
		
		descobre_decodificacao(texto_criptografado)
	}

	funcao vazio parte_decodificar_frase() {
		cadeia texto_criptografado
		cadeia texto_original
		inteiro chave

		pergunta("Entre com o texto criptografado")
		leia(texto_criptografado)
		chave = entra_chave()
		
		texto_original = decodifica_frase(chave, texto_criptografado)
		
		aguarda(2000)
		pula_linha()

		escreva(texto_original)
	}

	funcao vazio parte_codificar_frase() {
		cadeia texto_original
		cadeia texto_criptografado
		inteiro chave

		pergunta("Entre com o texto original")
		leia(texto_original)
		chave = entra_chave()
		
		texto_criptografado = codifica_frase(chave, texto_original)
		
		aguarda(2000)
		pula_linha()

		escreva(texto_criptografado)
	}

	funcao inteiro entra_chave() {
		inteiro chave

		faca {
			pergunta("Entre com a chave que queres usar")
			leia(chave)
		} enquanto (nao (chave > 0 e chave <= 26))

		retorne chave
	}

	funcao vazio faz_atividade() {
		inteiro alternativa_escolhida
		cadeia opcao_menu[] = {"Codificar", "Decodificar", "Descobrir decodificação"}
		
		alternativa_escolhida = parte_menu(opcao_menu)

		aguarda(2000)

		limpa()
		
		consequencia_alternativas(alternativa_escolhida, opcao_menu)
	}

	funcao vazio consequencia_alternativas(inteiro atividade_escolhida, cadeia opcao_menu[]) {
		cabecalho(50, opcao_menu[atividade_escolhida - 1])
		
		escolha (atividade_escolhida) {
			caso 1:
				parte_codificar_frase()
				pare
			caso 2:
				parte_decodificar_frase()
				pare
			caso 3:
				parte_descobrir_decodificacao()
				pare
		}

		pula_linha()
		aguarda(2000)
		pula_linha()

		faca {
			se (responda("Desejas voltar para o menu")) {
				limpa()
				faz_atividade()
				pare
			}
		} enquanto (verdadeiro)
	}


	// Codifica apenas um caracter
	funcao caracter codificar_caracter(inteiro chave, inteiro letra) {
		caracter alfabeto[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
		caracter ALFABETO[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
		caracter caracter_letra
		inteiro posicao_original_letra
		inteiro posicao_criptografada_letra

		se (letra > 100) {
			posicao_original_letra = (letra % 100) - 1
			posicao_criptografada_letra = (posicao_original_letra + chave) % 26
			caracter_letra = ALFABETO[posicao_criptografada_letra]
		}
		senao {
			posicao_original_letra = letra - 1
			posicao_criptografada_letra = (posicao_original_letra + chave) % 26
			caracter_letra = alfabeto[posicao_criptografada_letra]
		}

		retorne caracter_letra
	}

	// Decodifica apenas um caracter
	funcao caracter decodificar_caracter(inteiro chave, inteiro letra) {
		caracter alfabeto[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'}
		caracter ALFABETO[] = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'}
		caracter caracter_letra
		inteiro posicao_original_letra
		inteiro posicao_criptografada_letra

		
		se (letra > 100) {
			posicao_original_letra = (letra % 100) - 1
			posicao_criptografada_letra = (posicao_original_letra - chave) % 26
			se (posicao_criptografada_letra < 0) {
				posicao_criptografada_letra += 26
			}
			caracter_letra = ALFABETO[posicao_criptografada_letra]
		}
		senao {
			posicao_original_letra = letra - 1
			posicao_criptografada_letra = (posicao_original_letra - chave) % 26
			se (posicao_criptografada_letra < 0) {
				posicao_criptografada_letra += 26
			}
			caracter_letra = alfabeto[posicao_criptografada_letra]
		}
		
		retorne caracter_letra
	}


	funcao vazio espacos(inteiro quantidade_espacos) {
		// vai ser escrito "=" quantidade_espacos vezes
		para (inteiro i = 0; i < quantidade_espacos; i++) {
			escreva("=")
		}
		
		pula_linha()
	}
	
	funcao vazio arredonda_para_cima(real &numero_real) {
		cadeia numero_cadeia = Tipos.real_para_cadeia(numero_real)
		inteiro posicao_ponto = Texto.posicao_texto(".", numero_cadeia, 0)
		caracter caracter_depois_ponto = Texto.obter_caracter(numero_cadeia, posicao_ponto + 1)
		
		se (caracter_depois_ponto != '0') {
			numero_real++
		}
	}
	
	funcao vazio cabecalho(inteiro quantidade_espacos, cadeia enunciado) {
		inteiro tamanho_enunciado = Texto.numero_caracteres(enunciado)
		real metade_tamanho_enunciado = tamanho_enunciado / 2.0

		arredonda_para_cima(metade_tamanho_enunciado)
		
		espacos(quantidade_espacos)

		// vai colocar espaço até que quando escrito o enunciado fique no meio
		escreva(Texto.preencher_a_esquerda(' ', quantidade_espacos / 2 + metade_tamanho_enunciado, enunciado))
		
		pula_linha()
		
		espacos(quantidade_espacos)
	}

	// Pula uma linha
	funcao vazio pula_linha() {
		escreva("\n")
	}

	// Faz uma pergunta ao usuário
	funcao vazio pergunta(cadeia enunciado) {
		escreva("-> ", enunciado, ": ")
	}

	// Aguarda um tempo e escreve "..." para dar mais imersão
	funcao vazio aguarda(inteiro tempo) {
		escreva("...")
		Util.aguarde(tempo)
	}

	funcao logico responda(cadeia enunciado) {
		cadeia deseja_continuar = ""
		logico resposta = falso
		
		enquanto (verdadeiro) {
			escreva("-> ", enunciado, " [sim/nao]? ")
			leia(deseja_continuar)
			deseja_continuar  = Texto.caixa_baixa(deseja_continuar)
	
			se (deseja_continuar == "sim") {
				resposta = verdadeiro
				pare
			}
			senao se (deseja_continuar == "nao" ou deseja_continuar == "não") {
				resposta = falso
				pare
			}
			senao {
				escreva("Valor inválido, tente novamente!")
				pula_linha()
			}
		}
		retorne resposta
	}

	// Faz um menu
	funcao vazio faz_menu(cadeia opcoes[]) {
		inteiro i
		inteiro posicao_humana
		
		para (i = 0; i < Util.numero_elementos(opcoes); i++) {
			posicao_humana = i + 1
			escreva("[ ", posicao_humana, " ]", " ", opcoes[i])
			pula_linha()
		}
	}

	// Recebe uma opção do menu
	funcao inteiro escolha_opcao(cadeia opcoes[]) {
		inteiro opcao = 0
		
		enquanto (verdadeiro) {
			escreva("-> Escolha uma opção: ")
			leia(opcao)
			se (opcao < 1 ou opcao > Util.numero_elementos(opcoes)) {
				escreva("Valor inválido, tente novamente!")
				pula_linha()
			}
			senao {
				pare
			}
		}
		retorne opcao
	}

}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8102; 
 * @DOBRAMENTO-CODIGO = [52, 79, 100, 139, 154, 166, 183, 200, 211, 254, 305, 314, 324, 341, 346, 351, 356, 382, 394];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
