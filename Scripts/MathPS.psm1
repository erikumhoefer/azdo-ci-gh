
Function Divide-Integers
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [int]
        $FirstNum,
    
        [Parameter(Mandatory=$true)]
        [int]
        $SecondNum
    )
    
    if ($SecondNum -eq 0)
    {
        throw "Cannot divide by zero."
    }
    
    $result = $FirstNum / $SecondNum
    Write-Host "$FirstNum / $SecondNum = $result"
    $result
}