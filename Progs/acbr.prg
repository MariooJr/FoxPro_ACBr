DEFINE CLASS ACBr as Custom
   
   PROCEDURE init
      this.AddProperty("UltRetorno", "")
      this.AddProperty("CodRetorno", "")
      this.AddProperty("pasta_pdf" ,"")
      this.AddProperty("Titulos"   , 0)
      this.AddProperty("ult_nossonumero","")
      this.AddProperty("Cedente","")
      
      this.AddObject("Models","Model")
      *this.AddObject("Cedente","Custom")
      
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
      
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Nome"          , Cedente.Nome)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "TipoInscricao" , Cedente.TipoInscricao)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "CNPJCPF"       , Cedente.CNPJCPF)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Cidade"        , Cedente.Cidade)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Logradouro"    , Cedente.Logradouro)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Bairro"        , Cedente.Bairro)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "NumeroRes"     , Cedente.Numero)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "UF"            , Cedente.UF)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "CEP"           , Cedente.Cep)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Telefone"      , Cedente.Telefone)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Complemento"   , Cedente.Complemento)


   Boleto_ConfigGravarValor("BoletoCedenteConfig", "ResponEmissao" , ContaCorrente.ResponEmissao)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "CaracTitulo"   , ContaCorrente.CaracTitulo)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "TipoCarteira"  , ContaCorrente.TipoCarteira)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "TipoDocumento" , ContaCorrente.TipoDocumento)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Modalidade"    , ContaCorrente.Modalidade)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "Convenio"      , ContaCorrente.Convenio)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "CodigoCedente" , ContaCorrente.CodigoCedente)
   Boleto_ConfigGravarValor("BoletoCedenteConfig", "CodigoTransmissao" , ContaCorrente.CodigoTransmissao)

   ** Dados da Conta Corrente **
   Boleto_ConfigGravarValor("BoletoCedenteConfig","Agencia"       , ContaCorrente.Agencia)
   Boleto_ConfigGravarValor("BoletoCedenteConfig","AgenciaDigito" , ContaCorrente.AgenciaDigito)
   Boleto_ConfigGravarValor("BoletoCedenteConfig","Conta"         , ContaCorrente.Conta)
   Boleto_ConfigGravarValor("BoletoCedenteConfig","ContaDigito"   , ContaCorrente.ContaDigito)
   
   Boleto_ConfigGravarValor("BoletoCedenteConfig","DigitoVerificadorAgenciaConta"   ,ContaCorrente.DigitoVerificadorAgenciaConta)
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","ImprimirMensagemPadrao","1")

   ** Dados do Banco **
   Boleto_ConfigGravarValor("BoletoBancoConfig","Numero",ContaCorrente.Banco)
   *Boleto_ConfigGravarValor("BoletoBancoConfig","CNAB","0") &&& -> 0 - CNAB240 | 1 - CNAB400
   Boleto_ConfigGravarValor("BoletoBancoConfig","TipoCobranca",ContaCorrente.TipoCobranca) &&Numero do Banco no ACBr
   
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
   TEXT TO TituloIni NOSHOW TEXTMERGE PRETEXT 7
    [Titulo1]
	NumeroDocumento=<<Titulo.NumeroDocumento>>
	NossoNumero=<<Titulo.NossoNumero>>
	NossoNumeroCorrespondente=

	Carteira=<<Titulo.Carteira>>
	ValorDocumento=<<ALLTRIM(STR(Titulo.ValorDocumento,15,2))>>
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
  
   this.CodRetorno = Boleto_IncluirTitulos(TituloIni,"I")
   this.UltRetorno = UltimoRetorno()
   
   IF this.CodRetorno < 0
      RETURN .F.
   ENDIF
   this.Titulos = Boleto_TotalTitulosLista()
   nossoNumeroAcbr = SPACE(20)
   Boleto_MontarNossoNumero(this.Titulos - 1,@nossoNumeroAcbr,20)
   nossoNumeroAcbr = STRTRAN( SUBSTR( ALLTRIM(nossoNumeroAcbr ),5,10) , "-","")
   this.ult_nossonumero = nossoNumeroAcbr
   
   RETURN .t. 
   
   ENDPROC 
ENDDEFINE
