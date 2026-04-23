function prompt {
    $lastCommandSuccess = $?

    $currentFolder = Split-Path $pwd -Leaf
    if ($currentFolder -eq "") { $currentFolder = $pwd.Path }
    if ($pwd.Path -eq $HOME) { $currentFolder = "~" }

    # Using [char]27 ensures compatibility with older PowerShell 5.1
    $esc = [char]27
    $hnColor     = "$esc[38;2;227;100;100m"
    $folderColor = "$esc[38;2;86;182;194m"
    $reset       = "$esc[0m"

    if (-not $lastCommandSuccess) {
        $arrowColor = "$esc[38;2;255;0;0m" 
    } else {
        $arrowColor = "$esc[38;2;98;237;139m"
    }

    Write-Host "${hnColor}@hn ${arrowColor}➜ ${folderColor}$currentFolder${reset}" -NoNewline
    
    return " "
}