<details>
<summary>Scenario 1: Static Website Deployment</summary>

#### Task 1: Updating Static Website Storage Accounts
1. You are tasked with deploying a static website in the UK South region using Azure Storage. The website should have specific configurations, including "index.html" and "error.html" pages, which are saved in the Github repository under az-104-training/Info/Static Website for each 3 Region. Each Region will have the same files, but they’ll contain details specific to that region on the html file.
</details>

<details>
<summary>Scenario 2: Virtual Network Integration</summary>

#### Task 1: Integrating Storage Accounts with Virtual Networks/Subnets
1. In the UK South region, there is a need to integrate storage accounts with a virtual network. Each Region’s Storage Accounts much only be accessible by Virtual Networks and Subnets in that Region only. The Static Website Storage Account must be able to display the Static Website index.html file.
</details>

<details>
<summary>Scenario 3: Understanding Azure Storage Services</summary>

#### Task 1: Creating Table Storage
1. Add Table storage called ‘Ordering’ into each Region’s storagegeneral Storage Account

#### Task 2: Creating Queue Storage
1. Add Queue storage called ‘Alerts’’ into each Region’s Monitoring Storage Account

#### Task 3: Lock down the Storage Accounts in Tasks 1 & 2 to be accessible by resources in their respective Regions. 
</details>

<details>
<summary>Scenario 4: Creating Blob Storage</summary>

#### Task 1: Creating Blob Storage
1. In uksstoragedepts, neustoragedepts and weustoragedepts, create a blob storage for each department. You may need to utilize a group, or a specific tool in Storage Account.

#### Task 2: Lock Blob Storage Down
1. Lock down each Departmental Blob Storage to be used by users in that Department
</details>

<details>
<summary>Scenario 5: Blob Storage Authorization Adjustment</summary>

#### Task 1: Authorization Adjustment using Azure Storage Explorer
1. Within the storage accounts from the above Scenario, there is a requirement to adjust the authorization settings for Blob storage to enhance security for neustoragedepts and weustoragedepts, using Azure Storage Explorer. Lock it down to just the users for each Department.
</details>

<details>
<summary>Scenario 6: Configuring Storage Replication</summary>

#### Task 1: Evaluate Currect Replication Settings for Storage Accounts
1. They must enable redundancy and replication so that they are available within their specific Regions only, and not in other regions and must be able to support a single Datacenter failure in a Region.
</details>

<details>
<summary>Scenario 7: Implementing Soft Delete</summary>

#### Task 1: Investigate the current data protection measures for Azure Storage Blobs 
1. Investigate the current data protection measures for Azure Storage Blobs in all Storage Accounts in UK South. If not already enabled, configure Soft Delete to enhance data recovery capabilities.
</details>

<details>
<summary>Scenario 8: Implementing Azure File Share Snapshots</summary>

#### Task 1: Check if File Share snapshots are enabled
1. Inspect the current file share configuration and identify if Azure File Share Snapshots are enabled in the UK South region. If not, enable and configure snapshots for improved data recovery.
</details>

<details>
<summary>Scenario 9: Implementing Azure Storage Encryption</summary>

#### Task 1: Implementing Azure Storage Encryption
1. Audit the security measures for blob containers in all Region. If encryption is not already implemented, configure Azure Storage encryption to enhance data protection.
</details>

<details>
<summary>Scenario 10: Copying Data Using AzCopy</summary>

#### Task 1: Generate Data
1. Create or find 5 Images on your local computer to show 'Shipping'. Also, generate a list of Users that have access to the Azure Environment, and save it to your local device. 

#### Task 2: Upload Data
1. Upload the images through the Portal to the uksstoragegeneral Storage Account
2. Upload the User List to the uksstoragemgmt Storage Account.

#### Task 3: Copy it to another Storage Account/Region
1. Utilize AzCopy to copy data securely to their equivalent Storage Accounts in North Europe, ensuring efficiency in the data transfer process.
</details>

<details>
<summary>Scenario 11: Object Replication</summary>

#### Task 1: Setup Object Replication to other Regions
1. In the UK South, setup Object Replication so that data in ukstoragegeneral and ukstoragemgmt from Scenario 10 is replicated to weustoragegeneral and weustoragemgmt.
</details>
