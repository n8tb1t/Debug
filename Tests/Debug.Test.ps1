using module Debug

using module ColoredText
using module ..\Src\Rules\TreeViewRules.psm1

$object = New-Object ColoredText

$hash = @{
    digit = 4353534
    array = (1, 3, 4)
    hash = @{ hello = 'World' }
    round = 'String=(1.2,3)'
    square = '[String]'
    color = [ConsoleColor]::Gray
}

$array = ("String", '1.2.3', 100, (1, 3, 4), [ConsoleColor]::Gray)


class ClassName
{
    $property = 'String'
    [Boolean] method () { Return $false }
}



# Simple Collections

debug $object
debug $hash Table
debug $array Table
debug $array

#$array | Format-Table
#$hash | Format-Table


$rules = New-Object TreeViewRules

#$rules.rules | Format-Table | Out-String

debug $rules.rules[0] Table
$rules.rules | debug -View Table -TableStyle Rows
$rules.rules[0] | debug -View Table
$rules.rules[0].colors | debug -View Table

# Members View

debug $host Members
debug $host -View Members
$host | debug -View Members

debug $host Method
debug $host -View Method
$host | debug -View Method

debug $host Property
debug $host -View Property
$host | debug -View Property

# Tree View

debug $host 1
debug $host Tree
$host | debug -View Tree
$host | debug -Depth 2


# List View

$host | debug
$host | debug -View List
debug $host
debug $host List

# Table View

Get-Process | debug -View Table
debug (Get-Process) -View Table
Get-Module | debug -View Table -TableStyle Rows
debug (Get-InstalledModule) Table -TableStyle Columns
debug $host Table