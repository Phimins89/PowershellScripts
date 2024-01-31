[string[]]$arrayFromAddressFile = Get-Content -Path 'E:\STATS\789list.txt'
[string[]]$arrayFromClosedCustomersFile = Get-Content -Path 'E:\STATS\10list.txt'

$arrayFromAddressFile | ForEach-Object {
  $customer = $_
 ## Write-Host "$_"
 ## echo $customer
    if ($arrayFromClosedCustomersFile -match $customer) {
   ##     Write-Host "`arrayFromAddressFile contains the `$arrayFromClosedCustomersFile string [$_]"
 ##  Write-Host "$_"
  
    }
	else {
		## echo $_  
	Add-Content -Path "updated_list.txt" -Value $_
	}
	
}

