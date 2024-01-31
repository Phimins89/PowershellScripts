# fetch all grab files in current directory
$configFiles = Get-ChildItem Forms *.settings -rec
#loop through grab files
foreach ($file in $configFiles)
{		
    (Get-Content $file.PSPath) | #read content into memory
##	 Select-String '<Comment type="string">' | Add-Content blob.txt
##	 Select-String '<ObjectName type="string">' | Add-Content blob.txt
	 Select-String '<form type="file">' | Add-Content blob.txt
	 
	
	
}