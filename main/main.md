It is good to separate the code into several files in order to
improve the readability of the code and its evolution.
Using our example script, we can do better by separating it with the following:
• Rg.tf: This contains the code for the resource group.
• Network.tf: This contains the code for the VNet and subnet.
• Compute.tf: This contains the code for the network interface, public IP, storage,
and virtual machine.
