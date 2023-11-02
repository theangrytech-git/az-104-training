# AZ-104-training<br>
<details>
<summary><b>What is this?</b></summary>
<br>
The intent is to: <br><br> 
<i>Create a set of Users<br>
Create a Groups<br>
Create a number of Virtual Networks and Subnets<br>
Create a number of Storage Accounts in 3 Regions<br>
Create a number of Network Security Groups<br>
Deploy a number of VM's and VMSS's in 3 Regions<br>
Create a Static Site in 3 Regions<br>
Create 2 Network Peerings between 3 Regions<br> 
Create a Bastion in 1 Region</i><br>
<br>
This is to create a badly configured environment where users would need to apply the knowledge gained from AZ-104 to remedy it and improve it. A High-Level Design will find it's way in here soon, so you can see the Resources deployed.<br><br>
This is going to be deployed using TF to allow people to spin it up as needed, and destroy it, without spending hours on building an environment and incurring costs while doing it, and THEN using the environmnet to train in, and keeping it running until they've completed their training because they don't want to tear it all down and manually rebuild it.<br>
<br>
This for now is a VERY rough first-draft, so some of the Terraform Code WILL be re-written to be neater/smoother.<br>
<br>
</details>
<br>
<details>
<summary><b>What do I need to try this?</b></summary>
<br>
To use this, you'll need to have the following:<br>
<br><i>
Install Terraform (https://developer.hashicorp.com/terraform/downloads)<br>
Install Visual Studio Code (https://code.visualstudio.com)<br>
Install Github (https://github.com/git-guides/install-git)<br>
Create an Azure Subscription (https://portal.azure.com/)<br>
Install Azure CLI (https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
</i><br>
</details>
<br>
<details>
<summary><b>How much will this cost, roughly? Do I need a second mortage, Gofundme, other revenue streams?</b></summary>
<br>
I've tried to make this <i>as cheap as possible</i> to run, while giving you the experience of seeing as close to a Real-World scenario as possible.
At the moment, as of Nov 2023, it's costing <b>£9.70</b> to run this setup in a <b>Single Region per day</b>. To run all three Regions, it would cost an <b>estimated £29.10 per day</b>.
<br>
</details>
<br>
<details>
<summary><b>How can I reduce that cost?</b></summary>
<br>
There are several ways to reduce that cost:<br>
1) Sign up to Azure Portal - if it's your first time, you will get a credit of $200 for 30 days. In addition, you'll get to use some resources (At a lower SKU) for free for that month. After that, you may find some resources are still free to use up to 12 months (Some VM's will offer 750 hrs over 12 months, for example). A full list of what's available can be found here: https://azure.microsoft.com/en-gb/pricing/free-services)<br><br>
2) Free Credits - If you have a Visual Studio licence, you will get monthly Azure Credits to use. As of Nov 2023, they are:<br>
<b>Visual Studio Professional</b> - $50 USD<br>
<b>MSDN Platforms</b> - $100<br>
<b>Visual Studio Enterprise</b> - $150<br><br>
3) Azure for Students - Azure for Students offers $100 in Azure Credits to use within 12 months, plus select free services without needing a credit card. To qualify, you need to be 18+ years of age, be on an accredited degree-granting course between 2-4 years, as a full-time student, and apply using your organisation's email address. It's not available for use if you're using an Online Course (Why, I'm not sure. Full-time study is full-time study...) or in professional training from a for-profit organisation. A full list of requirements can be found here: https://azure.microsoft.com/en-us/pricing/offers/ms-azr-0170p/<br><br>
4) Cost Alerting - Setup a Budget, based on how much you're willing to spend. This will be covered during the training (And if you're here, you've likely got an idea on how to do this). This will create a budget for you monthly/quarterly, over a period of time, and will send out alerts if you hit % of your budget. You can also create a Cost Alert based on any sudden increases in your environment.
</details>
<br>
<details>
<summary><b>How can I use this to study for my AZ-104?</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
