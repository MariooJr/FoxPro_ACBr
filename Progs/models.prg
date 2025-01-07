DEFINE CLASS Model as Custom
   PROCEDURE Sacado
      modeloSacado = NEWOBJECT("Sacado")
      RETURN modeloSacado 
   ENDPROC 

   PROCEDURE Pessoa
      modeloPessoa = NEWOBJECT("Pessoa")
      RETURN modeloPessoa
   ENDPROC 
   
   PROCEDURE ContaCorrente
      modeloCC = NEWOBJECT("ContaCorrente")
      RETURN modeloCC 
   ENDPROC 
   
   PROCEDURE Titulo
      modeloTitulo = NEWOBJECT("Titulo")
      RETURN modeloTitulo
   ENDPROC 
ENDDEFINE 

DEFINE CLASS Configuracoes as Custom
   PROCEDURE init 
	   this.AddProperty("pasta_logs"  ,"")
	   this.AddProperty("pasta_logos" ,"")
	   this.AddProperty("arquivo_ini" ,"")
   ENDPROC 
ENDDEFINE 

DEFINE CLASS Pessoa as Custom
   PROCEDURE init 
	   this.AddProperty("Nome"       ,"")
	   this.AddProperty("CNPJCPF"    ,"")
	   this.AddProperty("Pessoa"     ,"")
	   this.AddProperty("Logradouro" ,"")
	   this.AddProperty("Numero"     ,"")
	   this.AddProperty("Bairro"     ,"")
	   this.AddProperty("Complemento","")
	   this.AddProperty("Cidade"     ,"")
	   this.AddProperty("UF"         ,"")
	   this.AddProperty("CEP"        ,"")
	   this.AddProperty("Telefone"        ,"")
	   this.AddProperty("TipoInscricao","")
   ENDPROC 
ENDDEFINE 

DEFINE CLASS ContaCorrente as Custom
   PROCEDURE init
	   this.AddProperty("Conta"                         ,"")
	   this.AddProperty("ContaDigito"                   ,"")
	   this.AddProperty("Agencia"                       ,"")
	   this.AddProperty("AgenciaDigito"                 ,"")
	   this.AddProperty("DigitoVerificadorAgenciaConta" ,"")
	   this.AddProperty("ImprimirMensagemPadrao"        ,"")
	   this.AddProperty("Banco"                         ,"")
	   this.AddProperty("CNAB"                          ,"")
	   this.AddProperty("Carteira"                      ,"")
	   
	   this.AddProperty("ResponEmissao"     ,"")
	   this.AddProperty("CaracTitulo"       ,"")
	   this.AddProperty("TipoCarteira"      ,"")
	   this.AddProperty("TipoDocumento"     ,"")
	   this.AddProperty("TipoCarteira"      ,"")
	   this.AddProperty("TipoCobranca"      ,"")
	   this.AddProperty("Modalidade"        ,"")
	   this.AddProperty("Convenio"          ,"")
	   this.AddProperty("CodigoCedente"     ,"")
	   this.AddProperty("CodigoTransmissao" ,"")  
	   
	   this.AddProperty("NumeroCorrespondente", "")
	   this.AddProperty("VersaoArquivo"       ,"")
	   this.AddProperty("VersaoLote"          ,"")
   ENDPROC 
ENDDEFINE 


DEFINE CLASS Titulo as Custom
   PROCEDURE Init 
	   this.AddProperty("NumeroDocumento","")
	   this.AddProperty("NossoNumero","")
	   this.AddProperty("Carteira","")
	   this.AddProperty("ValorDocumento", 0.00)
	   this.AddProperty("ValorDesconto" , 0.00)
	   this.AddProperty("Vencimento","")
	   this.AddProperty("DataDocumento","")
	   this.AddProperty("DataProcessamento","")
	   this.AddProperty("LocalPagamento","")
	   this.AddProperty("Especie","")
	   this.AddProperty("EspecieMod","")
	   this.AddProperty("Mensagem1","")
	   this.AddProperty("Mensagem2","")
	   this.AddProperty("Mensagem3","")
	   
	   this.AddProperty("CodigoMora"     ,"")
	   this.AddProperty("CodigoMoraJuros","")
	   this.AddProperty("ValorMoraJuros" ,"")
	   this.AddProperty("DataMoraJuros"  ,"")
	   
	   this.AddProperty("DiasDeProtesto","")
	   this.AddProperty("DiasDeNegativacao","")
	   this.AddProperty("DataProtesto","")
	   this.AddProperty("DataNegativacao","")
	   this.AddProperty("DataMulta","")
	   this.AddProperty("Instrucao1"    ,"")
	   this.AddProperty("Instrucao2"    ,"")
	   this.AddProperty("Instrucao3"    ,"")
	   this.AddProperty("Aceite"        ,"")
	   this.AddProperty("Parcela"       ,"")
	   this.AddProperty("TotalParcelas" ,"")
	   this.AddProperty("SeuNumero"     ,"")
	   
	   this.AddProperty("TipoDiasProtesto"    ,"0")
	   this.AddProperty("CodigoNegativacao"   ,"0")
	   this.AddProperty("TipoDiasNegativacao" ,"0")
	   this.AddProperty("TipoImpressao"       ,"1")
	   this.AddProperty("TipoDesconto"        ,"0")
	   this.AddProperty("TipoDesconto2"       ,"0")
	   this.AddProperty("CarteiraEnvio"       ,"")
   ENDPROC 
ENDDEFINE 
