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
