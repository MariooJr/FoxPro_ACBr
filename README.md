# FoxPro_ACBr
Aplicativo para utilização da DLL ACBr Boleto com Visual FoxPro

Exemplo de Uso
```
acbr = NEWOBJECT("ACBr")
acbr.CarregarDll(pathDll, pathIni, pathLogs, pathLogos )

Cedente       = ACBr.models.Pessoa()
ContaCorrente = ACBr.models.ContaCorrente()
Sacado        = ACBr.models.Pessoa()
Avalista      = ACBr.models.Pessoa()
Titulo        = ACBr.models.Titulo()

acbr.Configurar_Cedente(Cedente, ContaCorrente)
acbr.Limpar_Lista()

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
