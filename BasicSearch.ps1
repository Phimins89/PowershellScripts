# fetch all grab files in current directory
$configFiles = Get-ChildItem . *.grab -rec
$i = 1 #set counter variable to 1

foreach ($file in $configFiles)
{
    (Get-Content $file.PSPath) | 
	 select-string  "KBC.SD.TRIPLE.OP.2.5Y" | #search for files in directory which only contain this string
	 set-content "KBC_SD_TRIPLE_OP_2_5Y_$i.GRAB" #copy content to new file
	 $i++ #increment counter
}