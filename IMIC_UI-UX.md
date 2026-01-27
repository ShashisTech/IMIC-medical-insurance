**UI/UX Architecture – Key Concepts & Terms :**

Policy Holder: View Policy and Claim Status

Insurance Agent: Enter Policies and Claims

Insurance Company Staff: Approve/Reject Policies and Claims

**Global Layout (All Sections) :**

Header (Company Logo) at the Top

Menu (Left Navigation)

Work Area (Dynamic Content)

Footer (Options)

**UX Principles Applied :**

Same Header and Navigation Everywhere – Consistency

Left Menu -> Fewer Clicks

Central Work Area

**Screens :**

**Home Page Before Login :**

UI Elements – Header with IMIC Logo, Insurance News, FAQs, Login Box

**Policy Holder Home Page (After Login) :**

Menu (Left Pane):

*   Personal Details
    *   Name, DOB, Address
    *   Family Members
    *   No Edit Button
*   Policy Details
    *   Policy Cover
    *   Premium Amount
    *   Policy Status Active
*   Claim Details
    *   List of Claims
    *   Claim Status (Approval, Accepted and Rejected with Reasons)

**Agent Section (After Login) :**

*   Create Policy and Claims quickly with minimal errors
*   Agent Login Page is same as Policy holder Login Page
*   Role Bases Authentication should be used

Manu:

*   New Policy Holder
    *   Enter Customer Personal Details
    *   Add Dependents
    *   Enter Policy Cover and Premium
    *   Upload Documents
    *   Review and Submit
*   Claim Management
    *   Claim Entry Form
    *   Upload Hospital Bills
    *   Submit to Insurance Company

**Insurance Company (After Login) :**

*   Approve or Reject accurately with Reason

Home Page:

*   Static Information
*   Dashboard with all the information of the respective customer

Approve/Reject Policy in Tabular View:

*   Policy Holder
*   Members
*   Documents
*   Status

Decision UX :

*   Approve
*   Reject with Reason

Claim Management :

*   List of Claims
*   View Uploaded Bills
*   Approve/Reject
*   Enter cheque details on approval

UX Strength :

*   No Back and Forth
*   No Ambiguity
*   Fast Screen Load
*   Status Updates
*   Minimal Clicks
*   Secure Login
*   Lock account after 3 Clicks
*   API Integration
*   REST APIs
*   Role Based Authentication
*   Dashboard APIs
*   .Net Identity
*   Identity lock out policy
*   User Journey
*   Performance and Latency
*   Error Handling Semantics
*   Consistence Rules

Security :

1.  After 3 Invalid Attempts
2.  Account Locked
3.  Manual Reactivation Only