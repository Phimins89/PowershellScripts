$configFiles = Get-ChildItem . *.grab -rec
foreach ($file in $configFiles)
{
    (Get-Content $file.PSPath) |
    Foreach-Object { 
		if($_ -match "(<lastbonuspaid>\d+\.\d+<\/lastbonuspaid>)") {
			$bonusPaid = $matches[1];
			$bonusPaid = $bonusPaid.trim("<lastbonuspaid>").trim("<\/lastbonuspaid>");
		    $bonusPaid = $bonusPaid / 2;
			if($_ -match "(<taxonbonus>\d+\.\d+<\/taxonbonus>)") {
			$taxOnBonus = $matches[1];
			$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
			$lastYearBonus = $bonusPaid * .41;
			$taxOnBonus = $taxOnBonus - $lastYearBonus;
			$taxOnBonus =  [math]::Round($taxOnBonus,2);
			}elseif($_ -match "(<taxonbonus>\d+<\/taxonbonus>)") {
				$taxOnBonus = $matches[1];
				$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
				$lastYearBonus = $bonusPaid * .41;
				$taxOnBonus =  $taxOnBonus - $lastYearBonus;
				$taxOnBonus =  [math]::Round($taxOnBonus,2);
			}
			$x = $_ -replace "<lastbonuspaid>\d+\.\d+<\/lastbonuspaid>","<lastbonuspaid>$bonusPaid</lastbonuspaid>"; 
			$x -replace "<taxonbonus>\d+<\/taxonbonus>","<taxonbonus>$taxOnBonus</taxonbonus>";
		}elseif($_ -match "(<lastbonuspaid>\d+<\/lastbonuspaid>)") {
			$bonusPaid = $matches[1];
			$bonusPaid = $bonusPaid.trim("<lastbonuspaid>").trim("<\/lastbonuspaid>");
		    $bonusPaid = $bonusPaid / 2;
			if($_ -match "(<taxonbonus>\d+\.\d+<\/taxonbonus>)") {
			$taxOnBonus = $matches[1];
			$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
			$lastYearBonus = $bonusPaid * .41;
			$taxOnBonus = $lastYearBonus - $taxOnBonus ;
			$taxOnBonus =  [math]::Round($taxOnBonus,2);
			}elseif($_ -match "(<taxonbonus>\d+<\/taxonbonus>)") {
				$taxOnBonus = $matches[1];
				$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
				$lastYearBonus = $bonusPaid * .41;
				$taxOnBonus = $lastYearBonus - $taxOnBonus ;
				$taxOnBonus =  [math]::Round($taxOnBonus,2);
			}
			elseif($_ -match "(<taxonbonus>0<\/taxonbonus>)") {
				$taxOnBonus = $matches[1];
				$taxOnBonus = $taxOnBonus.trim("<taxonbonus>").trim("<\/taxonbonus>");
			}
			$y = $_ -replace "<lastbonuspaid>\d+<\/lastbonuspaid>","<lastbonuspaid>$bonusPaid</lastbonuspaid>"; 
			$y -replace "<taxonbonus>\d+<\/taxonbonus>","<taxonbonus>$taxOnBonus</taxonbonus>";
		}
		 
	} |
	Set-Content $file.PSPath
}