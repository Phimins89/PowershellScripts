# Specify the main directory path
$mainDirectory = "K:\OUT\ALL"

# Get all the subdirectories
$subdirectories = Get-ChildItem -Path $mainDirectory -Directory

# Initialize an array to store results
$results = @()

# Loop through each subdirectory
foreach ($subdir in $subdirectories) {
    # Get all the files in the current subdirectory
    $files = Get-ChildItem -Path $subdir.FullName -File

    # Get the count of files
    $fileCount = ($files | Measure-Object).Count

    # Create a custom object with subdirectory name and file count
    $result = [PSCustomObject]@{
        Customer = $subdir.Name
        NumOfDocs = $fileCount
    }

    # Add the result to the array
    $results += $result
}

# Output the results to a CSV file
$results | Export-Csv -Path "E:\STATS\MISSING\DoneSoFar.csv" -NoTypeInformation

Write-Host "Results exported to CSV file."
