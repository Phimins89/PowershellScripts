# fetch all grab files in current directory
$configFiles = Get-ChildItem . *.grab -rec
#loop through grab files
foreach ($file in $configFiles)
{		
    (Get-Content $file.PSPath) | #read content into memory
    Foreach-Object { $_ -replace "<lastbonuspaid>\d+\.\d+<\/lastbonuspaid>","<lastbonuspaid>0.00</lastbonuspaid>" } | #replace any occurrences of string with new values 
	Foreach-Object { $_ -replace "<taxonbonus>\d+\.\d+<\/taxonbonus>","<taxonbonus>0.00</taxonbonus>" } | 
	Set-Content $file.PSPath #overwrite existing file and save
}