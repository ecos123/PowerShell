##chocolatey
##https://chocolatey.org/install

##Ver se da pra instalar usando 
Run Get-ExecutionPolicy

##Restricted se o resultado for Restricted
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process

##Se o resultado for Unrestricted
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

##Para testar use Choco
choco install pdf24
