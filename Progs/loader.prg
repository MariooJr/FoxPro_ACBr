SET PROCEDURE TO "c:\clientes\acbr\Progs\acbr_funcoes.prg" ADDITIVE 
SET PROCEDURE TO "c:\clientes\acbr\Progs\acbr.prg" ADDITIVE 
SET PROCEDURE TO "c:\clientes\acbr\Progs\models.prg" ADDITIVE 

IF TYPE("acbr") == "O"
	RELEASE acbr
ENDIF 

PUBLIC acbr
acbr = NEWOBJECT("acbr")
RETURN acbr 