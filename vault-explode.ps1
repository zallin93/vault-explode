param(
    $role = $(throw "role is a required parameter!"),
    $path = $(throw "path is a required parameter!"),
    $vaultHost = $(throw "vaultHost is a required parameter!"),
    $file = $(throw "file is a required parameter!"),
    $authmethod = "aws"
)

$address = "https://$($vaultHost)"

vault login -method="$($authmethod)" -address="$($address)" role="$($role)" header_value="$($vaultHost)" > $null

# read secrets from app path in vault. hold in memory.
# Remove first 3 lines of the table that displays secrets
$vaultResponse = $( vault read -format=json -address="$($address)" "$($path)" | ConvertFrom-Json )
$data = $vaultResponse.data

# read secrets mapping from config file
# loop through each line, and set the vault-key value to the desired env var name
foreach($line in Get-Content -Path $file ) {
    $lineArray = $line.Split("|")
    if( $lineArray.Length -eq 2) {
        [Environment]::SetEnvironmentVariable($lineArray[1], $data.psobject.properties[$lineArray[0]].value , 'Machine')
    }
}
