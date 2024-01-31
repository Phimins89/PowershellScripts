# fetch all grab files in current directory
$configFiles = Get-ChildItem . *.grab -rec
$i = 1
foreach ($file in $configFiles)
{

    (Get-Content $file.PSPath) | 
	 if ($_ -match " Account Number : (.*)") { 
        $name = $matches[1]
        echo $name
    } 
}

(get-content c:\temp\your_file_with_names.txt)  | % { 
    if ($_ -match " Account Number : (.*)") { 
        $name = $matches[1]
        echo $name
    }
}