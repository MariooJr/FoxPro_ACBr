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