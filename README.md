# AZ-104-training<br>
<br>
<br>
<B> THIS SECTION IS A WIP - SOON TO CONTAIN TASKS FOR AZ-104</B>
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
An account on the Azure subscription that has an Owner role<br>
</i><br>
</details>
<br>
<details>
<summary><b>How much will this cost, roughly? Do I need a second mortage, Gofundme, other revenue streams?</b></summary>
<br>
I've tried to make this <i>as cheap as possible</i> to run, while giving you the experience of seeing as close to a Real-World scenario as possible.
At the moment, as of Nov 2023, it's costing <b>£9.70</b> to run this setup in a <b>Single Region per day</b>. To run all three Regions, it would cost an <b>estimated £29.10 per day. There are elements that will require a P2 licence for things like MFA, PIM, etc. Where possible, use the free trial for 30 days. But this might be something you'll have to bite down and pay for, for the short period of time you need to use it for.</b>.
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

<b>Clone the Repo first</b><br>
1) In Visual Studio, navigate to where you want to store your Github repos. Usually 'CD C:\Users\%YOURNAME%\Desktop\Github' or 'CD C:\Users\%YOURNAME\Github' will do. Just make sure the folder exists first<br>
2) Run 'git clone https://github.com/theangrytech-git/az-104-training.git' to clone the repo to your device.<br>
You should now see a repo appear in Explorer with folders and files relating to this repo.
<br>
<br>
<b>Performing a Terraform Init</b><br>
1) Within Visual Studio's terminal window, run the command 'az login' and sign into your Azure portal when prompted.<br>
2) Select the Subscription that you want to install this to using the following command: 'az account set --subscription "NAMEOFYOURSUBSCRIPTION"'. Once you've done that, run the command 'az account show' and confirm that the subscription displayed matches the one in your Azure portal.<br>
3) Navigate to the repo environment folder using the command 'cd .\az-104-training\environment\' and run the command 'terraform init'. You will now see a message to say 'Terraform initalised'.<br>
4) Perform a Terraform Plan by using `terraform plan -var-file="env.tfvars" -no-color > tfplan.txt`. You will now see a file created called tfplan.txt. You will now see a list of resources that will be created for the first time, but as a rule:<br>
- The `~` symbol is used to represent resources which will be <b>**modified**</b><br>
- The `+` symbol is used to represent resources which are being <b>**created**</b><br>
- The `-` symbol is used to represent resources which are being <b>**destroyed**</b><br>
As this is the first time running this, you should see every resource listed as being created, and nothing being modified or destroyed. If you do, review those resources immediately to confirm what/where/when and why.<br>
5) Perform a Terraform Apply by running the following command: 'terraform apply -var-file="env.tfvars"`. This will run a quick Terraform Plan to confirm what resources are being deployed - once you've reviewed them, type 'yes' and press 'enter'. This will take between 5-10 minutes to fully apply, and at the end of it you'll see a message to say 'Apply complete! Resources: x added, x changed, x destroyed.'
<br>
<b>Final check</b><br>
1) Log into your Azure portal, and click on 'Resources'.<br>
2) You will now see all of the resources that have been deployed through Terraform.<br>
3) Once you have finished with this, run a 'terraform delete -var-file="env.tfvars"' command and confirm you want to delete all of the resources.<br>
</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>
<br>
<br>
<details>
<summary><b>My section header in bold</b></summary>

Any folded content here. It requires an empty line just above it.

</details>

