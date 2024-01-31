$configFiles = Get-ChildItem Get-ChildItem "P:\Scripts\statements" -Rec

foreach ($file in $configFiles)
{
	$DPfile = Get-Content $file.PSPath;
	echo $DPfile[1].Substring(17,27)
}