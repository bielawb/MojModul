param (
    $wersja = [System.Version]'0.1.0.0'
)

function Get-Data {
[OutputType('MojModul.Test')]
param (
	$wersja = $script:wersja,
	$uzytkownik = $env:USERNAME
)
    New-Object PSObject -Property @{
        Wersja = $wersja
        User = $Uzytkownik
        Data = Get-Date -Format g
    } | Foreach-Object {
        $_.PSTypeNames.Insert(0,'MojModul.Test')
        $_
    }
}

Export-ModuleMember -Function * -Variable * -Alias *