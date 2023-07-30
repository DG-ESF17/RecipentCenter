
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


<#
-  ESF17 | Statewide Cyber Incident Management
-  PowerShell Profile
-  Created: 03/30/2023
#>
Clear-Host
#set directory
    # Set-Location C:\Users\dmg\Documents\P$
#import functions
    # ". .\DG-P$-Functions.ps1"
    # ". .\InfoSec-PS-Functions-v.02.ps1"
    # Import-Module SSH-Sessions
    # # Import-IST-Module
    # https://www.microsoft.com/en-us/download/details.aspx?id=45520
    (New-Object -TypeName System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
    # load all 'autoload' scripts
    # $team_dir="\\fsdoasrv02\FSOIT\InfoSec\!_Configs&Scripts\MS_PowerShell\!_Team_Functions"
    # Get-ChildItem "${psdir}\*.ps1" | %{.$_}
#aliases
    set-alias nmap 'C:\Program Files (x86)\Nmap\nmap.exe'
    Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'
    #Set-IST-Alias
#console Color (THEME) Stuff  ==> # DG Console Color Values: Black="26,26,26" Magenta="146,0,255" Cyan="0,180,255" Yellow="255,195,0" Red="215,30,0" Blue="30,80,255"
    #Every Color setting you could possibily want
    [console]::ForegroundColor = "Cyan"
    [console]::BackgroundColor = "Black"
    $host.PrivateData.ProgressBackgroundColor = "Black"
    $host.PrivateData.ErrorForegroundColor = "Red"
    $host.PrivateData.ErrorBackgroundColor = "Black"
    $host.PrivateData.WarningForegroundColor = "Yellow"
    $host.PrivateData.WarningBackgroundColor = "Black"
    $host.PrivateData.DebugForegroundColor = "Yellow"
    $host.PrivateData.DebugBackgroundColor = "Black"
    $host.PrivateData.VerboseForegroundColor = "Yellow"
    $host.PrivateData.VerboseBackgroundColor = "Black"
    $host.PrivateData.ProgressForegroundColor = "Yellow"
    $host.PrivateData.ProgressBackgroundColor = "Black"
    Set-PSReadlineOption -TokenKind None -ForegroundColor Cyan
    # Set-PSReadlineOption -TokenKind None -BackgroundColor COLOR
    # Set-PSReadlineOption -TokenKind Keyword -ForegroundColor COLOR
    # Set-PSReadlineOption -TokenKind Keyword -BackgroundColor COLOR
    Set-PSReadlineOption -TokenKind String -ForegroundColor Gray
    # Set-PSReadlineOption -TokenKind String -BackgroundColor COLOR
    Set-PSReadlineOption -TokenKind Operator -ForegroundColor Cyan
    # Set-PSReadlineOption -TokenKind Operator -BackgroundColor COLOR
    Set-PSReadlineOption -TokenKind Variable -ForegroundColor Blue
    # Set-PSReadlineOption -TokenKind Variable -BackgroundColor COLOR
    # Set-PSReadlineOption -TokenKind Parameter -ForegroundColor COLOR
    # Set-PSReadlineOption -TokenKind Parameter -BackgroundColor COLOR
    # Set-PSReadlineOption -TokenKind Type -ForegroundColor COLOR
    # Set-PSReadlineOption -TokenKind Type -BackgroundColor COLOR
    Set-PSReadlineOption -TokenKind Number -ForegroundColor White
    # Set-PSReadlineOption -TokenKind Number -BackgroundColor COLOR
    # Set-PSReadlineOption -TokenKind Member -ForegroundColor COLOR
    # Set-PSReadlineOption -TokenKind Member -BackgroundColor COLOR
    Set-PSReadlineOption -TokenKind Command -ForegroundColor Magenta
    # Set-PSReadlineOption -TokenKind Command -BackgroundColor COLOR
    # Set-PSReadlineOption -TokenKind Comment -ForegroundColor COLOR
    # Set-PSReadlineOption -TokenKind Comment -BackgroundColor COLOR
#get PS Version
    $psv = $PSVersionTable.PSVersion
    $psv_mjr = $psv.Major
    $psv_mnr = $psv.Minor
#start
    AzureADPreview\Connect-AzureAD
    Clear-Host
    # Welcome message
    $user = $env:Username
    #get current context
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
    & {
        #if admin
        if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {
            clear-host
            write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
            write-host "Cyber Assurance Team`n" -f "black" -b "white"
            write-host "#Admin Sesh`n" -f "white" -b "darkred"
            $Host.UI.RawUI.WindowTitle = "#Admin | Cyber Assurance Team"
        }
        #if not admin
        else {
            $Host.UI.RawUI.WindowTitle = "Cyber Assurance Team| PowerShell"
            write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
            write-host "Information Security Team`n" -f "black" -b "white"
        }
    }
    function Prompt {
        if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
            '#ADMIN' + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '
        }
        else {
            'PS' + $(if ($nestedpromptlevel -ge 1) { '>>' }) + '> '
        }
    }

    cd "C:\"
##WillDoMoarLater##-DG