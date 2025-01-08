# FoxPro_ACBr
Aplicativo para utilização da DLL ACBr Boleto com Visual FoxPro

Ainda está em fase de testes, não utilizar.

------------
### O que é o ACBr?
É Projeto de Código Aberto (gratuito), de Componentes e Programas destinados ao desenvolvimento de Aplicações do segmento de Automação Comercial.

Possui um Fórum com uma comunidade vibrante e engajada, com mais de 75.000 usuários que produzem centenas de novas postagens diariamente. O conteúdo do fórum é uma grande base de conhecimento e respostas, sendo referência em pesquisas na internet sobre Automação Comercial.

Todas as informações sobre o projeto ACBr pode ser encontrada em [Site Oficial](https://projetoacbr.com.br/sobre/ "Site Oficial") | [Discord](https://discord.com/invite/acbr "Discord") | [Telegram](https://t.me/ACBrDev "Telegram")

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

acbr.ImprimirBoletos()
acbr.GerarRemessa()
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
| ...  | C  | ...  | ...  |
