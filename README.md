# librezept
医科診療報酬点数表 for 4D.

#### memo: GitHub Action

create a new project named "compiler".

prepare to read user parameters in *On Startup*.

```4d
C_TEXT($userParamsJson)
C_REAL($params)

$params:=Get database parameter(User param value; $userParamsJson)

If ($userParamsJson#"")
	
	C_OBJECT($userParams)
	$userParams:=JSON Parse($userParamsJson; Is object)
	
	If ($userParams#Null)
		
	End if 
  
End if 
```
