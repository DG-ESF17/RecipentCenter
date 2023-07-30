<#
    .SYNOPSIS
        This file was created by and for the Cyber Assurance Team for the Great State of Louisiana
        as a means of providing a consistent and reliable PowerShell environment for our
        trusted team members.
    .DESCRIPTION
        This file is intended to be used as a 'profile.ps1' (a.k.a. $profile) for everyone for
        the main purposes of easing the burden of initial configuration but also the need for maintaining!
    .NOTES
        Shhhh just take it...  and then make it 🔥🔥. 😎 -DG
    .Created: 2023.03.30
    .Update: 2023.07.23 ## <i>We official baby!!</i>
    .LINK
        TODO: Add link to documentation page
    .COMPONENT
        $profile
    .FUNCTIONALITY
        This file is intended to be used as a profile.ps1 ($profile) for everyone for the purposes of providing
        a consistent and meaningful PowerShell environment for our trusted team members. 
#>

#Begin verbosity narration for debuggin purposes
write-verbose "Getting my vars together..."

#Vars Son
    # TODO: Add a function to quickly connect to storage
    # $env:PSModulePath = $env:PSModulePath + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"
    # $env:Path = $env:Path + ";C:\Users\dmg\Documents\GitHub\DG-P$\Modules"
$teamname = "Cyber Assurance Team"
$message = ""
$reposadded = 0
$booboo = 0
#Get Context
$psv = $PSVersionTable.PSVersion
$psv_mjr = $psv.Major
$psv_mnr = $psv.Minor
$user = $env:Username
$user = $env:Username
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal( [Security.Principal.WindowsIdentity]::GetCurrent() )
write-verbose   "Setting proxy auth..."
(New-Object -TypeName System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
#1.0 proxy auth
#Let's Go!🚀

function Test-InternetConnection {
    try {
        $pingResult = Test-Connection -ComputerName "www.google.com" -Count 1 -ErrorAction SilentlyContinue
        if (!($pingResult)) {
                $message += "Internet Testing Incidates a potential issues.`n"
                $booboo++
            } else {
                $message += "Internet Tested Successfully.`n"
        }
    }
    catch {
        $message += "An error occurred: $($_.Exception.Message)`n"
        $booboo++
    }
}

#get current context
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
& {
    #if admin
    if ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        clear-host
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "$teamname `n" -f black -b white
        write-host "#Admin Sesh`n" -f $white -b "darkred"
        $Host.UI.RawUI.WindowTitle = "#Admin | $teamname"
    }
    #if not admin
    else {
        $Host.UI.RawUI.WindowTitle = "$teamname | PowerShell"
        write-host "PS v$psv_mjr.$psv_mnr`n" -b gray -f black
        write-host "$teamname `n" -f black -b white
    }
}
#set execution policy
write-verbose   "Setting execution policy..."
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

#verbose
write-verbose   "Setting up profile for trusted team members..."
write-verbose   "Checking PowerShell version..."
write-verbose   "PowerShell version is $psv_mjr.$psv_mnr"

########## WELCOME MESSAGE ##########
$message += "Welcome $user to the Cyber Assurance Team PowerShell Profile1`n"
$message += "PowerShell version is $psv_mjr.$psv_mnr`n"
$message += "Profile path is $profile`n"
$message += "Profile last updated on $profile.LastWriteTime`n"

#set directory
write-verbose   "Setting directory..."
    #TODO: Set-Location C:\Users\dmg\Documents\GitHub\DG-P$
    #set env vars

#set aliases
write-verbose   "Setting aliases..."
########## ALIASES ##########
Set-Alias tn Test-NetConnection
Set-Alias myip Get-NetIPAddress
Set-Alias mygw Get-NetRoute
Set-Alias mydns Get-DnsClientServerAddress
Set-Alias mymac Get-NetAdapter
Set-Alias nmap 'C:\Program Files (x86)\Nmap\nmap.exe'
Set-Alias sublime 'C:\Program Files\Sublime Text 3\sublime_text.exe'

$background = "black"
$foreground = "darkcyan"

function set-terminal {
    Write-Verbose "This will only take a second... :)"
    #profesionally set the title
    $host.UI.RawUI.WindowTitle = $teamname
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
                $booboo++
        }
        try {
                write-verbose   "Adding nuget repo..."
                Register-PackageSource -Name nuget -ProviderName NuGet -Location https://www.nuget.org/api/v2 -Trusted -Force
                $reposadded = "NuGet Repository`n"
            } catch {
                Write-Warning "An error occurred: $($_.Exception.Message)`n"
                $booboo++
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
                    $booboo++
            }
        }
        if ($repos -notcontains "psgallery") {
            try {
                write-verbose   "Adding psgallery repo..."
                Register-PackageSource -Name psgallery -ProviderName PowerShellGet -Trusted -Force
            } catch {
                $message += "An error occurred: $($_.Exception.Message)`n"
                $booboo++
            }
        }
    }
    Write-Host "Repos added: $reposadded" -ForegroundColor Green
}

#print errors
if ($booboo -gt 0) {
    Write-Host  "There were $booboo errors.  Please review the above messages and fix the errors." -ForegroundColor Red
}
#buyyow!
write-verbose   "Checking Internets..."
Test-InternetConnection
write-verbose   "Checking your package.......  so to speak"
Test-PackageSituation
write-verbose   "and we are SET!"
Set-Terminal

# $webUrl = "https://esf17lagov.sharepoint.com/sites/records"
# $docLibName = "Records"
# Connect-PnPOnline -Url $webUrl
# # AzureADPreview\Connect-AzureAD
# # Get the SharePoint folder object and the server-relative path of the folder
