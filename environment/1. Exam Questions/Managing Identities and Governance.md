<details>
<summary>Scenario 1: Identity Management and RBAC</summary>

#### Task 1: Bulk User Upload
1. Create 15 users into Entra ID using Bulk Upload. You can find the Users and Templates you need under Info > Users. Take a look at the newusers.csv file, which will be a list of Users that need adding in (This will happen in environments more than you think) and try upload it. It'll fail, and it will tell you why. Now take a look at the UserCreateTemplate.csv and try use that to complete this task.

#### Task 2: User Creation
1. Navigate to Azure Entra ID in the Azure portal.
2. Under "Users," select "New user" and create 15 users with appropriate details.
3. Assign each user to one of the three Resource Groups using "Assigned Resource Groups" in the user's profile.

#### Task 3: Role Assignments
1. For "Contributor" role, go to each Resource Group's "Access control (IAM)" section and add the respective users.
2. For "Virtual Machine Contributor" role, do the same at the virtual machine or Resource Group level.
3. For "Reader" role, assign users at the monitoring resource level.
4. Assign specific roles for Entra ID in RBAC, such as VM login, Owner, or an equally privileged role.
</details>

<details>
<summary>Scenario 2: Security and Dynamic Groups</summary>

#### Task 1: Security Group Creation
1. Create a Security Group called ‘Data Uploaders’ in Entra ID that includes users from the Temp, Warehouse, and R&D Department.
2. Assign roles of Storage Blob Data Contributor for Storage Accounts based in UK South and North Europe.

#### Task 2: Dynamic Group Creation
1. Create a dynamic group called 'VM Logins' in Entra ID that includes users with specific attributes, like department or job title for Users based in the R&D, Product-Oversight, and Temp Departments.
2. Assign roles to allow them to log into a VM based on membership in this dynamic group.
</details>

<details>
<summary>Scenario 3: Entra ID Privileged Identity Management (PIM)</summary>

#### Task 1: PIM Activation and Role Assignment
1. In Entra ID, go to "Privileged Identity Management."
2. Activate PIM.
3. Create "Eligible roles" for Users in HR and Management Departments for Global Administrator.
4. Create a Group to allow an Eligible Role for “Owner” for users in R&D, Product-Oversight, and Temp.
5. Create a Group to allow “permanent role” for “Helpdesk Administrator” for Users on Reception, HR, and Sabre.
</details>

<details>
<summary>Scenario 4: Azure Policy and Blueprints</summary>

#### Task 1: Azure Policy
1. Go to "Policy" in Azure portal, create a new policy for basic compliance, e.g., ensuring all resources have a specific tag.
2. Assign the policy to the "Projects" Resource Group.

#### Task 2: Azure Blueprint
1. Create a new Azure Blueprint with predefined policies.
2. Assign the blueprint to each Resource Group.
</details>

<details>
<summary>Scenario 5: Self-Service Password Reset</summary>

#### Task 1: Enable Self-Service Password Reset
1. Configure Entra ID self-service password reset for all Users.
2. Test the self-service password reset process.
</details>

<details>
<summary>Scenario 6: Multi-Factor Authentication (MFA)</summary>

#### Task 1: Enable MFA
1. Enable MFA for Users in Sales, HR, and Management within Entra ID.
2. Test MFA sign-in for the configured users.
</details>

<details>
<summary>Scenario 7: Conditional Access</summary>

#### Task 1: Conditional Access Policies
1. Create a conditional access policy that enforces MFA based on users in UK South, North Europe, and West Europe, using anything but Windows devices and Android devices, and for any compromised devices.
2. Implement a conditional access policy based on the above.
</details>

<details>
<summary>Scenario 8: Reporting</summary>

#### Task 1: User Activity and PIM Access Reports
1. Utilize Entra ID reporting tools to generate user activity reports.
2. Review and analyze PIM access reports for privileged roles.
</details>
