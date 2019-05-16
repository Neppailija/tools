# NLA tool

param (
    [Parameter(ParameterSetName="set")][switch]$set
    [Parameter(ParameterSetName="get")][switch]$get
    [string]$inputfile = ".\hosts.txt"
    [string]$target = ""
    )

try {
    hosts = get-content $inputfile
    } 
    catch {
    write-host "Input file not found. Please specify a path to txt file containing target hosts"
    exit
    }

if ($set == ) {
    (Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName $ComputerName -Filter "TerminalName='RDP-tcp'").UserAuthenticationRequired
}

foreach ($computer in $hosts) {

}


# Check the NLA settings


# Enable NLA
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName $ComputerName -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(1)

# Disable NLA
(Get-WmiObject -class "Win32_TSGeneralSetting" -Namespace root\cimv2\terminalservices -ComputerName $ComputerName -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0)
