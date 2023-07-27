vnet subnet -n $subnetName -v $vnetName -g $rgName -a $subnetAddressPrefix

create azure network with multiple subnets
$vnetName = "vnet1"
$rgName = "rg1"
$subnetName = "subnet1"
$subnetAddressPrefix = "10.10.10.0/24"
$subnetName2 = "subnet2"
$subnetAddressPrefix2 = "10.10.11.0/24"
$subnetName3 = "subnet3"
$subnetAddressPrefix3 = "10.10.1.0/24"

vnet -n $vnetName -g $rgName -a "$subnetAddressPrefix,$subnetAddressPrefix2,$subnetAddressPrefix3" -s "$subnetName,$subnetName2,$subnetName3"
