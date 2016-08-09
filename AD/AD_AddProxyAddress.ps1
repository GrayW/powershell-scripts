$username = 'hazel.nutt'
$proxyAddresses = "$username@domain.com"
Set-ADUser -Identity $username -Add @{
    'proxyAddresses' = $proxyAddresses | % { "smtp:$_" }
}