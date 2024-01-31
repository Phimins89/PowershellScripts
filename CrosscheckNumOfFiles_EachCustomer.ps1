$fileA = Import-Csv E:\STATS\MISSING\DMlist.csv
$fileB = Import-Csv E:\STATS\MISSING\DoneSoFar.csv

Compare-Object $fileA $fileB -Property Customer, NumOfDocs | export-csv E:\STATS\MISSING\Missing.csv -NoTypeInformation

##$fileA | ?{$fileB -notmatch $_} | Export-CSV Output.csv -notype