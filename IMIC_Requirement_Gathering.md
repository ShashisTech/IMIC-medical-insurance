| Topic | Client POC Team (Who to contact) | Questions to Ask |
| --- | --- | --- |
| Personal Details (Read-only) | Product Owner, Customer Operations | - Exactly which personal fields must be displayed (name, contact, address, DOB, etc.)?- Any sensitive fields to mask (e.g., phone/email/PAN partially)?- Should the holder see dependents’ PII fully or masked?- Any localization (date/number formats)? |
| Policy Details (Read-only) | Product Owner, Operations | - What policy attributes to display (number, status, cover, premium, start/end dates, members)?- Should we show premium breakdown per member?- How do we handle multiple policies per holder (future)? |
| Claims List (Read-only) | Claims Ops, Customer Ops | - Columns required (claim date, member, requested amount, status, reason if rejected)?- Do holders need to view claim documents (bills) or only statuses?- Sort/filter requirements? |
| Login & Access | IAM, Customer Ops | - How will the initial credentials be shared to policy holders?- Password reset/reset link—self-service or via support?- Any MFA needed later (optional scope)? |
| UX & Navigation | UX/Design, Brand | - Is a dashboard required (e.g., next premium date, claim status widgets)?- Must the portal be responsive/mobile-friendly?- Accessibility standards to follow (WCAG)? |

**2) Agent Portal**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| New Policy Holder Creation | Sales/Agency Ops, Underwriting | - Fields required for policy holder onboarding (KYC, contact, address)?- Should agents search for existing holders to avoid duplicates?- Validation rules (mandatory fields, formats)? |
| Members (Primary + Dependents) | Underwriting, Operations | - Rules for exactly one PRIMARY and many DEPENDENTs?- Allowed relationships (spouse, child, parent)?- Age limits per member type? |
| Documents (Application) | Underwriting, Compliance | - Mandatory documents per member (age proof, medical reports)?- Cases where medical reports are optional (e.g., age ≤ 45)?- Accepted file types and max size per document? |
| Premium Estimation | Actuarial, Underwriting | - Inputs to premium (cover amount, age bands, risk factors)?- Discount rules (family discount, caps)?- Rounding, taxes, currency format? |
| Application Submission | Operations | - Draft vs Submit behavior?- What happens if documents are incomplete?- Can agents edit after submit (until picked by underwriter)? |
| Policy Status Visibility | Sales Ops | - Can agents see status of their submissions only, or team/branch-wide?- Filters/sorting needed (status, date, holder name)? |
| Claims Entry | Claims Ops | - Fields required to submit a claim (member, amount, hospital, dates)?- Mandatory claim documents (bills, diagnostics)?- Validation checks before submission? |

**3) Company (Intranet) Portal**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Approve/Reject Policy | Underwriting, Operations | - Exact approval criteria and hard rejection reasons?- Is member-level partial approval ever allowed? (Brief implies No—confirm)- SLA for reviewing submitted applications?- Need for queues, filters, and workload assignment? |
| Claims Management | Claims Dept, Finance | - Criteria for claim acceptance vs rejection?- Who enters cheque details (role)?- Cheque fields required (number, bank, date, amount)?- Are partial claim approvals allowed? |
| Admin (Account Unlocks) | IT Ops, IAM | - Who is authorized to unlock accounts?- Should unlock be audited with reason and approver?- Any additional identity proof needed before unlock? |
| Read/Write Permissions | Operations, Security | - Can staff edit policy holder data? If yes, which fields and with what audit?- Who can change policy status manually? |

**4) Workflows & Business Rules**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Policy Application Lifecycle | Underwriting, Ops | - States: Draft → Submitted → Approved/Rejected (any others?)- Who can transition states and under what conditions?- Reasons catalog for rejection (standardized list)? |
| Claim Lifecycle | Claims, Finance | - States: Sent for approval → Accepted (with cheque) / Rejected (confirm)- Who can change status and record cheque?- Do we need to track settlement date separately? |
| Atomic Rejection Rule | Underwriting | - Confirm: if any member is rejected, whole application is rejected.- Are there exceptions (e.g., remove member and resubmit)? |
| SLAs & Notifications | Ops, Communications | - SLA timers for applications/claims?- Notification triggers per state change (who receives what)?- Channels (Email/SMS), templates, languages? |

**5) Document Management**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Upload Policy | IT Infra/Storage, Compliance | - Accepted file formats (PDF/JPG/PNG)?- Max size per file and per application/claim?- Max number of files per member/claim? |
| Access Control | Security, Compliance | - Who can view/download which documents (holder, agent, staff)?- Should policy holders be allowed to download their own docs? |
| Security & Retention | Security, Legal | - Virus scanning required? If fails, how to handle?- Retention & archival policy (how long to keep)?- Redaction requirements before sharing externally? |

