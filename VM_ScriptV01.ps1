# Provide VM name
$VM = 'vmtest01'

#Dedicated Host details
$hostname = 'dHosts01'
$HGName = 'HostGroup1'
$resourceGroupName = 'testing'

#Capture existing VM details
$VMName = Get-AzVM -Name $VM
$virtualMachineName = $VMName.Name
$osdisk = Get-AzDisk -Name ($VMName).StorageProfile.OsDisk.name
$ddisk01 = Get-AzDisk -Name ($VMName).StorageProfile.DataDisks.name

#Provide the size of the virtual machine
#D2s_v3,D4s, D8x, D16s, D32-8x, D32-16s, D32s, D48s, D64-16s, D64-32s D64s are supported on DSv3-Type2 dedicated host
$virtualMachineSize = 'Standard_D2s_v3'

#Remove existing VM
Remove-AzVM -Name $VM -ResourceGroupName $VMName.ResourceGroupName -Force

#Initialize virtual machine configuration
$dhost = Get-AzHost -Name $hostname -ResourceGroupName $resourceGroupName -HostGroupName $HGName
$VirtualMachine = New-AzVMConfig -VMName $virtualMachineName -HostId $dhost.id -VMSize $virtualMachineSize

#Use the Managed Disk Resource Id to attach it to the virtual machine. Please change the OS type to linux if OS disk has linux OS

$VirtualMachine = Set-AzVMOSDisk -VM $VirtualMachine -ManagedDiskId $osdisk.Id -CreateOption Attach -Windows
$virtualMachine =Add-AzVMDataDisk -CreateOption Attach -Lun 0 -VM $VirtualMachine -ManagedDiskId $ddisk01.Id
$VirtualMachine = Add-AzVMNetworkInterface -VM $VirtualMachine -Id (($VMName).NetworkProfile.NetworkInterfaces).id

#Create the virtual machine with Managed Disk
New-AzVM -VM $VirtualMachine -ResourceGroupName ($VMName).ResourceGroupName -Location ($VMName).Location