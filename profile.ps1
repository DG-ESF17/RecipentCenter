<#
-   Owner: cyber.la.gov | Statewide Cyber Services for the Great State of Louisiana
-   Purpose: PowerShell Profile for Trusted Team Members
-   Created: 2023.03.30
-   Update: 2023.07.23 ## <i>We official baby!!</i>
-   -----------------------------------------------
-       Notes:
-           This $profile is required for the purposes of reducing the burden on
-           team members for creating and supporting a reliable powershell terminal env.  
-               ## [Special_Note]: Shhhh just take it...  and then make it better. :)
-           -DG
#>
#Vars Son

# TODO: Add a function to quickly connect to storage
# $env:PSModulePath = $env:PSModulePath + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"
# $env:Path = $env:Path + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"

write-verbose   "Getting my vars together..."
$message = ""
Test-Path $profile
#get current ps version and user details
$psv = $PSVersionTable.PSVersion
$psv_mjr = $psv.Major
$psv_mnr = $psv.Minor
$user = $env:Username
$name = "Cyber Assurance Team"
$user = $env:Username
$reposadded = ""
write-verbose   "Setting proxy auth..."
(New-Object -TypeName System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
#get current context
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
#1.0 proxy auth

write-verbose   "Checking Internets..."
#1.01 confirm internet connectivity
function Test-InternetConnection {
    try {
        $pingResult = Test-Connection -ComputerName "www.google.com" -Count 1 -ErrorAction SilentlyContinue
        if ($pingResult -eq $null) {
            $message += "Internet Testing Incidates a potential issues.`n"
            $internet = $false
        } else {
            $message += "Internet Tested Successfully.`n"
            $internet = $true
        }
    }
    catch {
        $message += "An error occurred: $($_.Exception.Message)`n"
        $internet = $false
    }
    finally {

    }
}

#get current context
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
& {
    #if admin
    if ($currentPrincipal.IsInRole( [Security.Principal.WindowsBuiltInRole]::Administrator )) {
        clear-host
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "$name `n" -f black -b white
        write-host "#Admin Sesh`n" -f $white -b "darkred"
        $Host.UI.RawUI.WindowTitle = "#Admin | $name"
    }
    #if not admin
    else {
        $Host.UI.RawUI.WindowTitle = "$name | PowerShell"
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "$name `n" -f black -b white
    }
}

# Welcome message
$message += "Welcome $user to the Cyber Assurance Team PowerShell Profile1`n"
$message += "PowerShell version is $psv_mjr.$psv_mnr`n"
$message += "Profile path is $profile`n"
$message += "Profile last updated on $profile.LastWriteTime`n"

#verbose
write-verbose   "Setting up profile for trusted team members..."
write-verbose   "Checking PowerShell version..."
write-verbose   "PowerShell version is $psv_mjr.$psv_mnr"
#set execution policy
write-verbose   "Setting execution policy..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force
#set proxy
write-verbose   "Setting proxy..."

#set directory
write-verbose   "Setting directory..."
#TODO: Set-Location C:\Users\dmg\Documents\GitHub\DG-P$
#set env vars
write-verbose   "Setting environment variables..."

#set aliases
write-verbose   "Setting aliases..."

Set-Alias nmap 'C:\Program Files (x86)\Nmap\nmap.exe'

Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'

# New-Alias np Notepad.exe
     
# Create aliases for frequently used commands
Set-Alias tn Test-NetConnection
Set-Alias myip Get-NetIPAddress
Set-Alias mygw Get-NetRoute
Set-Alias mydns Get-DnsClientServerAddress
Set-Alias mymac Get-NetAdapter

$background = "black"
$foreground = "darkcyan"

function set-terminal {
    Write-Verbose "This will only take a second... :)"
    #profesionally set the title
    $host.UI.RawUI.WindowTitle = $name
    #you can change the colors to whatever you want
        #but I like this color scheme
        $Host.UI.RawUI.ForegroundColor = $foreground
        $Host.UI.RawUI.BackgroundColor = $background
        $host.PrivateData.ProgressBackgroundColor = $background
        $host.PrivateData.ErrorForegroundColor = "red"
        $host.PrivateData.ErrorBackgroundColor = "black"
        $host.PrivateData.WarningForegroundColor = "yellow"
        $host.PrivateData.WarningBackgroundColor = "black"
        $host.PrivateData.DebugForegroundColor = "magenta"
        $host.PrivateData.DebugBackgroundColor = "black"
        $host.PrivateData.VerboseForegroundColor = "magenta"
        $host.PrivateData.VerboseBackgroundColor = "black"
        $host.PrivateData.ProgressForegroundColor = "blue"
        $host.PrivateData.ProgressBackgroundColor = "black"
        $Host.PrivateData.ErrorBackgroundColor = "darkcyan"
        $Host.PrivateData.ErrorForegroundColor = "red"
        $Host.PrivateData.WarningBackgroundColor = "darkcyan"
        $Host.PrivateData.WarningForegroundColor = "yellow"
        $Host.PrivateData.DebugBackgroundColor = "darkcyan"
}


function Test-PackageSituation {
    write-verbose   "Checking your package repos situation..."
    $repos = Get-PackageProvider
    $count = $repos.count
    if ($count -lt 1) {
        Write-Warning  "No repos found.  Adding repos..."
        try {
                write-verbose   "Adding psgallery repo..."
                Register-PackageSource -Name psgallery -ProviderName PowerShellGet -Trusted -Force
                $reposadded = "PSGallery`n"
            } catch {
                Write-Warning "An error occurred: $($_.Exception.Message)`n"
        }
        try {
                write-verbose   "Adding nuget repo..."
                Register-PackageSource -Name nuget -ProviderName NuGet -Location https://www.nuget.org/api/v2 -Trusted -Force
                $reposadded = "NuGet Repository`n"
            } catch {
                Write-Warning "An error occurred: $($_.Exception.Message)`n"
        }
    }
    elseif ($count -lt 2) {
        if ($repos -notcontains "nuget") {
            write-verbose   "No repos for NuGet Found.  Adding repo..."
            try {
                    Write-Warning   "Adding nuget repo..."
                    Register-PackageSource -Name nuget -ProviderName NuGet -Location https://www.nuget.org/api/v2 -Trusted -Force
                    $reposadd += "NuGet Repository`n"
                } catch {
                    Write-Warning "An error occurred: $($_.Exception.Message)`n"
            }
        }
        if ($repos -notcontains "psgallery") {
            try {
                write-verbose   "Adding psgallery repo..."
                Register-PackageSource -Name psgallery -ProviderName PowerShellGet -Trusted -Force
            } catch {
                $message += "An error occurred: $($_.Exception.Message)`n"
            }
        }
    }
    Write-Host "Repos added: $reposadded" -ForegroundColor Green
}

Test-InternetConnection
Test-PackageSituation
set-terminal