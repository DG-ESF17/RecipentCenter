<#
-   Owner: cyber.la.net | Statewide Cyber Services for the Great State of Louisiana
-   Purpose: PowerShell Profile for Trusted Team Members
-   Created: 2023.03.30
-   Update: 2023.07.23 ## <i>We official baby!!</i>
-   -----------------------------------------------
-       Notes:
-           This $profile is required for the purposes of easing the burden on
-           team members for creating and supporting a reliable powershell terminal env.  
-               ## Spcial_Note: Shhhh just take it...  and then make it better. :)
-           
-             -DG
-
#>
Test-Path $profile
$psv = $PSVersionTable.PSVersion
$psv_mjr = $psv.Major
$psv_mnr = $psv.Minor
$user = $env:Username
# Welcome message
Write-Host "Welcome $user to the Cyber Assurance Team PowerShell Profile" -ForegroundColor Green
Write-Host "PowerShell version is $psv_mjr.$psv_mnr" -ForegroundColor Green
Write-Host "Profile path is $profile" -ForegroundColor Green
Write-Host "Profile last updated on $profile.LastWriteTime" -ForegroundColor $blue

#get current context
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
& {
    #if admin
    if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {
        clear-host
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "Cyber Assurance Team`n" -f $black -b $white
        write-host "#Admin Sesh`n" -f $white -b "darkred"
        $Host.UI.RawUI.WindowTitle = "#Admin | Cyber Assurance Team"
    }
    #if not admin
    else {
        $Host.UI.RawUI.WindowTitle = "Cyber Assurance Team| PowerShell"
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "ESF17 - Cyber Assurance Team`n" -f $black -b $white
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

#clear screen
Clear-Host
#verbose
write-verbose   "Setting up profile for trusted team members..."
write-verbose   "Checking PowerShell version..."
write-verbose   "PowerShell version is $psv_mjr.$psv_mnr"
#set execution policy
write-verbose   "Setting execution policy..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
#set proxy
write-verbose   "Setting proxy..."
#set proxy auth
write-verbose   "Setting proxy auth..."
(New-Object -TypeName System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
#set directory
write-verbose   "Setting directory..."
#TODO: Set-Location C:\Users\dmg\Documents\GitHub\DG-P$
#set env vars
write-verbose   "Setting environment variables..."

$env:PSModulePath = $env:PSModulePath + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"

$env:Path = $env:Path + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"

#set aliases
write-verbose   "Setting aliases..."

Set-Alias nmap 'C:\Program Files (x86)\Nmap\nmap.exe'

Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'

New-Alias np Notepad.exe
     
# Create aliases for frequently used commands
Set-Alias tn Test-NetConnection
Set-Alias myip Get-NetIPAddress
Set-Alias mygw Get-NetRoute
Set-Alias mydns Get-DnsClientServerAddress
Set-Alias mymac Get-NetAdapter

#set functions
write-verbose   "Setting functions..."
#set modules
write-verbose   "Setting modules..."
#set profile
write-verbose   "Setting profile..."
#set prompt
write-verbose   "Setting prompt..."
#set theme
write-verbose   "Setting theme..."
#set title
write-verbose   "Setting title..."
#set window size
write-verbose   "Setting window size..."
#set window position
write-verbose   "Setting window position..."
#set window color
write-verbose   "Setting window color..."
#set window font
write-verbose   "Setting window font..."
#set window transparency
write-verbose   "Setting window transparency..."
$Host.UI.RawUI.WindowOpacity = 0.75
#set window layout
write-verbose   "Setting window layout..."
#set window behavior
write-verbose   "Setting window behavior..."
#set window tabs
write-verbose   "Setting window tabs..."
#set window panes
write-verbose   "Setting window panes..."
#set window shortcuts
write-verbose   "Setting window shortcuts..."
#set window key bindings
write-verbose   "Setting window key bindings..."

# check for repos
write-verbose   "Checking your package repos situation..."
$repos = Get-PackageProvider
$count = $repos.count()

# Create a function to change colors in PowerShell
$black ='#1a1a1a'
$blue='#0037DA'
$cyan='#00b4ff'
$green='#13A10E'
$purple='#9200ff'
$red='#d71e00'
$white='#CCCCCC'
$yellow='#ffc300'

$background = $black
$foreground = $cyan

$name = "Cyber Assurance Team"

$user = $env:Username
#get current context
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )

function set-terminal
{

    Write-Verbose "This will only take a second... :)"
    #profesionally set the title
    $host.UI.RawUI.WindowTitle = $name
    $Host.UI.RawUI.CursorSize = 10
    #Consistentialy set the window size
    # $Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(120,50)
    # $Host.UI.RawUI.WindowPosition = New-Object System.Management.Automation.Host.Coordinates(0,0)
    # $Host.UI.RawUI.BufferSize = New-Object System.Management.Automation.Host.Size(120,50)
    # $Host.UI.RawUI.MaxPhysicalWindowSize = New-Object System.Management.Automation.Host.Size(120,50)
    # $Host.UI.RawUI.KeyBufferSize = New-Object System.Management.Automation.Host.Size(120,50)
    #you can change the colors to whatever you want
        #but I like this color scheme
    $Host.UI.RawUI.ForegroundColor = $foreground
    $Host.UI.RawUI.BackgroundColor = $background
    $host.PrivateData.ProgressBackgroundColor = $background
    $host.PrivateData.ErrorForegroundColor = $red
    $host.PrivateData.ErrorBackgroundColor = $black
    $host.PrivateData.WarningForegroundColor = $yellow
    $host.PrivateData.WarningBackgroundColor = $black
    $host.PrivateData.DebugForegroundColor = $purple
    $host.PrivateData.DebugBackgroundColor = $black
    $host.PrivateData.VerboseForegroundColor = $purple
    $host.PrivateData.VerboseBackgroundColor = $black
    $host.PrivateData.ProgressForegroundColor = $blue
    $host.PrivateData.ProgressBackgroundColor = $black
    $host.PrivateData.ProgressCompletedForegroundColor = $green
    $host.PrivateData.ProgressCompletedBackgroundColor = $black
    $host.PrivateData.ProgressErrorForegroundColor = $red
    $host.PrivateData.ProgressErrorBackgroundColor = $black
    $host.PrivateData.DisplayErrorForegroundColor = $red
    $host.PrivateData.DisplayErrorBackgroundColor = $black
    $host.PrivateData.DisplayWarningForegroundColor = $yellow
    $host.PrivateData.DisplayWarningBackgroundColor = $black
    $host.PrivateData.DisplayVerboseForegroundColor = $purple
    $host.PrivateData.DisplayVerboseBackgroundColor = $black
    $host.PrivateData.DisplayDebugForegroundColor = $purple
    $host.PrivateData.DisplayDebugBackgroundColor = $black
    $host.PrivateData.DisplayPromptForegroundColor = $white
    $host.PrivateData.DisplayPromptBackgroundColor = $black
    $host.PrivateData.DisplayEmphasisForegroundColor = $blue
    $host.PrivateData.DisplayEmphasisBackgroundColor = $black
    $Host.PrivateData.ErrorBackgroundColor = "darkcyan"
    $Host.PrivateData.ErrorForegroundColor = $red
    $Host.PrivateData.WarningBackgroundColor = "darkcyan"
    $Host.PrivateData.WarningForegroundColor = $yellow
    $Host.PrivateData.DebugBackgroundColor = "darkcyan"
}

set-terminal

if ($count -lt 3) {
    write-verbose   "No repos found.  Adding repos..."
    if($repos -notcontains "Chocolatey") {
        write-verbose   "Adding Chocolatey repo..."
        Register-PackageSource -Name chocolatey -ProviderName Chocolatey -Location http://chocolatey.org/api/v2/ -Trusted
    }
    if ($repos -notcontains "nuget") {
        write-verbose   "Adding nuget repo..."
        Register-PackageSource -Name nuget -ProviderName NuGet -Location https://www.nuget.org/api/v2 -Trusted
    }
    if ($repos -notcontains "psgallery") {
        write-verbose   "Adding psgallery repo..."
        Register-PackageSource -Name psgallery -ProviderName PowerShellGet -Location https://www.powershellgallery.com/api/v2 -Trusted
    }
}
else {
    write-verbose   "Repos found.  Moving on..."
}
