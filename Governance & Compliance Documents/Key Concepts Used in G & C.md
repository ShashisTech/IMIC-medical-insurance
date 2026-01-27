### Governance & compliance documents often use a set of standard terms that define *how* an organization controls, manages, secures, and operates a software system.  
Below is a structured explanation of each important concept.

***

# **1. Governance**

Governance refers to the **rules, processes, standards, and decision‑making structure** that ensure a system is built, operated, and maintained in a predictable, secure, and compliant manner.

Think of it as **"how we ensure things are done correctly."**

Includes:

*   Policies
*   Procedures
*   Responsibilities
*   Quality controls
*   Review mechanisms

***

# **2. Compliance**

Compliance means ensuring the system follows:

*   Government regulations
*   Industry standards
*   Company policies
*   Legal & security rules

Example for a medical insurance company:

*   IRDAI guidelines
*   DPDP Act 2023
*   IT Act 2000
*   Security laws

Compliance answers:  
**"Are we following the laws, rules, and required standards?"**

***

# **3. SDLC Governance**

SDLC = **Software Development Life Cycle**

SDLC governance ensures that all development activities follow a standard process:

*   Requirements gathering
*   Design reviews
*   Coding standards
*   Testing strategies
*   Deployment checks

This ensures:

*   Consistency
*   Traceability
*   Quality control

***

# **4. Security Governance**

This defines how security is planned, implemented, and monitored.

Includes:

*   Authentication
*   Authorization
*   Data encryption
*   Secure code practices
*   Threat modeling
*   Vulnerability management

Security governance ensures the system protects confidentiality, integrity, and availability (CIA).

***

# **5. Regulatory Compliance**

Industry‑specific rules that the system must follow.  
For insurance in India:

*   **IRDAI** (Insurance Regulatory and Development Authority of India)
*   **DPDP Act 2023** (Digital Personal Data Protection Act)
*   **IT Act 2000**

Regulatory compliance ensures **the application does not violate national laws**.

***

# **6. Data Governance**

Rules for handling data throughout its lifecycle.

Includes:

*   Data classification (sensitive, confidential)
*   Data retention periods
*   Who can access what data
*   Encryption requirements
*   Data backup policies

Data governance ensures data is protected and used properly.

***

# **7. Data Classification**

Categorizing data based on sensitivity.

Typical categories:

*   **Public**
*   **Internal**
*   **Sensitive**
*   **Highly Sensitive**
*   **Critical**

For IMIC:

*   Medical data = Highly sensitive
*   Passwords = Critical
*   Policy information = Sensitive

***

# **8. Access Governance / RBAC**

RBAC = **Role-Based Access Control**

Defines “who can do what.”

Example roles:

*   Policy Holder → View only
*   Agent → Create and update
*   Company Staff → Approve/reject
*   Admin → Manage system users

Access governance ensures **no one can access more than they need**.

***

# **9. Authentication**

Verifying the identity of a user.

Examples:

*   Username + password
*   OTP (multi-factor authentication)
*   Biometrics (if implemented)

***

# **10. Authorization**

Determines what an authenticated user is allowed to do.

Example:

*   Agent can enter claims
*   Policy holder cannot edit personal data

***

# **11. OWASP**

OWASP = **Open Web Application Security Project**  
A global standard for web application security.

OWASP Top 10 lists the **10 most common security risks**, such as:

*   SQL Injection
*   XSS
*   Access control failures

Used to enforce secure coding practices.

***

# **12. Logging & Audit Trails**

Logs record:

*   Actions performed
*   User IDs
*   Timestamps
*   Data changes
*   System events

Audit trails are used for:

*   Security investigations
*   Compliance audits
*   Detecting fraud

***

# **13. DevOps Governance**

Defines how builds, deployments, and environments are controlled.

Includes:

*   CI/CD (continuous integration & deployment)
*   Automated builds
*   Deployment approvals
*   Release pipelines

Ensures consistent and safe releases.

***

# **14. Change Management (CAB)**

CAB = **Change Advisory Board**

A formal approval process for changes:

*   Bug fixes
*   Enhancements
*   Production releases

Purpose:

*   Avoid disruptions
*   Track who changed what and why

***

# **15. Incident & Problem Management**

Part of IT operations governance.

*   **Incident:** Something broke; fix it quickly
*   **Problem:** Root cause of repeated incidents

This ensures stability & reliability.

***

# **16. Risk Management**

Identifying potential threats and defining how to reduce them.

Examples:

*   Data breaches → mitigate with encryption
*   Wrong approvals → mitigate with workflows
*   System downtime → mitigate with redundancy

***

# **17. Look-and-Feel Governance**

Ensures UI consistency:

*   Same header/footer
*   Same color themes
*   Navigation standards
*   User experience guidelines

Important for:

*   Usability
*   Accessibility
*   Branding

***

# **18. Traceability**

Ensures every change is linked to:

*   A requirement
*   A task
*   A test case
*   A deployment artifact

Traceability allows auditing & easier debugging.

***

# **19. Quality Gates**

Automated checks that code must pass before merging:

*   Static code analysis
*   Unit test coverage
*   Security scanning

Tools like SonarQube enforce this.

***

# **20. Encryption**

Protecting data using cryptography.

Two types:

1.  **Encryption at rest** → protect database data
2.  **Encryption in transit** → protect data moving over internet (TLS 1.3)


