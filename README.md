# Azure Dedicated host

This script can move Azure IaaS VM to Azure Dedicated Host using Azure Powershell. A VM can only be provisioned on Dedicated Host when it is created. To change the VM host from IaaS to Dedicated Host, you need to delete and then recreate the virtual machine.

This script provides an example of gathering the required information, deleting the original VM and then recreating it on a Dedicated Host.

## Powershell script to move existing Azure IaaS VM to Azure Dedicated Host

Items to note,
* Script is to move existing Azure IaaS VM to Azure Dedicated Host
* You will have to supply VM name under $VM variable and change $hostname, $HGName, and $resourceGroupName variable values as per your Azure environment.
* $virtualMachineSize - supply accurate VM size based on your requirement and Dedicated Host Type
* Script will delete IaaS VM and recreate the VM on specified Dedicated Host by attaching the same OS disk, Data disk and vNIC.
