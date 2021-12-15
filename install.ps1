$targetPath = $env:APPDATA + "\Code\User\settings.json"
if (Test-Path -Path $targetPath){
    $backupPath = $targetPath + ".backup"
    if (Test-Path -Path $backupPath){
        Remove-Item $backupPath
    }
    Copy-Item -Path $targetPath -Destination $backupPath
    Remove-Item $targetPath
}

New-Item -ItemType SymbolicLink -Path $targetPath -Target $pwd/"settings.json"