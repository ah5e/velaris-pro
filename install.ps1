$zip = "$env:TEMP\VELARIS_PRO.zip"
$folder = "$env:USERPROFILE\Desktop\VELARIS_PRO"

Remove-Item $folder -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Path $folder -Force | Out-Null

Invoke-WebRequest "https://github.com/ah5e/velaris-pro/releases/download/v1.0/VELARIS_PRO.zip" -OutFile $zip

Expand-Archive -Path $zip -DestinationPath $folder -Force

$exe = Get-ChildItem -Path $folder -Filter "VELARIS PRO.exe" -Recurse | Select-Object -First 1

if ($exe) {
    Start-Process $exe.FullName
} else {
    Write-Host "VELARIS PRO.exe not found"
    pause
}
