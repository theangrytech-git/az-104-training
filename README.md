# az-104-training<br>
The intent is to deploy a set of Users, in Groups, with Storage Accounts, VM's, with some vnet peering, in an attempt to create a badly configured environment where users would need to apply the knowledge gained from AZ-104 to remedy it.<br>
This is going to be deployed using TF to allow people to spin it up as needed, and destroy it, without spending hours on building an environment and incurring costs while doing it, and THEN using the environmnet to train in.<br>
<br>
This for now is a VERY rough first-draft, so some of the Terraform Code WILL be re-written to be neater/smoother.<br>
<br>
########
<br>
WIP:<br>
Create a set of Users based off a CSV - Completed<br>
Create a series of Groups based off Dept Names from a CSV - completed<br>
Add Users to Groups based on Dept Name - In Progress<br>
Create Role Assignments and assign to Groups - In Progress<br>
<br>
Future Tasks:<br>
Create RG's spread across UK South, UK West, and West Europe<br>
Split Depts between those 3 RG's<br>
Create SA's for Depts<br>
Create SA for use between Dept<br>
Create VM's for use in each Region<br>
Peer UKS - WKW, and UKW - WEU<br>
