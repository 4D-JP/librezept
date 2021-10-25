# librezept
医科診療報酬点数表 for 4D.

#### memo: GitHub Action

create a new project named "compiler".

prepare to read user parameters in *On Startup*.

```4d
$params:=Get database parameter(User param value; $userParamsJson)

If ($userParamsJson#"")
	
	C_OBJECT($userParams)
	$userParams:=JSON Parse($userParamsJson; Is object)
	
	If ($userParams#Null)
	//TODO: process user params	
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

if OK, complete *On Startup* to compile specified project.

```4d
If ($userParams#Null)

	If ($userParams.project#Null)

		$project:=File($userParams.project)

		If ($project.exists)
			$status:=Compile project($project)
		End if 

	End if 
End if 
```

if OK, extend the code to accept `Compile project` options.

```4d
$project:=Folder(fk resources folder).folder("stub").folder("Project").file("stub.4DProject")

$userParams:=New object

$userParams.project:=$project.path
$userParams.options:=New object
$userParams.options.targets:=New collection("x86_64_generic"; "arm64_macOS_lib")
$userParams.options.typeInference:="locals"
$userParams.options.defaultTypeForNumeric:=Is real
$userParams.options.defaultTypeForButtons:=Is longint
$userParams.options.generateSymbols:=True
$userParams.options.generateTypingMethods:="reset"
$userParams.options.components:=New collection

SET DATABASE PARAMETER(User param value; JSON Stringify($userParams))

RESTART 4D
```

* On Startup (abbreviated)
 
```4d
If ($userParams.options#Null)
	$options:=$userParams.options
Else 
	$options:=New object
End if 
$status:=Compile project($project; $options)
```

at this point we have a small application that can compile any project. next step is to print output to the system console, because we can to run this on a VM. we can use [compilationError](https://github.com/mesopelagique/build-action/blob/main/Project/Sources/Classes/compilationError.4dm) class or create our own.

---
