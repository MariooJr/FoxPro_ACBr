CLOSE DATABASES 

on key label SHIFT+F2  RUN /N explorer.exe c:\clientes\acbr\
_screen.Caption = "Projeto: ACBr - " + TTOC(DATETIME())

SET PATH TO SYS(5)+ "\clientes\acbr\temp"
set defa to SYS(5)+ "\clientes\acbr"

SET PROCEDURE TO "c:\clientes\acbr\Progs\acbr_funcoes.prg" ADDITIVE 
SET PROCEDURE TO "c:\clientes\acbr\Progs\acbr.prg" ADDITIVE 
SET PROCEDURE TO "c:\clientes\acbr\Progs\models.prg" ADDITIVE 

