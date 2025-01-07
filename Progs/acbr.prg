DEFINE CLASS ACBr as Custom
   
   PROCEDURE init
      this.AddProperty("UltRetorno", "")
      this.AddProperty("CodRetorno", "")
      this.AddProperty("pasta_pdf" ,"")
      this.AddProperty("Titulos"   , 0)
      this.AddObject("Models","Model")
      
   ENDPROC 
   
   ***************************************************************************************
   ** Carrega a DLL com todos os seus metodos                                            *
   **                                                                                    *
   ** pathDll   => Caminho da DLL                                                        *
   ** pathLogs  => Pasta onde ficam salvos os logs de execução da DLL, não é obrigatório * 
   ** pathLogos => Pasta onde estão salvos os logos dos bancos                           *
   ***************************************************************************************
   PROCEDURE CarregarDll
   lPARAMETERS pathDll as String, pathIni as String, pathLogs as String, pathLogos as String
      IF !FILE(pathDll)
         MESSAGEBOX("DLL não encontrada",0+48,"Verifique o caminho informado")
      ENDIF 
      =ConfigurarDll(pathDll)
      
      ret = Boleto_Inicializar(pathIni,"")
      IF ret < 0 
         =UltimoRetorno()
         MESSAGEBOX("Erro ao inicializar DLL",0,"Erro")
         RETURN 0
      ENDIF 
      
      ?Boleto_ConfigGravarValor("BoletoBancoFCFortesConfig","DirLogo", pathLogos)
      ?Boleto_ConfigGravarValor("Principal","TipoResposta","0")
      ?Boleto_ConfigGravarValor("Principal","LogNivel","4")
      ?Boleto_ConfigGravarValor("Principal","LogPath", pathLogs)
      
   ENDPROC 
   
   PROCEDURE Limpar_Lista
      Boleto_LimparLista()
      this.Titulos = Boleto_TotalTitulosLista()
   ENDPROC 
   
   *******************************************************************************************
   ** Configura o Cedente para a emissão dos boletos                                         *
   **                                                                                        * 
   ** Cedente       => Objeto com os dados do Cedente                                        *
   ** ContaCorrente => Objeto com os dados da Conta Corrente, Banco e Carteira               *                    
   *******************************************************************************************  
   PROCEDURE Configurar_Cedente
   LPARAMETERS Cedente as Object, ContaCorrente as Object
   
   TEXT TO CedenteIni NOSHOW TEXTMERGE PRETEXT 7
   [Cedente] 
   Nome=<<Cedente.Nome>>
   CNPJCPF=<<Cedente.CNPJCPF>>
   Logradouro=<<Cedente.Logradouro>>
   Numero=<<Cedente.Numero>>
   Bairro=<<Cedente.Bairro>>
   Cidade=<<Cedente.Cidade>>
   CEP=<<Cedente.Cep>>
   Complemento=<<Cedente.Complemento>>
   UF=<<Cedente.UF>>
   TipoPessoa=<<Cedente.TipoInscricao>>
   RespEmis=<<ContaCorrente.ResponEmissao>>
   CodigoCedente=<<ContaCorrente.CodigoCedente>>
   LayoutBol=3
   CaracTitulo=<<ContaCorrente.CaracTitulo>>
   TipoCarteira=<<ContaCorrente.TipoCarteira>>
   TipoDocumento=<<ContaCorrente.TipoDocumento>>
   Modalidade=<<ContaCorrente.Modalidade>>
   CodTransmissao=<<ContaCorrente.CodigoTransmissao>>
   Convenio=<<ContaCorrente.Convenio>>
   PIX.TipoChavePix=
   PIX.Chave=

   [Conta]
   Conta=<<ContaCorrente.Conta>>
   DigitoConta=<<ContaCorrente.ContaDigito>>
   Agencia=<<ContaCorrente.Agencia>>
   DigitoAgencia=<<ContaCorrente.AgenciaDigito>>
   DigitoVerificadorAgenciaConta=<<ContaCorrente.DigitoVerificadorAgenciaConta>>

   [Banco]
   Numero=<<ContaCorrente.Banco>>
   CNAB=<<ContaCorrente.CNAB>>
   TipoCobranca=5
   NumeroCorrespondente=<<ContaCorrente.NumeroCorrespondente>>
   VersaoArquivo=<<ContaCorrente.VersaoArquivo>>
   VersaoLote=<<ContaCorrente.VersaoLote>>
  
   ENDTEXT 
   
   this.CodRetorno = BOLETO_ConfigurarDados(CedenteIni)
   this.UltRetorno = UltimoRetorno()
   
   ENDPROC 
   
   *******************************************************************************************
   ** Configura o Titulo a ser inserido na DLL                                        *
   **                                                                                        * 
   ** Cedente       => Objeto com os dados do Cedente                                        *
   ** ContaCorrente => Objeto com os dados da Conta Corrente, Banco e Carteira               *                    
   *******************************************************************************************  
   PROCEDURE AdicionarTitulo
   LPARAMETERS Sacado as Object, Avalista as Object, Titulo as Object
   SET POINT TO ","
   TEXT TO CedenteIni NOSHOW TEXTMERGE PRETEXT 7
    [Titulo1]
	NumeroDocumento=<<Titulo.NumeroDocumento>>
	NossoNumero=<<Titulo.NossoNumero>>
	NossoNumeroCorrespondente=

	Carteira=<<Titulo.Carteira>>
	ValorDocumento=<<Titulo.ValorDocumento
	Vencimento=<<Titulo.Vencimento>>
	DataDocumento=<<Titulo.DataDocumento>>
	DataProcessamento=<<Titulo.DataProcessamento>>
	DataAbatimento=
	DataDesconto=
	DataMoraJuros=<<Titulo.DataMoraJuros>>
	DiasDeProtesto=<<Titulo.DiasDeProtesto>>
	DiasDeNegativacao=<<Titulo.DiasDeNegativacao>>
	DataProtesto=<<Titulo.DataProtesto>>
	DataNegativacao=<<Titulo.DataNegativacao>>
	DataMulta=<<Titulo.DataMulta>>
	DataBaixa=
	ValorAbatimento=
	ValorDesconto=<<ALLTRIM(STR(Titulo.ValorDesconto,10,2))>>
	ValorMoraJuros=<<ALLTRIM(STR(Titulo.ValorMoraJuros,10,2))>>
	ValorIOF=
	ValorOutrasDespesas=
	MultaValorFixo=0
	PercentualMulta=
	LocalPagamento=Pagável em qualquer agência bancária mesmo após o vencimento
	Especie=<<Titulo.Especie>>
	EspecieMod=<<Titulo.EspecieMod>>
	DataLimitePagto=

	Sacado.NomeSacado=<<Sacado.Nome>>
	Sacado.CNPJCPF=<<Sacado.CNPJCPF>>
	Sacado.Pessoa=<<Sacado.Pessoa>>
	Sacado.Logradouro=<<Sacado.Logradouro>>
	Sacado.Numero=<<Sacado.Numero>>
	Sacado.Bairro=<<Sacado.Bairro>>
	Sacado.Complemento=<<Sacado.Complemento>>
	Sacado.Cidade=<<Sacado.Cidade>>
	Sacado.UF=<<Sacado.UF>>
	Sacado.CEP=<<Sacado.CEP>>
	Sacado.Email=
	
	Sacado.SacadoAvalista.Pessoa=
	Sacado.SacadoAvalista.NomeAvalista=
	Sacado.SacadoAvalista.CNPJCPF=  
	Sacado.SacadoAvalista.Logradouro=
	Sacado.SacadoAvalista.Numero=   
	Sacado.SacadoAvalista.Complemento=
	Sacado.SacadoAvalista.Bairro=      
	Sacado.SacadoAvalista.Cidade=     
	Sacado.SacadoAvalista.UF=        
	Sacado.SacadoAvalista.CEP=         
	Sacado.SacadoAvalista.Email=
	Sacado.SacadoAvalista.Fone=       
	Sacado.SacadoAvalista.InscricaoNr=

	Mensagem=<<Titulo.Mensagem1>>|<<Titulo.Mensagem2>>|<<Titulo.Mensagem3>>
	Informativo=
	Detalhamento=
	Competencia=
	ArquivoLogoEmp=
	Verso=False
	Instrucao1=<<Titulo.Instrucao1>>
	Instrucao2=<<Titulo.Instrucao2>>
	Instrucao3=<<Titulo.Instrucao3>>
	Aceite=<<Titulo.Aceite>>
	OcorrenciaOriginal.TipoOcorrencia=0
	Parcela=<<Titulo.Parcela>>
	TotalParcelas=<<Titulo.TotalParcelas>>
	SeuNumero=<<Titulo.SeuNumero>>
	
	TipoDiasProtesto=<<Titulo.TipoDiasProtesto>>
	CodigoNegativacao=<<Titulo.CodigoNegativacao>>
	TipoDiasNegativacao=<<Titulo.TipoDiasNegativacao>>
	TipoImpressao=<<Titulo.TipoImpressao>>
	CodigoMoraJuros=
	CodigoMora=<<Titulo.CodigoMora>>
	TipoDesconto=<<Titulo.TipoDesconto>>
	TipoDesconto2=<<Titulo.TipoDesconto2>>
	CarteiraEnvio=<<Titulo.CarteiraEnvio>>
   
   ENDTEXT 
   SET POINT TO "."
   ENDPROC 
ENDDEFINE
