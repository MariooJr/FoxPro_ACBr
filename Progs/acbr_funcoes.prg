FUNCTION ConfigurarDll
PARAMETERS cPathDll

	ACBrBoleto32 = cPathDll
	DECLARE INTEGER Boleto_Inicializar           IN &ACBrBoleto32 STRING arqConfig, STRING chaveCrypt
	DECLARE INTEGER Boleto_Finalizar             IN &ACBrBoleto32
	DECLARE INTEGER Boleto_Nome                  IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
	DECLARE INTEGER Boleto_Versao                IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
	DECLARE INTEGER Boleto_UltimoRetorno         IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
	DECLARE INTEGER Boleto_ConfigLer             IN &ACBrBoleto32 STRING arqConfig
	DECLARE INTEGER Boleto_ConfigGravar          IN &ACBrBoleto32 STRING arqConfig
	DECLARE INTEGER Boleto_ConfigLerValor        IN &ACBrBoleto32 STRING Sessao, STRING Chave, STRING @Valor, INTEGER @Tamanho
	DECLARE INTEGER Boleto_ConfigGravarValor     IN &ACBrBoleto32 STRING  @eSessao, STRING @eChave, STRING @eValor
	DECLARE INTEGER Boleto_ConfigurarDados       IN &ACBrBoleto32 STRING eArquivoIni
	DECLARE INTEGER Boleto_IncluirTitulos        IN &ACBrBoleto32 STRING eArquivoIni, STRING eTpSaida
	DECLARE INTEGER Boleto_LimparLista           IN &ACBrBoleto32
	DECLARE INTEGER Boleto_TotalTitulosLista     IN &ACBrBoleto32
	DECLARE INTEGER Boleto_Imprimir              IN &ACBrBoleto32 STRING eNomeImpressora
	DECLARE INTEGER Boleto_ImprimirBoleto        IN &ACBrBoleto32 INTEGER eIndice, STRING eNomeImpressora
	DECLARE INTEGER Boleto_GerarPDF              IN &ACBrBoleto32
	DECLARE INTEGER Boleto_GerarHTML             IN &ACBrBoleto32
	DECLARE INTEGER Boleto_GerarRemessa          IN &ACBrBoleto32 STRING eDir, INTEGER eNumArquivo, STRING eNomeArq
	DECLARE INTEGER Boleto_LerRetorno            IN &ACBrBoleto32 STRING eDir, STRING eNomeArq
	DECLARE STRING  Boleto_ObterRetorno          IN &ACBrBoleto32 STRING eDir, STRING eNomeArq, STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_EnviarEmail           IN &ACBrBoleto32 STRING ePara, STRING eAssunto, STRING eMensagem, STRING eCC
	DECLARE INTEGER Boleto_EnviarEmailBoleto     IN &ACBrBoleto32 INTEGER eIndice, STRING ePara, STRING eAssunto, STRING eMensagem, STRING eCC
	DECLARE INTEGER Boleto_SetDiretorioArquivo   IN &ACBrBoleto32 STRING eDir, STRING eArq
	DECLARE INTEGER Boleto_ListaBancos           IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_ListaCaractTitulo     IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_ListaOcorrencias      IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_ListaOcorrenciasEX    IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_TamNossoNumero        IN &ACBrBoleto32 STRING eCarteira, STRING enossoNumero, STRING eConvenio
	DECLARE INTEGER Boleto_CodigosMoraAceitos    IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_SelecionaBanco        IN &ACBrBoleto32 STRING eCodBanco
	DECLARE INTEGER Boleto_MontarNossoNumero     IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_RetornaLinhaDigitavel IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_RetornaCodigoBarras   IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_EnviarBoleto          IN &ACBrBoleto32 INTEGER eCodigoOperacao, STRING @sResposta, INTEGER @esTamanho
	DECLARE INTEGER Boleto_ConfigImportar        IN &ACBrBoleto32 STRING arqConfig
	DECLARE INTEGER Boleto_ConfigExportar        IN &ACBrBoleto32 STRING Mensagem, INTEGER tamanho
	DECLARE INTEGER Boleto_GerarPDFBoleto        IN &ACBrBoleto32 INTEGER eIndice
ENDFUNC 

FUNCTION UltimoRetorno
   ultRet = SPACE(244)
   Boleto_UltimoRetorno(@ultRet, 244)
   RETURN ALLTRIM(ultRet)
ENDFUNC 

FUNCTION banco_acbr
PARAMETERS banco

DO CASE 
   CASE banco == "001"
      RETURN "1"
      
   CASE banco == "033"
      RETURN "2"
      
   CASE banco == "104"
      RETURN "3"
      
   CASE banco == "237"
      RETURN "5"
      
   CASE banco == "341"
      RETURN "6"
      
   CASE banco == "389"
      RETURN "7"
      
   CASE banco == "748"
      RETURN "8"
      
   CASE banco == "756"
      RETURN "9"
      
   CASE banco == "001"
      RETURN "041"
      
   OTHERWISE 
      RETURN ""
ENDCASE 

ENDFUNC

FUNCTION nome_ocorrencia
LPARAMETERS cCodigo

*!*	01 = Boleto não existe
*!*	02 = Entrada boleto Confirmada
*!*	03 = Entrada boleto Rejeitada
*!*	Layout de Cobrança 400 posições – Padrão Santander
*!*	29
*!*	CNAB 400 BC 353 H7800 V 2.30 Fevereiro/2023
*!*	04 = Transferência para carteira Simples
*!*	05 = Transferência para Carteira Penhor/Desconto/Cessão
*!*	06 = Liquidação
*!*	07 = Liquidação por Conta
*!*	08 = Liquidação por Saldo
*!*	09 = Baixa Automática
*!*	10 = Boleto Baixado Conforme Instrução
*!*	11 = Boletos em carteira (em ser)
*!*	12 = Abatimento Concedido
*!*	13 = Abatimento Cancelado
*!*	14 = Alteração de Vencimento
*!*	15 = Confirmação de Protesto*
*!*	16 = Boleto Baixado/Liquidado
*!*	17 = Liquidado em Cartório
*!*	21 = Boleto Enviado a Cartório
*!*	22 = Boleto Retirado do Cartório
*!*	24 = Custas de Cartório
*!*	25 = Boleto Protestado
*!*	26 = Sustar Protesto*
*!*	27 = Cancelar Boleto Protestado
*!*	35 = Boleto DDA Reconhecido pelo Pagador
*!*	36 = Boleto DDA Não Reconhecido pelo Pagador
*!*	37 = Boleto DDA Recusado pela CIP
*!*	38 = Não Protestar (antes de iniciar o ciclo de
*!*	protesto)
*!*	39 = Espécie de Boleto não permite a instrução
*!*	61= Confirmação de Alteração do Valor Nominal do
*!*	Boleto
*!*	62 = Confirmação de Alteração do Valor ou
*!*	Percentual mínimo
*!*	63 = Confirmação de Alteração do Valor ou
*!*	Percentual máximo
*!*	93 = Baixa Operacional Enviado pela CIP
*!*	94 = Cancelamento da Baixa Operacional Enviado pela Cip


DO case
   CASE cCodigo == "01"
      RETURN "Boleto não existe"
   
   CASE cCodigo == "02"
      RETURN "Entrada boleto Confirmada"
   
   CASE cCodigo == "03" 
      RETURN "Entrada boleto Rejeitada"

ENDCASE 

ENDFUNC  