"Example of 2-digit chunkNum: 23`n"
$toAdd = Read-Host "Enter last stage's largest non-collision 2-digit chunkNum"
$output = dir input
$output| rename-item -NewName {
                                  $value = [convert]::ToInt32($_.name.Substring($_.name.Length-6, 2), 10)
                                  $newvalue = $value + $toAdd
                                  Write-Host $newvalue
                                  $_.name.remove($_.name.Length-6, 2).insert($_.name.Length-6, $newvalue)
                                  }