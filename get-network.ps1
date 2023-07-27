function FunctionName {
    param (
        $param1,
    ) 
}

# // create azure network with multiple subnets
$rgName = "rg1"

$vnetName = "vnet1"

$subnetName = "subnet1"
$subnetAddressPrefix = "10.10.10.0/24"

$subnetName2 = "subnet2"
$subnetAddressPrefix2 = "10.10.11.0/24"

$subnetName3 = "subnet3"
$subnetAddressPrefix3 = "10.10.1.0/24"

vnet -n $vnetName -g $rgName -a "$subnetAddressPrefix,$subnetAddressPrefix2,$subnetAddressPrefix3" -s "$subnetName,$subnetName2,$subnetName3"
