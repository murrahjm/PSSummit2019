#!/usr/bin/pwsh
# POWERSHELL_COMMON

$ErrorActionPreference='Stop'

$params = Parse-Args $args -supports_check_mode $true
$check_mode = Get-AnsibleParam -obj $params -name "_ansible_check_mode" -type "bool" -default $false
$name = Get-AnsibleParam -obj $params -name 'name' -type 'string'
$value = Get-AnsibleParam -obj $params -name 'value' -type 'int32' -validateset '1','2','3'


Try {
    

} Catch {
    fail-json $_.tostring()
}
