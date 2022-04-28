[CmdletBinding()]
$updates = winget upgrade
foreach ($update in $updates) {
  if ($update -match "\x20(?<id>[\w\.\-\+]+)\x20+(\d|\.|Unknown)+\x20+[\d\.]+") {
    $id = $Matches.id
    $reply = Read-Host -Prompt "Update $($id)? [Y/n]"
    if ([string]::IsNullOrWhiteSpace($reply)) {
      $reply = "Y";
    }
    if ($reply -match "[yY]") {
      Write-Host "Updating $($id)"
      winget upgrade "$($id)"
    }
  }
}