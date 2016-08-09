###############################################################################
#
# Title: Microsoft Active Directory Proxy Addresses 
# Author: Graham Williams - http://github.com/GrayW
# Date: 09/08/2016
#
# Needs to be run in Powershell Prompt with Administrative permissions
# Update $username to the user logon name
# Update $proxyAddresses to required address
# Can use multiple addresses separated by ,
#
###############################################################################

$username = 'hazel.nutt'
$proxyAddresses = "$username@domain.com"
Set-ADUser -Identity $username -Add @{
    'proxyAddresses' = $proxyAddresses | % { "smtp:$_" }
}