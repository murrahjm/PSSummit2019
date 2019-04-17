[DscLocalConfigurationManager()]
Configuration LCMSettings {
    Node localhost 
    {
        Settings
        {
            RefreshMode = 'Disabled'
            RebootNodeIfNeeded = $True
        }
    }
}
LCMSettings
Set-DscLocalConfigurationManager -Path .\LCMSettings -Verbose 
