| Category | Purpose | Prompt |
| --- | --- | --- |
| Requirements Gathering | Gather full functional requirements | “Analyze the IMIC insurance scenario and list all functional requirements for Policy Holder, Agent, and Company Staff portals. Break them down by modules, user flows, data inputs, and validations.” |
| Requirements Gathering | Identify missing gaps | “Review the IMIC insurance workflow and identify hidden or missing requirements that are not explicitly stated but necessary for a complete system design.” |
| Requirements Gathering | Elicit business rules | “Extract all business rules from the IMIC case study, including policy approval rules, claim rejection criteria, document upload constraints, and premium computation rules.” |
| Requirements Gathering | Clarify dependencies | “List all dependencies and cross‑module interactions for Policy Applications, Claims Management, Document Handling, and Authentication.” |
| Requirements Gathering | User stories | “Convert IMIC’s requirements into clear User Stories with Acceptance Criteria for each stakeholder (Policy Holder, Agent, Company Staff, Admin).” |
| Requirements Gathering | Non-functional requirements | “Identify all NFRs for IMIC (performance, scalability, availability, security, usability, auditability) with measurable parameters.” |
| Requirements Gathering | Validation & data rules | “List all mandatory field validations, data formats, constraints, and integrity rules needed for IMIC’s input forms (members, applications, claims).” |
| Security | Create a security architecture | “Design a security architecture for the IMIC system including authentication, authorization, encryption, document access control, lockout policy, audit logging, and secure API standards.” |
| Security | Threat modelling | “Perform a STRIDE-based threat model for the IMIC portals and recommend mitigations for each threat category.” |
| Security | RBAC definition | “Define a complete RBAC matrix for IMIC: Policy Holder, Agent, Staff, Admin, Auditor. Include allowed actions, restricted actions, and sensitive operations.” |
| Security | Document upload hardening | “Explain best practices for securing IMIC’s document upload system, including AV scanning, MIME/type restrictions, size limits, encryption, and signed URL access.” |
| Security | Audit logging | “Generate a full audit logging specification for IMIC, listing what events must be logged, required metadata, and retention requirements.” |
| Security | Authentication controls | “Design the IMIC login & session security: lockout after 3 attempts, JWT/Session handling, cookie flags, idle timeout, absolute timeout, and account recovery.” |
| Security | Compliance | “Identify compliance requirements for IMIC related to handling PHI/PII (medical reports, identity documents, financial data).” |
| Component-Based Diagram | High-level components | “Generate a Component-Based Diagram for IMIC showing UI clients, API Gateway, Auth Service, Policy Service, Claim Service, Document Service, Admin Service, Notification Service, and Data Plane components.” |
| Component-Based Diagram | Microservice decomposition | “Break down IMIC into logical backend components and show how they communicate (Auth, Policy, Claims, Document, Notification, Audit, Gateway).” |
| Component-Based Diagram | Integration view | “Create a component diagram including external integrations like Email/SMS providers, anti-virus scanning, and object storage.” |
| Component-Based Diagram | Security-aware components | “Produce a component diagram with security overlays such as RBAC enforcement points, JWT validation, rate limiting, and secure document access flows.” |
| Component-Based Diagram | Data plane & storage | “Show the data layer components for IMIC (DB, Object Storage, Cache, Logs, Queues) and map which service interacts with which store.” |