**6) Authentication, Authorization, and Security**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Authentication | IAM, IT Ops | - Username format? Password policy?- Initial credential delivery mechanism to holders?- Any MFA for agents/staff (future-ready)? |
| Lockout Policy | IAM, Security | - Confirm 3 failed attempts → lock; is there a cooldown?- Manual unlock process owner; require justification?- Should we notify user on lockout/unlock? |
| Authorization (RBAC) | Security, Operations | - Role matrix: Holder, Agent, Staff, Admin (permissions per role)?- Any sub-roles (e.g., Underwriter vs Claims Processor)? |
| Audit Logging | Compliance, Security | - Which actions are auditable (login, failed login, status changes, cheque entry, doc upload/download)?- Log retention and access controls to logs? |
| Data Protection | Security, Legal | - Sensitive fields to encrypt/mask in UI and logs?- PII handling guidelines?- Any IP/geo restrictions for intranet vs internet? |

**7) Premium Calculation**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Inputs & Rules | Actuarial, Underwriting | - Age bands and rates?- Cover-based scaling and caps?- Risk adjustments (medical conditions)? |
| Discounts & Adjustments | Actuarial | - Family discount thresholds and percentages?- No-Claim Bonus or loyalty discounts (future)? |
| Configuration | Product/Actuarial | - Should rates be configurable via admin UI or table-driven?- Rounding rules and display format? |

**8) UI/UX & Look-and-Feel**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Consistency | UX/Brand | - Exact header/footer/left nav requirements?- Branding (logo usage, typography, color palette)? |
| Usability | UX/Design | - Minimal clicks: any benchmark (≤2 clicks to any screen)?- Search/filters needed on listing pages? |
| Accessibility | UX/Compliance | - Accessibility targets (WCAG 2.1 AA)?- Keyboard navigation and screen-reader expectations? |
| Responsiveness | UX/Design | - Target devices/browsers?- Any mobile-first constraints? |

**9) Non-Functional Requirements (NFRs)**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Performance | Architecture/IT, Ops | - Response time targets (e.g., P95 ≤ 500ms for reads)?- Concurrency expectations per portal? |
| Availability & Reliability | IT Ops | - Expected uptime for demo/training (e.g., 99.5%)?- Backup/restore expectations? |
| Scalability | Architecture/IT | - Expected data growth (policies, claims, documents)?- Need for caching read-most data? |
| Observability | IT Ops | - Logging standards (JSON, correlation IDs)?- Metrics and dashboards needed (APM, infra)?- Alerting thresholds? |

**10) Data & Database**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Data Model Inputs | Data/DB Team, Underwriting | - Any additional fields not in the brief (e.g., nominee, GSTIN)?- Keys and identifiers (policy number format)? |
| Data Quality | Operations | - Duplicate detection rules (same PAN/email/phone)?- Mandatory vs optional fields by context? |
| Retention & Compliance | Legal, Compliance | - Retention periods for policy data and claims?- Right to correction/deletion for holders (future)? |
| Reporting Schema | BI/Analytics | - Reporting needs that affect schema (e.g., history tables, status timestamps)? |

**11) Notifications & Communications**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Channels | Communications, IT Integrations | - Email/SMS (which provider)?- Opt-in/out per user? |
| Triggers | Product Owner, Ops | - Events that trigger notifications (policy approval, claim status changes, account lock/unlock)?- Who should receive which notifications (holder/agent/staff)? |
| Templates | Brand/Comms | - Content templates, languages, branding rules?- Compliance language for regulatory notices? |

**12) Analytics & Reporting**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Operational Dashboards | Ops, BI | - Metrics: applications by status, approval TAT, claims by status, settlement times?- Drill-downs and filters? |
| Business Reports | Product, Finance, BI | - Premium totals by cover/age band; claim ratios; loss ratios?- Export formats (Excel/PDF) and schedule (weekly/monthly)? |
| Data Source | BI, IT | - Live DB vs reporting replica?- Data freshness requirements? |

**13) Testing & UAT**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Test Data | QA Lead, Ops | - Need anonymized real-like datasets?- Seed volumes (policies, members, claims)? |
| UAT | Business UAT, QA | - Entry/exit criteria for UAT?- Who signs off per module?- Defect triage cadence? |

**14) Deployment, Installation, and Environments**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Environments | IT Ops | - Required environments (Dev/QA/Demo)?- Network separation for intranet vs internet portals? |
| Installer Pack | IT Ops | - Expectations for one-click installer (compose script, migrations, seed users)?- What should the installer output (URLs, credentials)? |

**15) Compliance & Legal**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Regulatory | Compliance, Legal | - Applicable regulations (retention, auditability)?- Required disclaimers and consent capture? |
| Audit Readiness | Compliance | - What reports/logs required for audit?- How long to retain, and in what format? |

**16) Edge Cases & Exceptions**

| Topic | Client POC Team | Questions to Ask |
| --- | --- | --- |
| Application Exceptions | Underwriting, Ops | - What if a member’s doc is invalid: reject entire application or allow resubmit?- How to handle bounced cheque during policy purchase (mentioned as rejection reason)—confirm process? |
| Claim Exceptions | Claims, Finance | - What if requested amount exceeds cover?- Can claims be resubmitted after rejection?- Handling duplicate claims for same hospitalization? |
| Account Management | IAM, Support | - After unlock, does failed-attempt counter reset?- Notify user/agent on unlock? |