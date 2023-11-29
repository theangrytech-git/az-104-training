<details>
<summary>Scenario 1: Identity Management and RBAC</summary>

#### Task 1: Bulk User Upload
**Steps:**
1. Prepare a CSV file with user details, including username, password, and other required attributes.
2. In the Azure Portal, go to "Entra ID."
3. Select "Users" and then "New user."
4. Choose "Bulk add" and upload the prepared CSV file.
5. Review the users to ensure successful creation.

#### Task 2: User Creation
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Users" and select "New user."
3. Create 15 users with appropriate details.
4. Assign each user to one of the three Resource Groups using "Assigned Resource Groups" in the user's profile.

#### Task 3: Role Assignments
**Contributor Role:**
1. Go to each Resource Group's "Access control (IAM)" section.
2. Click on "Add role assignment."
3. Choose the "Contributor" role and add the respective users.

**Virtual Machine Contributor Role:**
1. Navigate to the virtual machine or Resource Group level.
2. Access "Access control (IAM)" and click on "Add role assignment."
3. Choose the "Virtual Machine Contributor" role and add the respective users.

**Reader Role for Monitoring:**
1. Go to the monitoring resource level.
2. In "Access control (IAM)," click on "Add role assignment."
3. Choose the "Reader" role and assign users.

**RBAC for Entra ID:**
1. Identify the specific roles needed for Entra ID, such as VM login, Owner, or an equally privileged role.
2. Go to the respective resources (e.g., VMs, Resource Groups).
3. Access "Access control (IAM)" and click on "Add role assignment."
4. Assign the identified roles to Entra ID.

**Note:** Verify that users have the appropriate permissions by testing VM logins and managing resources.
</details>

<details>
<summary>Scenario 2: Security and Dynamic Groups</summary>

#### Task 1: Security Group Creation
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Groups" and select "New group."
3. Choose "Security" as the group type and name it "Data Uploaders."
4. Add users from the Temp, Warehouse, and R&D Departments to this group.
5. Save the changes.

**Assign Roles for Storage Blob Data Contributor:**
1. Go to the "Access control (IAM)" section of Storage Accounts in UK South and UK West.
2. Click on "Add role assignment."
3. Choose "Storage Blob Data Contributor" role.
4. Add the "Data Uploaders" security group as a member.

#### Task 2: Dynamic Group Creation
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Groups" and select "New group."
3. Choose "Security" as the group type and name it "VM Logins."
4. Select "Dynamic user members."
5. Define the dynamic group rules based on specific attributes like department or job title for users in the R&D, Product-Oversight, and Temp Departments.
6. Save the changes.

**Assign Roles for VM Logins:**
1. Go to the resources (e.g., VMs) where you want to assign log-in permissions.
2. In "Access control (IAM)," click on "Add role assignment."
3. Choose the roles necessary for VM logins.
4. Add the "VM Logins" dynamic group as a member.

**Note:** Validate the dynamic group membership to ensure users are correctly included based on specified attributes.
</details>

<details>
<summary>Scenario 3: Entra ID Privileged Identity Management (PIM)</summary>

#### Task 1: PIM Activation and Role Assignment
**Steps:**
1. In the Azure Portal, navigate to "Entra ID" and select "Privileged Identity Management."
2. Click on "Get started" to activate PIM.
3. In PIM, go to "Roles" and create "Eligible roles" for Users in HR and Management Departments.
   - Assign the "Global Administrator" role as an eligible role.
4. Create a group named "R&D, Product-Oversight, Temp - Owners."
   - Assign the "Owner" role as an eligible role for this group.
   - Add users from R&D, Product-Oversight, and Temp Departments to this group.
5. Create a group named "Reception, HR, Sabre - Helpdesk Admins."
   - Assign the "Helpdesk Administrator" role as a permanent role for this group.
   - Add users from Reception, HR, and Sabre Departments to this group.

**Note:** PIM allows for just-in-time privileged access, so activation might involve time-based assignments based on user approval.
</details>

<details>
<summary>Scenario 4: Azure Policy and Blueprints</summary>

#### Task 1: Azure Policy
**Steps:**
1. In the Azure Portal, navigate to "Policy."
2. Click on "Definitions" and create a new policy definition.
   - Set conditions for basic compliance, e.g., requiring a specific tag on resources.
3. Go to "Assignments" and assign the policy to the "Projects" Resource Group.

#### Task 2: Azure Blueprint
**Steps:**
1. In the Azure Portal, navigate to "Blueprints" and create a new Azure Blueprint.
2. Add predefined policies to the blueprint. For example, include policies related to resource tagging.
3. Assign the blueprint to each Resource Group.
   - During the assignment, configure parameters and settings specific to each Resource Group.

**Note:** Azure Blueprints provide a way to package policies, role assignments, and resource templates together for consistent deployment across environments.
</details>

<details>
<summary>Scenario 5: Self-Service Password Reset</summary>

