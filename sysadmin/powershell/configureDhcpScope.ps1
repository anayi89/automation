function configureDhcpScope {
    $firstRange = Read-Host -Prompt 'Enter the first IP address of the DHCP scope'
    $lastRange = Read-Host -Prompt 'Enter the last IP address of the DHCP scope'
    $subnetMask = Read-Host -Prompt 'Enter the subnet mask'
    $dnsServer = Read-Host -Prompt 'Enter the IP address of the DNS server'
    $defaultGateway = Read-Host -Prompt 'Enter the router IP address'
    $dhcpScope = Read-Host -Prompt 'Enter the IP address of the scope ID'

    # set up the DHCP scope of the clients' IP address
    Add-DhcpServerV4Scope -Name "DHCP Scope" -StartRange $firstRange -EndRange $lastRange -SubnetMask $subnetMask

    # add the DNS server and the router's IP address
    Set-DhcpServerV4OptionValue -DnsServer $dnsServer -Router $defaultGateway

    # set up the duration of the DHCP lease
    Set-DhcpServerv4Scope -ScopeId $dhcpScope -LeaseDuration 1.00:00:00
}
configureDhcpScope