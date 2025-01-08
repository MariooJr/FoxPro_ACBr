[teste5.pdf](https://github.com/user-attachments/files/18349178/teste5.pdf)# FoxPro_ACBr
Aplicativo para utilização da DLL ACBr Boleto com Visual FoxPro

Para utilizar baixe a ultima versão do App
[Ultima Versão](https://github.com/MariooJr/FoxPro_ACBr/blob/main/acbr_boletos.app "Ultima Versão")

Baixe tambem as DLLs do ACBr ou então compile utilizando os fontes do site ACBr.

------------
### O que é o ACBr?
É Projeto de Código Aberto (gratuito), de Componentes e Programas destinados ao desenvolvimento de Aplicações do segmento de Automação Comercial.

Possui um Fórum com uma comunidade vibrante e engajada, com mais de 75.000 usuários que produzem centenas de novas postagens diariamente. O conteúdo do fórum é uma grande base de conhecimento e respostas, sendo referência em pesquisas na internet sobre Automação Comercial.

Todas as informações sobre o projeto ACBr pode ser encontrada em [Site Oficial](https://projetoacbr.com.br/sobre/ "Site Oficial") | [Discord](https://discord.com/invite/acbr "Discord") | [Telegram](https://t.me/ACBrDev "Telegram")

Documentação da Biblioteca de Boletos ACBr: [Link](https://acbr.sourceforge.io/ACBrLib/SobreaACBrLibBoleto.html)

------------

### Exemplo de Uso
```
do acbr_boletos.app
acbr.CarregarDll(pathDll, pathIni, pathLogs, pathLogos )

Cedente       = ACBr.models.Pessoa()
ContaCorrente = ACBr.models.ContaCorrente()
Sacado        = ACBr.models.Pessoa()
Avalista      = ACBr.models.Pessoa()
Titulo        = ACBr.models.Titulo()

*Preencher os dados do Cedente de acordo com os Indices
*https://github.com/MariooJr/FoxPro_ACBr?tab=readme-ov-file#avalista-cedente-sacado
Cedente.Nome = "RAZAO SOCIAL"
...

*Preencher os dados da Conta Corrente de acordo com os Indices
*https://github.com/MariooJr/FoxPro_ACBr?tab=readme-ov-file#conta-corrente
ContaCorrente.Conta = "12345"
...

acbr.Configurar_Cedente(Cedente, ContaCorrente)
acbr.Limpar_Lista()


*Preencher os dados do Sacado e Avalista de acordo com os Indices
*https://github.com/MariooJr/FoxPro_ACBr?tab=readme-ov-file#avalista-cedente-sacado
Sacado.Nome = "RAZAO SOCIAL"
...

Avalista.Nome = "RAZÃO SOCIAL"
...

*Preencher os dados do Titulo de acordo com os Indices
*https://github.com/MariooJr/FoxPro_ACBr#titulo
Titulo.NossoNumero = "000001"
...

acbr.AdicionarTitulo(Sacado, Avalista, Titulo)

acbr.Imprimir("0", "Microsoft Print to PDF", "C:\boletos\", "Boleto.PDF")
```

## Indices para preenchimento dos componentes
------------

### Avalista, Cedente, Sacado
|  Propriedade | Tipo  |Descrição   |Exemplo   |
| ------------ | ------------ | ------------ | ------------ |
| Nome | CHAR  | Nome ou Razão Social  |   |
|  CNPJCPF|CHAR   | CPF ou CNPJ  |   |
| TipoInscricao|CHAR   | Tipo de Pessoa F/J  | 0 - Pessoa Fisica<br/> 1 - Pessoa uridica<br/> 3 - Outros  |
| Logradouro  | CHAR  | Endereço  |   |
|  Numero |CHAR   | Numero do Endereço  |   |
| Bairro  | CHAR  | Bairro  |   |
|  Complemento |CHAR   | Complemento do Endereço  |   |
| Cidade |CHAR   | Cidade  |   |
| UF  |CHAR   | Estado  |   |
| CEP  | CHAR  |Cep do Endereço   |   |
|  Telefone | CHAR  | Telefone  |   |

### Conta Corrente
|  Propriedade | Tipo  |Descrição   |Exemplo   |
| ------------ | ------------ | ------------ | ------------ |
| Conta  | C  | Numero da Conta  |   |
| ContaDigito| C  | Digito da Conta  |   |
| Agencia | C  | Numero da Agencia  |   |
|AgenciaDigito| C  |  Digito da Agencia  |   |
| Banco  | C  | Código do Banco no BACEN  |   |
| CNAB  | C  |  CNAB | 0 - CNAB240<br/> 1 - CNAB400 |
| Carteira  | C  | Nº da Carteira  |   |
| NumeroCorrespondente   | C  | Nºdo Correspondende Bancário  |   |
| ImprimirMensagemPadrao  | C | Imprimir as mensagens no corpo do boleto  |  0 - Não<br/>1 - Sim |

### Titulo
|  Propriedade | Tipo  |Descrição   |Exemplo   |
| ------------ | ------------ | ------------ | ------------ |
| NumeroDocumento  | C  | Numero Interno  |   |
| NossoNumero | C  | Numero do Boleto |   |
| Carteira  | C  | Carteira de emissão dos boletos |   |
| ValorDocumento  | N  | Valor do Boleto  | 10.00  |
| ValorDesconto  | N  | Valor do Desconto | 10.00  |
| Vencimento  | C  | Vencimento do Boleto |    |
| DataDocumento  | C  | Data que foi emitido Boleto |   |
| DataProcessamento  | C  | Data que esta sendo processado |   |
| LocalPagamento  | C  | Informação de onde se deve pagar o titulo |   |
| Especie  | C  | Espécie do documento | DM  |
| EspecieMod | C  |  |  R$ |
| Mensagem1  | C  | Mensagem que será exibida no corpo do boleto |   |
| Mensagem2  | C  | Mensagem que será exibida no corpo do boleto |   |
| Mensagem3  | C  | Mensagem que será exibida no corpo do boleto |   |
| CodigoMora | C  | Orientação para cobrança de Mora  | 1 - Valor Diário<br/>2 - Taxa % Mensal  |
| ValorMoraJuros | N  | Valor do Juros | 1.00 |
| DataMoraJuros  | C  | Data para cobrança de Juros |   |
| Instrucao1  | C  | Instrução para cobrança do boleto, verificar no layout do banco |   |
| Instrucao2  | C  | Instrução para cobrança do boleto, verificar no layout do banco |   |
| Instrucao3  | C  | Instrução para cobrança do boleto, verificar no layout do banco |   |
| Aceite | C  |  Tipo de Aceite para o Boleto |  0 - Sim<br/>1 - Não |
| Parcela | C  | Numero da Parcela  |   |
| TotalParcelas  | C  | Total de Parcelas |   |
|  CarteiraEnvio | C  |  Carteira de Envio de Remessa|   |
| SeuNumero  | C  | Numero Interno |   |

------------

## Métodos
------------

### CarregarDll
Carrega todos os metodos da Biblioteca para a memória e faz as configurações iniciais para uso.

|  Parametros | Tipo  |Descrição   |Exemplo   |
| ------------ | ------------ | ------------ | ------------ |
| pathDll   | C | Caminho da DLL do ACBr  | C:\ACBr\AcbrBoleto32.dll |
| pathIni   | C | Caminho onde ficará salvo o arquivo Ini das Configurações | C:\ACBr\FoxAcbr.ini <br/>Não é obrigatório |
| pathLogs  | C | Caminho onde os logs da biblioteca serão salvos | C:\ACBr\Logs\ <br/> Não é obrigatório |
| pathLogos | C | Pasta com os logos dos boletos | C:\ACBr\Logos\Coloridos\ |

### Configurar_Cedente
Configura o Cedente e a Conta Corrente que será usada na emissão dos boletos

|  Parametros | Tipo  |Descrição   |
| ------------ | ------------ | ------------ |
| Cedente | Object  | Objeto com as configurações do Cedente |
| ContaCorrente | Object  | Objeto com as configurações da Conta Corrente |

### Limpar_Lista
Limpa a lista de todos os titulos adicionados na biblioteca.<br/>
Para gerar PDF individual deve limpar a lista antes de inserir cada titulo.<br/>
Para gera um PDF com mais de 1 boleto, não limpar a lista antes de inserir cada titulo, mesma situação para gerar o arquivo de remessa.

### Adicionar_Titulo
Adicona um titulo um tituno na biblioteca, sempre que adicionar verificar as propriedades CodRetorno e UltRetorno.<br/>
Caso o CodRetorno for menor que zero, é porque teve algum erro ao adicionar o titulo, a descrição do erro está na propriedade UltRetorno.

Depois do titulo adicionado, o Nosso Numero formatado de acordo com os padroes do banco está salvo na propriedade UltNossoNumero, caso voce desejar salvar para uso futuro.

|  Parametros | Tipo  |Descrição   | Obrigatório |
| ------------ | ------------ | ------------ | ------------ |
| Sacado   | Object | Objeto com os dados do Sacado   | SIM |
| Avalista | Object | Objeto com os dados do Avalista | NÃO |
| Titulo   | Object | Objeto com os dados do Titulo   | SIM |


### Imprimir
Imprimir e Gerar o PDF de todos os titulos adicionados na lista.

|  Parametros | Tipo  |Descrição   | Exemplo |
| ------------ | ------------ | ------------ | ------------ |
| mostrarTela    | C | Se o boleto será exibido na tela antes de imprimir   | 0 - Não<br/>1 - Sim |
| nomeImpressora | C | Nome da Impressora para enviar os boletos | Passar vazio para nao imprimir |
| pastaPdf       | C | Pasta onde ficarão salvos os arquivos PDF   | Passar vazio para nao gerar |
| nomePdf        | C | Nome do Arquivo PDF   | Passar vazio para nao gerar |
