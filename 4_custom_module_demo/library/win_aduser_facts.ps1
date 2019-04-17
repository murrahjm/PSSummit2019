#Requires -Module Ansible.ModuleUtils.Legacy
#Requires -Module ActiveDirectory

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

#convert our "$args" json blob into a psobject with a property for each "parameter"
$params = Parse-Args -arguments $args -supports_check_mode $true

#since this module doesn't change anything, there isn't nay need for check mode or diff mode
#these are just included for your viewing pleasure
$check_mode = Get-AnsibleParam -obj $params -name "_ansible_check_mode" -type "bool" -default $false
$diff_mode = Get-AnsibleParam -obj $params -name "_ansible_diff" -type "bool" -default $false

#create "parameter" variables for our input args
$filter_property = Get-AnsibleParam -obj $params -name "filter_property" -type "str" -failifempty $true
$filter_match_type = Get-AnsibleParam -obj $params -name "filter_match_type" -type "str" -validateSet "exact","partial" -default "exact"
$filter_value = Get-AnsibleParam -obj $params -name "filter_value" -type "str" -failifempty $false
$return_properties = Get-AnsibleParam -obj $params -name "return_properties" -type "list" -default "samaccountname"
$domain_name = Get-AnsibleParam -obj $params -name "domain_name" -type "string" -failifempty $false

#create our output object with the bare minimum value
$return = @{
    changed = $false
}
if ($filter_match_type -eq "exact"){
    $filterstring = "$filter_property -eq `'$filter_value`'"
} else {
    $filterstring = "$filter_property -like `'*$filter_value*`'"
}

Try {
    if ($null -eq $domain_name){
        $result = get-aduser -filter $filterstring -Properties $return_properties | select-object $return_properties
        $return.ansible_facts = $result
    } else {
        $result = get-aduser -filter $filterstring -Properties $return_properties -server $domain_name | select-object $return_properties
        $return.ansible_facts = $result

    }
} Catch {
    #if no users are found then just return successful but empty
    #if some other error then fail
    If ($_.CategoryInfo.Reason -ne "ADIdentityNotFoundException"){
        fail-json -obj $return -message "Error querying AD: $_"
    } else {
        $return.ansible_facts = ''
    }
}

exit-json $return