<details>
<summary>Scenario 1: Static Website Deployment</summary>

#### Task 1: Updating Static Website Storage Accounts
1. Navigate to Azure Portal:
2. Open the Azure Portal and log in with the appropriate credentials.
3. In the Azure Portal, go to the "Storage accounts" section.
4. Select the "uks_storage_general" storage account.
5. In the storage account settings, find the "Static website" section.
6. Enable the static website feature.
7. Set the "Index document name" to "index.html" and "Error document path" to "error.html."
8. Open the GitHub repository at the specified location: az-104-training/Info/Static Website for each 3 Region.
9. Upload the "index.html" and "error.html" files to the storage account from the GitHub repository.
10.	Repeat the process for the storage accounts in the North Europe and West Europe regions, ensuring region-specific details in the HTML files.
11.	Access the static website URL provided in the storage account settings.
12.	Confirm that the website displays the region-specific content.

</details>

<details>
<summary>Scenario 2: Virtual Network Integration</summary>

#### Task 1: Integrating Storage Accounts with Virtual Networks/Subnets
1.	Open the Azure Portal and log in with the appropriate credentials.
2.	In the Azure Portal, go to the "Storage accounts" section.
3.	Select the "uks_storage_general" storage account.
4.	Inside the storage account, find the "Settings" section in the left sidebar.
5.	Under "Settings," select "Firewall and virtual networks."
6.	In the "Firewall and virtual networks" section, set the "Allow access from" option to "Selected networks."
7.	Add the Virtual Network and Subnet configurations for the UK South region.
8.	Ensure that these settings are applied only to the UK South region's storage account.
9.	Save the changes and wait for the settings to take effect.

Configure Static Website Storage Account:
1.	Navigate to the "Static Website" section in the storage account settings.
2.	Ensure that the configurations allow the display of the Static Website index.html file.
3.	Confirm that the storage accounts in each region are accessible only by the specified Virtual Networks and Subnets.
4. Test the Static Website Storage Account to ensure it can display the Static Website index.html file.

</details>

<details>
<summary>Scenario 3: Understanding Azure Storage Services</summary>

#### Task 1: Creating Table Storage
1.	Open the Azure Portal and log in with the appropriate credentials.
2.	In the Azure Portal, go to the "Storage accounts" section.
3.	Select the "uks_storage_general," "neu_storage_general," and "weu_storage_general" storage accounts.
4.  For each storage account, find the "Table" sections in the settings.
5.	Add a table called 'Ordering' in the "storagegeneral" storage accounts.


#### Task 2: Creating Queue Storage
1.	Open the Azure Portal and log in with the appropriate credentials.
2.	In the Azure Portal, go to the "Storage accounts" section.
3.	Select the "uks_storage_general," "neu_storage_general," and "weu_storage_general" storage accounts.
4.  For each storage account, find the "Queue" sections in the settings.
5.	Add a queue called 'Alerts' in the "monitorig" storage accounts.


#### Task 3: Lock down the Storage Accounts in Tasks 1 & 2 to be accessible by resources in their respective Regions. 
1.	In the "Access control (IAM)" section, ensure that the access permissions are set to allow only resources within their respective regions.

</details>

<details>
<summary>Scenario 4: Creating Blob Storage</summary>

#### Task 1: Creating Blob Storage
1.	In the Azure Portal, go to the "Storage accounts" section.
2.	Select the "uksstoragedepts," storage accounts.
3.	Inside each storage account, navigate to the "Blob Containers" section.
4.	Create a blob container for each department (e.g., 'HR,' 'Finance,' 'IT').
5.  Repeat steps 3 and 4 for the "neustoragedepts" and "weustoragedepts" storage accounts

#### Task 2: Lock Blob Storage Down
1.	In the "Access control (IAM)" section, set access permissions to allow only users in the respective departments.
2.	Utilize Azure AD groups if necessary for better management.

</details>

<details>
<summary>Scenario 5: Blob Storage Authorization Adjustment</summary>

#### Task 1: Authorization Adjustment using Azure Storage Explorer
1.	Download and install Azure Storage Explorer.
2.  Open Azure Portal and sign in as normal
3.	Connect to the "uks_storage_general" storage accounts.
4.  Navigate to the Blob Storage accounts and click on IAM
5.	Adjust permissions to restrict access to specific Azure AD identities or groups 
6.  Sign into Azure Storage Explorer using an account that does not have appropriate permissions and try to access the Blob Container. You should be denied.
7.  Sign into Azure Storage Explorer using an account that DOES have appropriate permissions. You should have access to the Blob Container.
*** Note - you MAY need to adjust the Network Settings to whitelist your IP address ***

