$dirs = Get-ChildItem "K:\OUT\ALL" -Directory
$csvLog = "E:\STATS\MISSING\FilesCreated2024.csv"

$startDate = Get-Date "01/01/2024"
#Greg change to date after I am running
$endDate = Get-Date "01/31/2024"

foreach ($dir in $dirs) {
    $folder = $dir.Name
    $directory = $dir.FullName
    $filesCount = (Get-ChildItem $directory -Recurse `
        | Where-Object { $_.CreationTime -ge $startDate -and $_.CreationTime -lt $endDate }).Count
    $object = New-Object -TypeName psobject
    $object | Add-Member -MemberType NoteProperty -Name "Site" -Value $folder
    $object | Add-Member -MemberType NoteProperty -Name "File Count" -Value $filesCount
    $object | Export-Csv $csvLog -Encoding ASCII -Append -NoTypeInformation
}