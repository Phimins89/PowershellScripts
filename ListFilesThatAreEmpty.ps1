$dirs = Get-ChildItem "K:\OUT\ALL" -Directory
$csvLog = "E:\STATS\MISSING\EmptyFiles.csv"

foreach ($dir in $dirs) {
    $folder = $dir.Name
    $directory = $dir.FullName
    $filesCount = (Get-ChildItem $directory -Recurse `
        | Where-Object { $_.Length -lt 1KB }).Count
    $object = New-Object -TypeName psobject
    $object | Add-Member -MemberType NoteProperty -Name "Site" -Value $folder
    $object | Add-Member -MemberType NoteProperty -Name "File Count" -Value $filesCount
    $object | Export-Csv $csvLog -Encoding ASCII -Append -NoTypeInformation
}