</details>

<details>
<summary>Scenario 6: Configuring Storage Replication</summary>

#### Task 1: Evaluate Currect Replication Settings for Storage Accounts
1.	In the Azure Portal, go to the "Storage accounts" section.
2.	Select the "uks_storage_general," "neu_storage_general," and "weu_storage_general" storage accounts.
3.	In each storage account, navigate to the "Replication" section.
4.	Click on Replication to see the available types (e.g., LRS, GRS, ZRS, GA-ZRS).
5.	Opt for ZRS (Zone-Redundant Storage) for redundancy within a region and across multiple availability zones.

</details>

<details>
<summary>Scenario 7: Implementing Soft Delete</summary>

#### Task 1: Investigate the current data protection measures for Azure Storage Blobs 
1.	In the Azure Portal, go to the "Storage accounts" section.
2.	Select the "uks_storage_general," "uksstoragedepts," and "uksstoragemgmt" storage accounts.
3.	In each storage account, find the "Blob Containers" section.
4.	Enable Soft Delete for the Blob Containers to enhance data recovery.

</details>

<details>
<summary>Scenario 8: Implementing Azure File Share Snapshots</summary>

#### Task 1: Check if File Share snapshots are enabled
1.	In the Azure Portal, go to the "Storage accounts" section.
2.	Select the "uks_storage_general" and "uksstoragemgmt" storage accounts.
3.	In each storage account, navigate to the "File shares" section.
4.	Click on the File Share, and click on 'Snapshots'.
5.  Click on 'Add snapshot' to create a snapshot.

*** Note - this is a manual process. You can automate this by enabling Azure Backup in the File Share, configure the retention range and create a new (Or use an existing) Recovery Services Vault, and click on 'enable backup'.

</details>

<details>
<summary>Scenario 9: Implementing Azure Storage Encryption</summary>

#### Task 1: Implementing Azure Storage Encryption
1.	In the Azure Portal, go to the "Storage accounts" section.
2.	Select the "uks_storage_general," "neu_storage_general," and "weu_storage_general" storage accounts.
3.	In each storage account, click on Encryption.
4.	By default, Encryption is enabled by default. However you can select either Microsoft-Managed Keys (MMK) or Customer-Managed Keys (CMK).
5.	If you select CMK, you will need to host the CMK in a Key Vault, create an Access Policy for the Storage Account, and specify that account in the CMK Selection screen.

</details>

<details>
<summary>Scenario 10: Copying Data Using AzCopy</summary>

#### Task 1: Generate Data
1. Create or find 5 Images on your local computer to show 'Shipping'. 
2. Navigate to Entra ID, click on Users, and click on 'Download Users' to create a CSV with users.

#### Task 2: Upload Data
1.	Open the Azure Portal and navigate to the "uksstoragegeneral" and "uksstoragemgmt" storage accounts.
2.	Upload the 'Shipping' images to the "uksstoragegeneral" blob container and the User List to the "uksstoragemgmt" blob container.

#### Task 3: Copy it to another Storage Account/Region
1. Open CMD or Powershell locally on your desktop (Running as an Administrator), and run the following command:
azcopy copy 'https://uksstoragegeneral.blob.core.windows.net/mycontainer' 'https://neustoragegeneral.blob.core.windows.net/mycontainer' --recursive (Replace the 'mycontainer' with the name of your Blob Container).

Once the Container has been copied to North Europe, run the following command:
azcopy copy 'https://uksstoragemgmt.blob.core.windows.net/mycontainer' 'https://neustoragemgmt.blob.core.windows.net/mycontainer' --recursive (Replace the 'mycontainer' with the name of your Blob Container).

</details>

<details>
<summary>Scenario 11: Enabling Object Replication</summary>

#### Task 1: Setting up Object Replication.
1. In uksstoragegeneral, click on 'Object Replication' and click on 'Create Replication Rules'.
2. For Destination Account, click on weustoragegeneral.
3. For Source Container, select the Blob Containers used in Scenario 10.
4. For Destination Container, select a container in weustoragegeneral (You may need to create a similiar container for simplicity).
5. Add in any additional Source Containers and map them to Destination Containers in weustoragegeneral.
6. Confirm the rules are correct, and click 'Save and apply'.
6. Repeat this for ukstoragemgmt so it is replicated to weustoragemgmt.
</details>