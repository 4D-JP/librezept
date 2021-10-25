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

test passing user parameters

```4d
$project:=Folder(fk resources folder).folder("stub").folder("Project").file("stub.4DProject")

$userParams:=New object

$userParams.project:=$project.path

SET DATABASE PARAMETER(User param value; JSON Stringify($userParams))

RESTART 4D
```
