function configureDnsServer {
    # forward lookup zone
    $dnsAddress = Read-Host -Prompt 'Enter the DNS server IP address'
    $dnsZone = Read-Host -Prompt 'Enter a domain name'
    $dnsZoneFile = $dnsZone + ".dns"
    Add-DnsServerPrimaryZone -Name $dnsZone -zonefile $dnsZoneFile -DynamicUpdate NonsecureAndSecure

    # A DNS Record
    Add-DnsServerResourceRecordA -Name Client123 -ZoneName $dnsZone -AllowUpdateAny -IPv4Address $dnsAddress -TimeToLive 01:00:00
}
configureDnsServer