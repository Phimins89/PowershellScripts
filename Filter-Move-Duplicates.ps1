# Set unfiltered and moved directories
$unfilteredCustomersDirectory = Get-ChildItem 'K:\OUT\READY_FOR_NAS\TO_MOVE5' -rec
$movedCustomersDirectory = 'K:\OUT\READY_FOR_NAS\TO_MOVE10'
# Set exclusion list containing customer numbers
[string[]]$arrayFromExclusionsList = Get-Content -Path 'K:\OUT\READY_FOR_NAS\move10_list.txt'

$unfilteredCustomersDirectory | ForEach-Object {
	# Set Customer number as folder name
	$folderName = $_.Name
	
	# Check if folder name matches anything in exclusions list
    if ($arrayFromExclusionsList -match $folderName) {
		# Use same folder name in MOVED directory
		$destinationPath = Join-Path $movedCustomersDirectory $folderName
		
		Move-Item $_.FullName -Destination $destinationPath 
		$date = Get-Date
		$date -f "yyyyMMdd"
		Write-Output "Moved folder $folderName to $destinationPath - $date"  >> E:\STATS\DUPLICATES\Move5to10CustomersMoved.txt
    }
	
}

