$configFiles = Get-ChildItem . *.grab -rec
foreach ($file in $configFiles)
{
    (Get-Content $file.PSPath) |
    Foreach-Object { 
		if($_ -match "(<lastbonuspaid>\d+\.\d+<\/lastbonuspaid>)") {
			$bonusPaid = $matches[1];
			$bonusPaid = $bonusPaid.trim("<lastbonuspaid>").trim("<\/lastbonuspaid>");
		    $bonusPaid = $bonusPaid / 2;
			$_ -replace "<lastbonuspaid>\d+\.\d+<\/lastbonuspaid>","<lastbonuspaid>$bonusPaid</lastbonuspaid>"
		}elseif($_ -match "(<lastbonuspaid>\d+<\/lastbonuspaid>)") {
			$bonusPaid = $matches[1];
			$bonusPaid = $bonusPaid.trim("<lastbonuspaid>").trim("<\/lastbonuspaid>");
		    $bonusPaid = $bonusPaid / 2;
			$_ -replace "<lastbonuspaid>\d+<\/lastbonuspaid>","<lastbonuspaid>$bonusPaid</lastbonuspaid>"
		}
		 
	} |
	Foreach-Object {
		if($_ -match "(<taxonbonus>\d+\.\d+<\/taxonbonus>)") {
			$taxOnBonus = $matches[1];
			$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
		    $taxOnBonus = $taxOnBonus / 2 * .41;
			$_ -replace "<taxonbonus>\d+\.\d+<\/taxonbonus>","<taxonbonus>$taxOnBonus</taxonbonus>" 
		}elseif($_ -match "(<taxonbonus>\d+<\/taxonbonus>)") {
			$taxOnBonus = $matches[1];
			$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
		    $taxOnBonus = $taxOnBonus / 2 * .41;
			$_ -replace "<taxonbonus>\d+<\/taxonbonus>","<taxonbonus>$taxOnBonus</taxonbonus>" 
		}
		
	} |
	Set-Content $file.PSPath
}