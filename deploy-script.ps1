
function Get-TimeStamp {
    return "[{0:MM/dd/yy} {0:HH:mm:ss}]" -f (Get-Date)
}

# Get Current Release
# Can only make 60 request an hour
Write-Output "$(Get-TimeStamp): Getting data."
$details = invoke-restmethod -method GET -uri "https://api.github.com/repos/ius-csg/csghomepage/releases/latest"

# Get Stored Release
$dataPath = "~/ghrelease.json"
$dataExists = Test-Path($dataPath)
if ($dataExists ){
    Write-Output "$(Get-TimeStamp): Getting Deployment Data."
    $data = Get-Content -Raw -Path $dataPath | ConvertFrom-Json
} else {
    Write-Output "$(Get-TimeStamp): Data does not exist."
}

if( -not $dataExists -or $details.name -ne $data.name ){

    # Download
    Write-Output "$(Get-TimeStamp): Downloading Release"
    Invoke-WebRequest -Uri "https://github.com/ius-csg/csghomepage/releases/download/latest/release.zip" -OutFile "./release.zip"

    # Unzip
    Expand-Archive -LiteralPath ./release.zip -DestinationPath ./release

    # Deploy
    Write-Output "$(Get-TimeStamp): Deploying to nginx directory."
    Remove-Item -Path "./release/_site/BUILD_NUMBER"

    Remove-Item -Path "./release/_site/Rakefile"

    Copy-Item -Path "./release/_site" -Destination "/var/www/csghomepage/" -Recurse -Force

    Write-Output "$(Get-TimeStamp): Restart Nginx."
    sudo systemctl restart nginx

    # Write data to file
    Write-Output "$(Get-TimeStamp): Writing data later."
    $details | ConvertTo-Json -depth 100 | Out-File $dataPath -Force
}else {
    Write-Output "$(Get-TimeStamp): No New Update."
}