#### Task 1: Enable Self-Service Password Reset
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Security" and then "Authentication methods."
3. Under "Self-service password reset," configure the settings for all Users.
   - Specify the authentication methods (e.g., email, phone) and the number of methods required for reset.
   - Configure the registration policy.
4. Save the changes.

#### Task 2: Test the Self-Service Password Reset Process
**Steps:**
1. Open a private or incognito browser window.
2. Go to the Entra ID self-service password reset portal.
3. Follow the prompts to verify identity and reset the password.
4. Log in using the new password to confirm the reset was successful.

**Note:** It's essential to communicate the self-service password reset process to Users, including the steps and any authentication requirements.
</details>

<details>
<summary>Scenario 6: Multi-Factor Authentication (MFA)</summary>

#### Task 1: Enable MFA
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Security" and then "Authentication methods."
3. Under "Multi-Factor Authentication," configure the MFA settings.
   - Select the Users in Sales, HR, and Management.
   - Enable MFA for the selected Users.
4. Save the changes.

#### Task 2: Test MFA Sign-in
**Steps:**
1. Log out of any existing sessions for Users in Sales, HR, and Management.
2. Attempt to sign in to Entra ID for one of the configured Users.
3. Complete the MFA verification process using the configured methods (e.g., mobile app, phone call).
4. Ensure successful sign-in after MFA verification.

**Note:** Communicate the MFA implementation to Users and provide guidance on the verification process.
</details>

<details>
<summary>Scenario 7: Conditional Access</summary>

#### Task 1: Conditional Access Policies
**Steps:**
1. In the Azure Portal, go to "Entra ID."
2. Navigate to "Security" and then "Conditional Access."
3. Create a new conditional access policy.
   - Name: MFA for UK Regions
   - Assignments:
      - Users and groups: Select Users in UK South, UK West, and West Europe.
      - Devices platforms: Exclude Windows devices and Android devices.
      - Conditions: Include any compromised devices.
   - Access controls:
      - Grant: Require multi-factor authentication.
4. Enable and enforce the conditional access policy.

#### Task 2: Implement Conditional Access Policy
**Steps:**
1. After creating the policy, ensure it is enabled.
2. Test the conditional access policy by signing in with a User account from UK South, UK West, or West Europe.
3. Verify that MFA is enforced for sign-in attempts from non-compliant devices or compromised devices.

**Note:** Communicate the conditional access policy changes to affected Users and provide guidance on compliance.
</details>

<details>
<summary>Scenario 8: Reporting</summary>

#### Task 1: User Activity and PIM Access Reports
**Steps:**
1. In the Azure Portal, navigate to "Entra ID."
2. Under "Monitoring," go to "Audit logs" for user activity reports.
   - Customize the report based on the required time range, users, and activities.
3. Analyze the user activity reports to identify any suspicious or critical activities.
4. For PIM access reports:
   - Go to "Entra ID Privileged Identity Management."
   - Access "Audit history" for a detailed view of privileged role assignments.
5. Review and analyze PIM access reports for any irregular or unauthorized access to privileged roles.
6. Document any findings or take necessary actions based on the audit reports.

**Note:** Regularly perform these tasks to ensure continuous monitoring of user activity and privileged access.
</details>

#### Some Links For Further Reference

**Identity Management and RBAC**
[Azure RBAC Documentation](https://learn.microsoft.com/en-us/azure/role-based-access-control/overview)
[Entra ID Roles and Administrator Types](https://learn.microsoft.com/en-us/entra/fundamentals/whatis)

**Security and Dynamic Groups**
[Azure AD Security Groups](https://learn.microsoft.com/en-us/entra/fundamentals/concept-learn-about-groups)
[Dynamic Groups in Azure AD](https://learn.microsoft.com/en-us/entra/identity/users/groups-dynamic-membership)

**Azure AD Privileged Identity Management (PIM)**
[Azure AD Privileged Identity Management (PIM) Documentation](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-configure)
[Assign Entra ID roles using PIM](https://learn.microsoft.com/en-us/entra/id-governance/privileged-identity-management/pim-resource-roles-assign-roles)

**Azure Policy and Blueprints**
[Azure Policy Documentation](https://learn.microsoft.com/en-us/azure/governance/policy/overview)
[Azure Blueprints Documentation](https://learn.microsoft.com/en-us/azure/governance/blueprints/overview)

**Self-Service Password Reset**
[Entra ID self-service password reset (SSPR)](https://learn.microsoft.com/en-us/entra/identity/authentication/tutorial-enable-sspr)

**Multi-Factor Authentication (MFA)**
[Microsoft Entra Multifactor Authentication](https://learn.microsoft.com/en-us/entra/identity/authentication/concept-mfa-howitworks)

**Conditional Access**
[Entra ID Conditional Access Documentation](https://learn.microsoft.com/en-us/entra/identity/conditional-access/overview)

**Reporting**
[Entra ID Reporting](https://learn.microsoft.com/en-us/entra/id-governance/identity-governance-overview)
