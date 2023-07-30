
# Customize the prompt to display the current directory and Git branch
function prompt {
    $directory = (Get-Location).Path
    $gitBranch = $(git rev-parse --abbrev-ref HEAD) 2> $null
    if ($gitBranch) {
        Write-Host "[$directory][$gitBranch]>" -NoNewline -ForegroundColor Cyan
    } else {
        Write-Host "[$directory]>" -NoNewline -ForegroundColor Cyan
    }
    return " "
}

# Create aliases for frequently used commands
Set-Alias -Name l -Value Get-ChildItem
Set-Alias -Name c -Value Set-Location
Set-Alias -Name h -Value Get-Help

# Load the Active Directory module
Import-Module ActiveDirectory

# Add a function to quickly connect to a remote machine via RDP
function rdp {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ComputerName
    )
    mstsc /v:$ComputerName
}

# Add a function to quickly flush the DNS cache
function flushdns {
    ipconfig /flushdns
}

# Add a function to quickly clear the PowerShell console
function clear-console {
    if ($Host.UI.RawUI.BufferSize.Height -gt 50) {
        $Host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(120, 50)
    }
    Clear-Host
}



# Set the color scheme for the PowerShell console
$Host.UI.RawUI.ForegroundColor = [System.ConsoleColor]::DarkCyan
$Host.UI.RawUI.BackgroundColor = [System.ConsoleColor]::Black

# Set the font and font size for the PowerShell console
$Font = New-Object System.Drawing.Font("Consolas",16,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point)
$Host.UI.RawUI.WindowTitle = "Cyber Assurance Team"
$Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(120,50)
$Host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(120,50)
$Host.UI.RawUI.FontFamily = $Font.FontFamily.Name
$Host.UI.RawUI.FontSize = $Font.Size
This profile.ps1 file does the following:

Customizes the prompt to display the current directory and Git branch.
Creates aliases for frequently used commands, such as l for Get-ChildItem.
Loads the Active Directory module.
Adds a function to quickly connect to a remote machine via RDP.
Adds a function to quickly flush the DNS cache.
Adds a function to quickly clear the PowerShell console.
Sets the color scheme, font, and font size for the PowerShell console.


$webUrl = "https://esf17lagov.sharepoint.com/sites/records"
$docLibName = "Records"

# Connect to SharePoint Online using the Connect-PnPOnline cmdlet from the SharePoint PnP PowerShell module
Connect-PnPOnline -Url $webUrl

# Get the SharePoint folder object and the server-relative path of the folder
$folder = Get-PnPFolder -Name $docLibName
$serverRelativeUrl = $folder.ServerRelativeUrl

# Map the SharePoint folder to a PowerShell drive
New-PSDrive -Name "SP" -PSProvider FileSystem -Root "\\yourtenantname.sharepoint.com@SSL\DavWWWRoot$serverRelativeUrl" -Credential (Get-Credential)



$message = ""

# Perform some actions and append messages to the $message variable
$message += "Action 1 completed successfully.`n"
$message += "Action 2 completed successfully.`n"
$message += "Action 3 completed successfully.`n"

# Output the message to the user terminal screen
Write-Output $message