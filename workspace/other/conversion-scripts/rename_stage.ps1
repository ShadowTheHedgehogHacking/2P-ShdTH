"Example of 4-digit stage ID: 0100`n"
$oldValue = Read-Host "Enter original 4-digit stgID"
$newValue = Read-Host "Enter new 4-digit stgID"
dir | rename-item -NewName {$_.name -replace $oldValue, $newValue}