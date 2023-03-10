# Define the list of distribution lists
$distribution_lists = @(
    "marketing",
    "engineering",
    "sales",
    "customer support"
)

# Prompt the user to enter a string
while ($true) {
    $user_input = Read-Host "Enter a string"
    if ($user_input -match '^[\w\s]+$') {
        break
    } else {
        Write-Host "Invalid input. Please enter a string without special characters."
    }
}

# Find similar distribution lists
$matches = $distribution_lists | Where-Object { $_ -like "*$user_input*" }

# Prompt the user to select a distribution list
while ($true) {
    Write-Host "Select a distribution list:"
    for ($i = 0; $i -lt $matches.Count; $i++) {
        Write-Host "$i. $($matches[$i])"
    }
    $selection = Read-Host
    if ($selection -ge 0 -and $selection -lt $matches.Count) {
        $distribution_list = $matches[$selection]
        break
    } else {
        Write-Host "Invalid selection. Please select a number between 0 and $($matches.Count - 1)."
    }
}

# Prompt the user to enter a username
while ($true) {
    $username = Read-Host "Enter a username"
    if (Get-ADUser -Filter { SamAccountName -eq $username }) {
        break
    } else {
        Write-Host "Invalid username. Please enter a valid username."
    }
}

# Prompt the user to select an action
while ($true) {
    Write-Host "Select an action:"
    Write-Host "0. Add user to $distribution_list"
    Write-Host "1. Remove user from $distribution_list"
    $action = Read-Host
    if ($action -in 0, 1) {
        break
    } else {
        Write-Host "Invalid action. Please select 0 or 1."
    }
}

# Add or remove the user from the distribution list
if ($action -eq 0) {
    while ($true) {
        Write-Host "Select access permissions:"
        Write-Host "0. None"
        Write-Host "1. Read"
        Write-Host "2. Write"
        Write-Host "3. ReadWrite"
        $permissions = Read-Host
        if ($permissions -in 0, 1, 2, 3) {
            break
        } else {
            Write-Host "Invalid selection. Please select a number between 0 and 3."
        }
    }
    while ($true) {
        Write-Host "Select role:"
        Write-Host "0. Member"
        Write-Host "1. Owner"
        $role = Read-Host
        if ($role -in 0, 1) {
            break
        } else {
            Write-Host "Invalid selection. Please select 0 or 1."
        }
    }
    if ($role -eq 0) {
        Add-ADGroupMember -Identity $distribution_list -Members $username
    } else {
        Add-ADGroupMember -Identity $distribution_list -Members $username -Credential (Get-Credential) -PassThru |
        Set-ADGroup -Add @{ 'ManagedBy' = $username } -PassThru |
        Set-ADGroupPermission -User $username -AccessRights ReadProperty, WriteProperty -Properties managedBy -PassThru |
        Set-ADGroup -Add @{ 'owner' = $
