# Azure Dedicated host

#Powershell script to move existing Azure IaaS VM to Azure Dedicated Host

Items to note,
* Script is to move existing Azure IaaS VM to Azure Dedicated Host
* You will have to supply VM name under $VM variable and change $hostname, $HGName, and $resourceGroupName variable values as per your Azure environment.
* $virtualMachineSize - supply accurate VM size based on your requirement and Dedicated Host Type
* Script will delete IaaS VM and recreate the VM on specified Dedicated Host by attaching the same OS disk, Data disk and vNIC.
