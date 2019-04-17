[DscLocalConfigurationManager()]
Configuration LCMSettings {
    Node localhost 
    {
        Settings
        {
            RefreshMode = 'Disabled'
            RebootNodeIfNeeded = $false
        }
    }
}
LCMSettings
Set-DscLocalConfigurationManager -Path .\LCMSettings -Verbose 
