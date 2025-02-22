DEFINE CLASS ACBr as Custom
   
   PROCEDURE init
      this.AddProperty("UltRetorno", "")
      this.AddProperty("CodRetorno", "")
      this.AddProperty("pasta_pdf" ,"")
      this.AddProperty("Titulos"   , 0)
      this.AddProperty("ult_nossonumero","")
      this.AddProperty("Cedente","")
      this.AddProperty("LinhaDigitavel","")
      
      this.AddProperty("banco","")
      this.AddObject("Models","Model")
      *this.AddObject("Cedente","Custom")
      
   ENDPROC 
   
   PROCEDURE Destroy
      Boleto_Finalizar()
   ENDPROC 
   
   ***************************************************************************************
   ** Carrega a DLL com todos os seus metodos                                            *
   **                                                                                    *
   ** pathDll   => Caminho da DLL                                                        *
   ** pathLogs  => Pasta onde ficam salvos os logs de execu��o da DLL, n�o � obrigat�rio * 
   ** pathLogos => Pasta onde est�o salvos os logos dos bancos                           *
   ***************************************************************************************
   PROCEDURE CarregarDll
   lPARAMETERS pathDll as String, pathIni as String, pathLogs as String, pathLogos as String
      IF !FILE(pathDll)
         MESSAGEBOX("DLL n�o encontrada",0+48,"Verifique o caminho informado")
      ENDIF 
      =ConfigurarDll(pathDll)
      
      ret = Boleto_Inicializar(pathIni,"")
      IF ret < 0 
         =UltimoRetorno()
         MESSAGEBOX("Erro ao inicializar DLL",0,"Erro")
         RETURN 0
      ENDIF 
      
      Boleto_ConfigGravarValor("BoletoBancoFCFortesConfig","DirLogo", pathLogos)
      Boleto_ConfigGravarValor("Principal","TipoResposta","0")
      Boleto_ConfigGravarValor("Principal","LogNivel","4")
      Boleto_ConfigGravarValor("Principal","LogPath", pathLogs)
      
   ENDPROC 
   
   PROCEDURE Limpar_Lista
      Boleto_LimparLista()
      this.Titulos = Boleto_TotalTitulosLista()
   ENDPROC 
   
   *******************************************************************************************
   ** Configura o Cedente para a emiss�o dos boletos                                         *
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
   ContaCorrente.TipoCobranca = banco_acbr(ContaCorrente.Banco)
   Boleto_ConfigGravarValor("BoletoBancoConfig","TipoCobranca",ContaCorrente.TipoCobranca) &&Numero do Banco no ACBr
   
   this.banco = ContaCorrente.Banco
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
	LocalPagamento=Pag�vel em qualquer ag�ncia banc�ria mesmo ap�s o vencimento
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
	
	Sacado.SacadoAvalista.Pessoa=<<IIF(EMPTY(Avalista.Pessoa) .and. this.banco $ "033", "3", Avalista.Pessoa) >>
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
  
   this.CodRetorno = Boleto_IncluirTitulos(TituloIni,"")
   this.UltRetorno = UltimoRetorno()
   
   IF this.CodRetorno < 0
      RETURN .F.
   ENDIF
   
   this.Titulos = Boleto_TotalTitulosLista()
   
   nossoNumeroAcbr = SPACE(20)
   Boleto_MontarNossoNumero(this.Titulos - 1,@nossoNumeroAcbr,20)
   *nossoNumeroAcbr = STRTRAN( SUBSTR( ALLTRIM(nossoNumeroAcbr ),5,10) , "-","")
   this.ult_nossonumero = nossoNumeroAcbr
   
   linhaDigitavel = SPACE(100)
   Boleto_RetornaLinhaDigitavel(this.Titulos - 1,@linhaDigitavel ,100)
   this.LinhaDigitavel = linhaDigitavel
   RETURN .t. 
   
   ENDPROC
 
   *******************************************************************************************
   ** Gera o PDF e Imprimi os titulos adicionados a lista                                    *
   **                                                                                        * 
   ** mostrarTela    => Define se o boleto ser� exibido na tela antes da impress�o           *
   ** nomeImpressora => Nome da Impressora que ser� enviado os boletos                       *
   ** pastaPdf       => Pasta onde ficar� salvo o arquivo PDF                                *
   ** nomePdf        => Nome do Arquivo PDF, Ex: "Boleto.pdf"                                *                    
   *******************************************************************************************     
   PROCEDURE Imprimir
   LPARAMETERS mostrarTela as String, nomeImpressora as String, pastaPdf as String, nomePdf as String
   
   &&Configura��o se vai exibir o boleto na tela antes de imprimir ou n�o
   Boleto_ConfigGravarValor("BoletoBancoFCFortesConfig","MostrarPreview", mostrarTela) 


   totalTitulos = 0
   totalTitulos = Boleto_TotalTitulosLista()

   IF totalTitulos = 0
	  MESSAGEBOX("Nenhum titulo adicionado na lista",0,"Verifique")
	  RETURN .F.
   ENDIF 

   IF !EMPTY(ALLTRIM(nomeImpressora))
      BOLETO_Imprimir(nomeImpressora)
   ENDIF 
   
   IF !EMPTY(ALLTRIM(pastaPdf)) .and. !EMPTY(ALLTRIM(nomePdf))
      WAIT WINDOW "Gerando PDF " + nomePdf NOWAIT 
	  Boleto_SetDiretorioArquivo(pastaPdf, nomePdf)
	  boleto_gerarpdf()
   ENDIF 
   ENDPROC 
   
   PROCEDURE Remessa
   LPARAMETERS pathArquivo as String, nomeArquivo as String, cnab as Integer, numeroArquivo as Integer
   
   **Configurando o arquivo de remessa
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","LayoutRemessa"  , IIF(cnab == 240, 0, 1))
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","DirArqRemessa"  , pathArquivo)
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","NomeArqRemessa" , nomeArquivo)
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","ImprimirMensagemPadrao","1")
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","RemoveAcentosArqRemessa","0")
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","NumeroArquivo",ALLTRIM(STR(numeroArquivo)))
   Boleto_ConfigGravarValor("BoletoDiretorioConfig","DataArquivo",DTOC(DATE()))   
   
   this.CodRetorno = Boleto_GerarRemessa("",numeroRemessa,"")
   this.ultRetorno = UltimoRetorno()
   ENDPROC 
ENDDEFINE
