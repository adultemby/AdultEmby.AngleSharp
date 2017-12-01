# Run this in the Powershell window to allow this script to run
# Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

if(Test-Path -Path build ){
    Remove-Item build -recurse
}
if(Test-Path -Path src ){
    Remove-Item src -recurse
}

New-Item build -type directory
New-Item src -type directory

wget https://github.com/AngleSharp/AngleSharp/archive/v0.9.9.zip -OutFile build/AngleSharp.zip
Expand-Archive build/AngleSharp.zip -DestinationPath build
Copy-Item build/AngleSharp-0.9.9/src/AngleSharp/* src -recurse
Remove-Item src/AngleSharp.Core.csproj
Remove-Item src/AngleSharp.NETCore.xproj
Remove-Item src/Key.snk
Remove-Item src/project.json
Remove-Item src/Properties/AssemblyInfo.cs
