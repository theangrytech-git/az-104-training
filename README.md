# az-104-training
The intent is to deploy a set of Users, in Groups, with Storage Accounts, VM's, with some vnet peering, in an attempt to create a badly configured environment where users would need to apply the knowledge gained from AZ-104 to remedy it.
This is going to be deployed using TF to allow people to spin it up as needed, and destroy it, without spending hours on building an environment and incurring costs while doing it, and THEN using the environmnet to train in.

This for now is a VERY rough first-draft, so some of the Terraform Code WILL be re-written to be neater/smoother.

########

WIP:
Create a set of Users based off a CSV - Completed
Create a series of Groups based off Dept Names from a CSV - completed
Add Users to Groups based on Dept Name - In Progress
Create Role Assignments and assign to Groups - In Progress

Future Tasks:
Create RG's spread across UK South, UK West, and West Europe
Split Depts between those 3 RG's
Create SA's for Depts
Create SA for use between Dept
Create VM's for use in each Region
Peer UKS - WKW, and UKW - WEU
