���   gC  �B  �                     ~C   %         	  P   i  ��/Z    �  U  q 4�  � T� ��  ��e DECLARE INTEGER Boleto_Inicializar           IN &ACBrBoleto32 STRING arqConfig, STRING chaveCrypt
A DECLARE INTEGER Boleto_Finalizar             IN &ACBrBoleto32
d DECLARE INTEGER Boleto_Nome                  IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
d DECLARE INTEGER Boleto_Versao                IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
d DECLARE INTEGER Boleto_UltimoRetorno         IN &ACBrBoleto32 STRING @BUFFER, INTEGER @bufferLen
R DECLARE INTEGER Boleto_ConfigLer             IN &ACBrBoleto32 STRING arqConfig
R DECLARE INTEGER Boleto_ConfigGravar          IN &ACBrBoleto32 STRING arqConfig
~ DECLARE INTEGER Boleto_ConfigLerValor        IN &ACBrBoleto32 STRING Sessao, STRING Chave, STRING @Valor, INTEGER @Tamanho
r DECLARE INTEGER Boleto_ConfigGravarValor     IN &ACBrBoleto32 STRING  @eSessao, STRING @eChave, STRING @eValor
T DECLARE INTEGER Boleto_ConfigurarDados       IN &ACBrBoleto32 STRING eArquivoIni
e DECLARE INTEGER Boleto_IncluirTitulos        IN &ACBrBoleto32 STRING eArquivoIni, STRING eTpSaida
A DECLARE INTEGER Boleto_LimparLista           IN &ACBrBoleto32
A DECLARE INTEGER Boleto_TotalTitulosLista     IN &ACBrBoleto32
X DECLARE INTEGER Boleto_Imprimir              IN &ACBrBoleto32 STRING eNomeImpressora
i DECLARE INTEGER Boleto_ImprimirBoleto        IN &ACBrBoleto32 INTEGER eIndice, STRING eNomeImpressora
A DECLARE INTEGER Boleto_GerarPDF              IN &ACBrBoleto32
A DECLARE INTEGER Boleto_GerarHTML             IN &ACBrBoleto32
s DECLARE INTEGER Boleto_GerarRemessa          IN &ACBrBoleto32 STRING eDir, INTEGER eNumArquivo, STRING eNomeArq
^ DECLARE INTEGER Boleto_LerRetorno            IN &ACBrBoleto32 STRING eDir, STRING eNomeArq
� DECLARE STRING  Boleto_ObterRetorno          IN &ACBrBoleto32 STRING eDir, STRING eNomeArq, STRING @sResposta, INTEGER @esTamanho
} DECLARE INTEGER Boleto_EnviarEmail           IN &ACBrBoleto32 STRING ePara, STRING eAssunto, STRING eMensagem, STRING eCC
� DECLARE INTEGER Boleto_EnviarEmailBoleto     IN &ACBrBoleto32 INTEGER eIndice, STRING ePara, STRING eAssunto, STRING eMensagem, STRING eCC
Z DECLARE INTEGER Boleto_SetDiretorioArquivo   IN &ACBrBoleto32 STRING eDir, STRING eArq
g DECLARE INTEGER Boleto_ListaBancos           IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
g DECLARE INTEGER Boleto_ListaCaractTitulo     IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
g DECLARE INTEGER Boleto_ListaOcorrencias      IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
g DECLARE INTEGER Boleto_ListaOcorrenciasEX    IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
y DECLARE INTEGER Boleto_TamNossoNumero        IN &ACBrBoleto32 STRING eCarteira, STRING enossoNumero, STRING eConvenio
g DECLARE INTEGER Boleto_CodigosMoraAceitos    IN &ACBrBoleto32 STRING @sResposta, INTEGER @esTamanho
R DECLARE INTEGER Boleto_SelecionaBanco        IN &ACBrBoleto32 STRING eCodBanco
x DECLARE INTEGER Boleto_MontarNossoNumero     IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
x DECLARE INTEGER Boleto_RetornaLinhaDigitavel IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
x DECLARE INTEGER Boleto_RetornaCodigoBarras   IN &ACBrBoleto32 INTEGER eIndice, STRING @sResposta, INTEGER @esTamanho
� DECLARE INTEGER Boleto_EnviarBoleto          IN &ACBrBoleto32 INTEGER eCodigoOperacao, STRING @sResposta, INTEGER @esTamanho
R DECLARE INTEGER Boleto_ConfigImportar        IN &ACBrBoleto32 STRING arqConfig
b DECLARE INTEGER Boleto_ConfigExportar        IN &ACBrBoleto32 STRING Mensagem, INTEGER tamanho
Q DECLARE INTEGER Boleto_GerarPDFBoleto        IN &ACBrBoleto32 INTEGER eIndice
 U  CPATHDLL ACBRBOLETO32.  T�  �C��X�� ��C�  ��� �� B�C�  ��� U  ULTRET BOLETO_ULTIMORETORNO< 4�  � H� �5� ��  � 001��2 �
 B�� 1�� ��  � 033��P �
 B�� 2�� ��  � 104��n �
 B�� 3�� ��  � 237��� �
 B�� 5�� ��  � 341��� �
 B�� 6�� ��  � 389��� �
 B�� 7�� ��  � 748��� �
 B�� 8�� ��  � 756���
 B�� 9�� ��  � 001��$� B�� 041�� 2�5�	 B��  �� � U  BANCO�  ��  � H� �� � ��  � 01��A � B�� Boleto n�o existe�� ��  � 02��v �" B�� Entrada boleto Confirmada�� ��  � 03��� �! B�� Entrada boleto Rejeitada�� � U  CCODIGO ConfigurarDll,     �� UltimoRetorno�    ��
 banco_acbr	    �� nome_ocorrenciaP    ��1 q � QAAA!!�!AQ��1�Q���qqqq�q!���!!3 � � 3 q � A� B� B� B� B� B� B� B� B� � � A 4 q �� 1�2!2B 2                       |     )   �  �  ,   -     )  2   E   P    W     %   7
  )  x  j   �  X'ZK   �  U  "  T�  �C� Sacado����	 B��  �� U  MODELOSACADO"  T�  �C� Pessoa����	 B��  �� U  MODELOPESSOA)  T�  �C� ContaCorrente����	 B��  �� U  MODELOCC"  T�  �C� Titulo����	 B��  �� U  MODELOTITULO\  ��C�
 pasta_logs�  �  � �� ��C� pasta_logos�  �  � �� ��C� arquivo_ini�  �  � �� U  THIS ADDPROPERTY9 ��C� Nome�  �  � �� ��C� CNPJCPF�  �  � �� ��C� Pessoa�  �  � �� ��C�
 Logradouro�  �  � �� ��C� Numero�  �  � �� ��C� Bairro�  �  � �� ��C� Complemento�  �  � �� ��C� Cidade�  �  � �� ��C� UF�  �  � �� ��C� CEP�  �  � �� ��C� Telefone�  �  � ��  ��C� TipoInscricao�  �  � �� U  THIS ADDPROPERTY� ��C� Conta�  �  � �� ��C� ContaDigito�  �  � �� ��C� Agencia�  �  � ��  ��C� AgenciaDigito�  �  � ��0 ��C� DigitoVerificadorAgenciaConta�  �  � ��) ��C� ImprimirMensagemPadrao�  �  � �� ��C� Banco�  �  � �� ��C� CNAB�  �  � �� ��C� Carteira�  �  � ��  ��C� ResponEmissao�  �  � �� ��C� CaracTitulo�  �  � �� ��C� TipoCarteira�  �  � ��  ��C� TipoDocumento�  �  � �� ��C� TipoCarteira�  �  � �� ��C� TipoCobranca�  �  � �� ��C�
 Modalidade�  �  � �� ��C� Convenio�  �  � ��  ��C� CodigoCedente�  �  � ��$ ��C� CodigoTransmissao�  �  � ��' ��C� NumeroCorrespondente�  �  � ��  ��C� VersaoArquivo�  �  � �� ��C�
 VersaoLote�  �  � �� U  THIS ADDPROPERTY�" ��C� NumeroDocumento�  �  � �� ��C� NossoNumero�  �  � �� ��C� Carteira�  �  � ��) ��C� ValorDocumento�        �  � ��( ��C� ValorDesconto�        �  � �� ��C�
 Vencimento�  �  � ��  ��C� DataDocumento�  �  � ��$ ��C� DataProcessamento�  �  � ��! ��C� LocalPagamento�  �  � �� ��C� Especie�  �  � �� ��C�
 EspecieMod�  �  � �� ��C�	 Mensagem1�  �  � �� ��C�	 Mensagem2�  �  � �� ��C�	 Mensagem3�  �  � �� ��C�
 CodigoMora�  �  � ��" ��C� CodigoMoraJuros�  �  � ��! ��C� ValorMoraJuros�  �  � ��  ��C� DataMoraJuros�  �  � ��! ��C� DiasDeProtesto�  �  � ��$ ��C� DiasDeNegativacao�  �  � �� ��C� DataProtesto�  �  � ��" ��C� DataNegativacao�  �  � �� ��C�	 DataMulta�  �  � �� ��C�
 Instrucao1�  �  � �� ��C�
 Instrucao2�  �  � �� ��C�
 Instrucao3�  �  � �� ��C� Aceite�  �  � �� ��C� Parcela�  �  � ��  ��C� TotalParcelas�  �  � �� ��C�	 SeuNumero�  �  � ��$ ��C� TipoDiasProtesto� 0�  � ��% ��C� CodigoNegativacao� 0�  � ��' ��C� TipoDiasNegativacao� 0�  � ��! ��C� TipoImpressao� 1�  � ��  ��C� TipoDesconto� 0�  � ��! ��C� TipoDesconto2� 0�  � ��  ��C� CarteiraEnvio�  �  � �� U  THIS ADDPROPERTY Sacado,       Pessoa`       ContaCorrente�       Titulo�       init�      initr     init�     Init�    + 
 ��    �
 ��    �
 ��    �
 ��    � U   
 ��    � U   
 ��    � U   
 ��    � U   
 ��    � U   Model Custom�
     Configuracoes Custom�
     Pessoa Custom�
     ContaCorrente Custom     Titulo Custom    2 a� 3 a� 3 �� 3 a� 5 ���5 q�������Qa�5 �����q�������Ar�6 !�����A������!A�!�������BQq2 � � � � 4 � 5 � > � �1 � �1                    3   w         �   �           S     
   |  �          �        �  �           �	  1   5   �	  O  O   [      �     `     �     b   �  �     d     �	  0   g   �	  \  N     %       �   �     Lz/Zg   �  U   ��C�
 UltRetorno�  �  � �� ��C�
 CodRetorno�  �  � �� ��C�	 pasta_pdf�  �  � �� ��C� Titulos� �  � ��" ��C� ult_nossonumero�  �  � �� ��C� Cedente�  �  � ��! ��C� LinhaDigitavel�  �  � �� ��C� banco�  �  � �� ��C� Models� Model�  � �� U  THIS ADDPROPERTY	 ADDOBJECT 
 ��C�  �� U  BOLETO_FINALIZAR�; ��  Q� STRING� Q� STRING� Q� STRING� Q� STRING� %�C�  0
��� �A ��C� DLL n�o encontrada�0� Verifique o caminho informado�x�� � ��C �  � �� T� �C � �  � �� %�� � ���
 ��C� ��- ��C� Erro ao inicializar DLL� � Erro�x��	 B�� �� �4 ��C� BoletoBancoFCFortesConfig� DirLogo � � ��) ��C�	 Principal� TipoResposta� 0� ��% ��C�	 Principal� LogNivel� 4� ��$ ��C�	 Principal� LogPath � � �� U	  PATHDLL PATHINI PATHLOGS	 PATHLOGOS CONFIGURARDLL RET BOLETO_INICIALIZAR ULTIMORETORNO BOLETO_CONFIGGRAVARVALOR 
 ��C�  �� T� � �C� �� U  BOLETO_LIMPARLISTA THIS TITULOS BOLETO_TOTALTITULOSLISTA� ��  Q� OBJECT� Q� OBJECT�- ��C� BoletoCedenteConfig� Nome�  � � ��6 ��C� BoletoCedenteConfig� TipoInscricao�  � � ��0 ��C� BoletoCedenteConfig� CNPJCPF�  � � ��/ ��C� BoletoCedenteConfig� Cidade�  � � ��3 ��C� BoletoCedenteConfig�
 Logradouro�  � � ��/ ��C� BoletoCedenteConfig� Bairro�  � � ��2 ��C� BoletoCedenteConfig�	 NumeroRes�  �	 � ��+ ��C� BoletoCedenteConfig� UF�  �
 � ��, ��C� BoletoCedenteConfig� CEP�  � � ��1 ��C� BoletoCedenteConfig� Telefone�  � � ��4 ��C� BoletoCedenteConfig� Complemento�  � � ��6 ��C� BoletoCedenteConfig� ResponEmissao� � � ��4 ��C� BoletoCedenteConfig� CaracTitulo� � � ��5 ��C� BoletoCedenteConfig� TipoCarteira� � � ��6 ��C� BoletoCedenteConfig� TipoDocumento� � � ��3 ��C� BoletoCedenteConfig�
 Modalidade� � � ��1 ��C� BoletoCedenteConfig� Convenio� � � ��6 ��C� BoletoCedenteConfig� CodigoCedente� � � ��: ��C� BoletoCedenteConfig� CodigoTransmissao� � � ��0 ��C� BoletoCedenteConfig� Agencia� � � ��6 ��C� BoletoCedenteConfig� AgenciaDigito� � � ��. ��C� BoletoCedenteConfig� Conta� � � ��4 ��C� BoletoCedenteConfig� ContaDigito� � � ��F ��C� BoletoCedenteConfig� DigitoVerificadorAgenciaConta� � � ��? ��C� BoletoDiretorioConfig� ImprimirMensagemPadrao� 1� ��- ��C� BoletoBancoConfig� Numero� � � �� T� � �C� � � ��3 ��C� BoletoBancoConfig� TipoCobranca� � � �� T� � �� � �� U  CEDENTE CONTACORRENTE BOLETO_CONFIGGRAVARVALOR NOME TIPOINSCRICAO CNPJCPF CIDADE
 LOGRADOURO BAIRRO NUMERO UF CEP TELEFONE COMPLEMENTO RESPONEMISSAO CARACTITULO TIPOCARTEIRA TIPODOCUMENTO
 MODALIDADE CONVENIO CODIGOCEDENTE CODIGOTRANSMISSAO AGENCIA AGENCIADIGITO CONTA CONTADIGITO DIGITOVERIFICADORAGENCIACONTA BANCO TIPOCOBRANCA
 BANCO_ACBR THIS- ��  Q� OBJECT� Q� OBJECT� Q� OBJECT� G;(�� ,�� M(� `������ �     [Titulo1]�1 �+ 	NumeroDocumento=<<Titulo.NumeroDocumento>>�) �# 	NossoNumero=<<Titulo.NossoNumero>>�! � 	NossoNumeroCorrespondente=� �  �# � 	Carteira=<<Titulo.Carteira>>�B �< 	ValorDocumento=<<ALLTRIM(STR(Titulo.ValorDocumento,15,2))>>�' �! 	Vencimento=<<Titulo.Vencimento>>�- �' 	DataDocumento=<<Titulo.DataDocumento>>�5 �/ 	DataProcessamento=<<Titulo.DataProcessamento>>� � 	DataAbatimento=� � 	DataDesconto=�- �' 	DataMoraJuros=<<Titulo.DataMoraJuros>>�/ �) 	DiasDeProtesto=<<Titulo.DiasDeProtesto>>�5 �/ 	DiasDeNegativacao=<<Titulo.DiasDeNegativacao>>�+ �% 	DataProtesto=<<Titulo.DataProtesto>>�1 �+ 	DataNegativacao=<<Titulo.DataNegativacao>>�% � 	DataMulta=<<Titulo.DataMulta>>� � 	DataBaixa=� � 	ValorAbatimento=�@ �: 	ValorDesconto=<<ALLTRIM(STR(Titulo.ValorDesconto,10,2))>>�B �< 	ValorMoraJuros=<<ALLTRIM(STR(Titulo.ValorMoraJuros,10,2))>>� �
 	ValorIOF=� � 	ValorOutrasDespesas=� � 	MultaValorFixo=0� � 	PercentualMulta=�R �L 	LocalPagamento=Pag�vel em qualquer ag�ncia banc�ria mesmo ap�s o vencimento�! � 	Especie=<<Titulo.Especie>>�' �! 	EspecieMod=<<Titulo.EspecieMod>>� � 	DataLimitePagto=� �  �( �" 	Sacado.NomeSacado=<<Sacado.Nome>>�( �" 	Sacado.CNPJCPF=<<Sacado.CNPJCPF>>�& �  	Sacado.Pessoa=<<Sacado.Pessoa>>�. �( 	Sacado.Logradouro=<<Sacado.Logradouro>>�& �  	Sacado.Numero=<<Sacado.Numero>>�& �  	Sacado.Bairro=<<Sacado.Bairro>>�0 �* 	Sacado.Complemento=<<Sacado.Complemento>>�& �  	Sacado.Cidade=<<Sacado.Cidade>>� � 	Sacado.UF=<<Sacado.UF>>�  � 	Sacado.CEP=<<Sacado.CEP>>� � 	Sacado.Email=� � 	�s �m 	Sacado.SacadoAvalista.Pessoa=<<IIF(EMPTY(Avalista.Pessoa) .and. this.banco $ "033", "3", Avalista.Pessoa) >>�* �$ 	Sacado.SacadoAvalista.NomeAvalista=�' �! 	Sacado.SacadoAvalista.CNPJCPF=  �( �" 	Sacado.SacadoAvalista.Logradouro=�' �! 	Sacado.SacadoAvalista.Numero=   �) �# 	Sacado.SacadoAvalista.Complemento=�* �$ 	Sacado.SacadoAvalista.Bairro=      �) �# 	Sacado.SacadoAvalista.Cidade=     �( �" 	Sacado.SacadoAvalista.UF=        �* �$ 	Sacado.SacadoAvalista.CEP=         �# � 	Sacado.SacadoAvalista.Email=�) �# 	Sacado.SacadoAvalista.Fone=       �) �# 	Sacado.SacadoAvalista.InscricaoNr=� �  �N �H 	Mensagem=<<Titulo.Mensagem1>>|<<Titulo.Mensagem2>>|<<Titulo.Mensagem3>>� � 	Informativo=� � 	Detalhamento=� � 	Competencia=� � 	ArquivoLogoEmp=� � 	Verso=False�' �! 	Instrucao1=<<Titulo.Instrucao1>>�' �! 	Instrucao2=<<Titulo.Instrucao2>>�' �! 	Instrucao3=<<Titulo.Instrucao3>>� � 	Aceite=<<Titulo.Aceite>>�* �$ 	OcorrenciaOriginal.TipoOcorrencia=0�! � 	Parcela=<<Titulo.Parcela>>�- �' 	TotalParcelas=<<Titulo.TotalParcelas>>�% � 	SeuNumero=<<Titulo.SeuNumero>>� � 	�3 �- 	TipoDiasProtesto=<<Titulo.TipoDiasProtesto>>�5 �/ 	CodigoNegativacao=<<Titulo.CodigoNegativacao>>�9 �3 	TipoDiasNegativacao=<<Titulo.TipoDiasNegativacao>>�- �' 	TipoImpressao=<<Titulo.TipoImpressao>>� � 	CodigoMoraJuros=�' �! 	CodigoMora=<<Titulo.CodigoMora>>�+ �% 	TipoDesconto=<<Titulo.TipoDesconto>>�- �' 	TipoDesconto2=<<Titulo.TipoDesconto2>>�- �' 	CarteiraEnvio=<<Titulo.CarteiraEnvio>>� � G;(�� .�� T� � �C � �  � �� T� � �C� �� %�� � � ���� B�-�� � T� �	 �C�
 �� T� �C�X�� ��C� �	 �� �� �� T� � �� �� T� �C�dX�� ��C� �	 �� �d� �� T� � �� �� B�a�� U  SACADO AVALISTA TITULO	 TITULOINI THIS
 CODRETORNO BOLETO_INCLUIRTITULOS
 ULTRETORNO ULTIMORETORNO TITULOS BOLETO_TOTALTITULOSLISTA NOSSONUMEROACBR BOLETO_MONTARNOSSONUMERO ULT_NOSSONUMERO LINHADIGITAVEL BOLETO_RETORNALINHADIGITAVELi; ��  Q� STRING� Q� STRING� Q� STRING� Q� STRING�; ��C� BoletoBancoFCFortesConfig� MostrarPreview �  � �� T� �� �� T� �C� �� %�� � ��� �< ��C�! Nenhum titulo adicionado na lista� �	 Verifique�x�� B�-�� � %�CC� ��
��	� ��C � � �� � %�CC� ��
�	 CC� ��
	��b� R,:�� Gerando PDF � �� ��C �  � � ��
 ��C�	 �� � U
  MOSTRARTELA NOMEIMPRESSORA PASTAPDF NOMEPDF BOLETO_CONFIGGRAVARVALOR TOTALTITULOS BOLETO_TOTALTITULOSLISTA BOLETO_IMPRIMIR BOLETO_SETDIRETORIOARQUIVO BOLETO_GERARPDF= ��  Q� STRING� Q� STRING� Q� INTEGER� Q� INTEGER�G ��C� BoletoDiretorioConfig� LayoutRemessaC� ��� � � �6� ��6 ��C� BoletoDiretorioConfig� DirArqRemessa �  � ��7 ��C� BoletoDiretorioConfig� NomeArqRemessa � � ��? ��C� BoletoDiretorioConfig� ImprimirMensagemPadrao� 1� ��@ ��C� BoletoDiretorioConfig� RemoveAcentosArqRemessa� 0� ��9 ��C� BoletoDiretorioConfig� NumeroArquivoCC� Z�� ��4 ��C� BoletoDiretorioConfig� DataArquivoCC$*� �� T� � �C�   � �  � �� T� �	 �C�
 �� U  PATHARQUIVO NOMEARQUIVO CNAB NUMEROARQUIVO BOLETO_CONFIGGRAVARVALOR THIS
 CODRETORNO BOLETO_GERARREMESSA NUMEROREMESSA
 ULTRETORNO ULTIMORETORNO init,       DestroyT      CarregarDllw      Limpar_Lista�      Configurar_Cedente      AdicionarTitulo2      ImprimirH      Remessae     S 
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    �
 ��    � U   ACBr Custom�    3 ����!���5 � : �A � R� �� A B�QA4 � 9 ��a�1�!��AcAQa1a�a�Ab��r129 �� 1�a 1!q�QaA��Q�Qq!�qq!qqa ��a�aaa�Aq 1�q�q�����1��a �1A1a!qqq���Qq 1Q��qq���A � �Bq A � �� �q < ��� � �q A "� A ��!� A 3 �saq��A�2 � � � @� �  � @� �� ?                    5   �          #        �  �        �    2       �
  �  =   ?   b  &  n   �   \)  N,  �   �   x,  �/  �   �      �/         %           N      J   v��Y   �  �
 loader.prg� U  LOADER PRG1                     %             
     X(Z�   �� 3 G+(��' c:\clientes\acbr\Progs\acbr_funcoes.prg��+ G+(�� c:\clientes\acbr\Progs\acbr.prg��- G+(��! c:\clientes\acbr\Progs\models.prg�� %�C� acbrb� O��� � <�  � � 7�  � T�  �C� acbr����	 B��  �� U  ACBR1���q A r A� 1                 progs\acbr_funcoes.prg c:\users\mario\appdata\local\temp\ acbr_funcoes.fxp progs\models.prg models.fxp progs\acbr.prg acbr.fxp progs\main.prg main.fxp progs\loader.prg loader.fxp  )   �     :            �  �     \            �  .A     v            .A  �A     �            �A  �B     �           