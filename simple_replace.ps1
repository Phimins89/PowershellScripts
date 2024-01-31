$configFiles = Get-ChildItem . *.* -rec
foreach ($file in $configFiles)
{
    (Get-Content $file.PSPath) |
    Foreach-Object { $_ -replace "Statement Date :    29 MAR 2019","Statement Date :    31 MAR 2019" } |
		Set-Content $file.PSPath
}