function pcCsvGenerator {
    $domainName = (Get-WmiObject -Class Win32_ComputerSystem -Property Name).Name.Substring(0,6).ToLower()

    Add-Content -Path bulk_pcs.csv -Value "pcName`n"
    for($a=1; $a -le 100; $a++) {
        $b = $a.ToString("000")
        Add-Content -Path bulk_pcs.csv -Value "$domainName$b`n"
    }
}
pcCsvGenerator