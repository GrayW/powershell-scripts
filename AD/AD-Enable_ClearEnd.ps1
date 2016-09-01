$users = ForEach ($user in $(Get-Content C:\users.txt)) {

    Enable-ADAccount -Identity $user
    Clear-ADAccountExpiration -Identity $user

}