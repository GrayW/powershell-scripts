###############################################################################
#
# Title: Microsoft Office 365 Mailtrace 
# Author: Graham Williams - http://github.com/GrayW
# Date: 28/07/2016
#
# Needs to be run in Powershell Prompt with Administrative permissions
# When prompted for 'Credential', enter your O365 email address and password
# Script will then create a session and connect to outlook.office365.com 
# You are then prompted for the sender email address and date range
# Results will be saved to a csv file
#
###############################################################################


Set-ExecutionPolicy RemoteSigned
$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session
$searchID = Read-Host -Prompt '** REQUIRED ** Enter the senders email address'
$startDate = Read-Host -Prompt '** REQUIRED ** Enter Start Date mm/dd/yyyy hh:mm:ss'
$endDate = Read-Host -Prompt '** REQUIRED ** Enter End Date mm/dd/yyyy hh:mm:ss'
Get-MessageTrace -SenderAddress $searchID -StartDate $startDate -EndDate $endDate | Export-Csv "c:\mailtrace-$searchID.csv"
Remove-PSSession $Session
