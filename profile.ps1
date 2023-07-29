<#
-   Owner: cyber.la.net | Statewide Cyber Services for the Great State of Louisiana
-   Purpose: PowerShell Profile for Trusted Team Members
-   Created: 2023.03.30
-   Update: 2023.07.23 ## <i>We official baby!!</i>
-   -----------------------------------------------
-   Notes:
-       This $profile is required for the purposes of easing the burden on
-       team members for creating and supporting a reliable powershell terminal env.  
-           ## Spcial_Note: Shhhh just take it...  and then make it better. :)
-            -DG
-
#>
Clear-Host
write-verbose   "Oh Snap! I never get to talk to anyone around here!"
#set proxy auth
(New-Object -TypeName System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
#set directory
# Set-Location C:\Users\dmg\Documents\P$
# check for repos


# assign and trust repos


#install packages

#import functions
# ". .\DG-P$-Functions.ps1"
# ". .\InfoSec-PS-Functions-v.02.ps1"
# Import-Module SSH-Sessions
# # Import-IST-Module
# https://www.microsoft.com/en-us/download/details.aspx?id=45520

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
# Set-PSReadlineOption -TokenKind None -ForegroundColor Cyan
# Set-PSReadlineOption -TokenKind None -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Keyword -ForegroundColor COLOR
# Set-PSReadlineOption -TokenKind Keyword -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind String -ForegroundColor Gray
# Set-PSReadlineOption -TokenKind String -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Operator -ForegroundColor Cyan
# Set-PSReadlineOption -TokenKind Operator -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Variable -ForegroundColor Blue
# Set-PSReadlineOption -TokenKind Variable -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Parameter -ForegroundColor COLOR
# Set-PSReadlineOption -TokenKind Parameter -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Type -ForegroundColor COLOR
# Set-PSReadlineOption -TokenKind Type -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Number -ForegroundColor White
# Set-PSReadlineOption -TokenKind Number -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Member -ForegroundColor COLOR
# Set-PSReadlineOption -TokenKind Member -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Command -ForegroundColor Magenta
# Set-PSReadlineOption -TokenKind Command -BackgroundColor COLOR
# Set-PSReadlineOption -TokenKind Comment -ForegroundColor COLOR
# Set-PSReadlineOption -TokenKind Comment -BackgroundColor COLOR
#get PS Version
$psv = $PSVersionTable.PSVersion
$psv_mjr = $psv.Major
$psv_mnr = $psv.Minor
#start
# AzureADPreview\Connect-AzureAD
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
        write-host "ESF17 - Cyber Assurance Team`n" -f "black" -b "white"
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

# cd "C:\"
##WillDoMoarLater##-DG