# Get the path to the Downloads directory
$downloadsPath = "C:\Users\jpres\Downloads"

# Get the current date and subtract 90 days
$cutOffDate = (Get-Date).AddDays(-90)

# Get the files in the Downloads directory that are older than 90 days
$filesToDelete = Get-ChildItem -Path $downloadsPath | Where-Object { $_.LastWriteTime -lt $cutOffDate }

# Delete the files
$filesToDelete | Remove-Item -Force

# Save the list of deleted files to a text file on the desktop
$desktopPath = "C:\Users\jpres\OneDrive\Desktop"
$deletedFilesPath = Join-Path -Path $desktopPath -ChildPath "DeletedFiles.txt"
$filesToDelete.FullName | Out-File -FilePath $deletedFilesPath
