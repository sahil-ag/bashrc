# Personal Startup File

## Windows

Refer - https://sandfeld.net/powershell-load-your-functions-at-startup/

1. Run `if (!(Test-Path (Split-Path $profile))) { mkdir (Split-Path $profile) } ; if (!(Test-Path $profile)) { New-Item $profile -ItemType file } ; notepad $profile` in powershell, this will create a default profile, if that doens't exist; and if it does, give you a notepad to set that up

2. Adding the following snippet

    ```ps1
    # Load own custom functions at startup
    $OwnFunctionsDir = "$env:USERPROFILE\Documents\WindowsPowerShell\Functions" # location of windows folder
    Write-Host "Loading custom PowerShell functions from:" -ForegroundColor Green
    Write-Host "$OwnFunctionsDir" -ForegroundColor Yellow
    Get-ChildItem "$OwnFunctionsDir\*.ps1" | %{.$_}
    Write-Host ''
    ```
