-- =====================================================================
-- Database
-- =====================================================================
CREATE DATABASE IF NOT EXISTS insurance_app;
 

USE insurance_app;

-- =====================================================================
-- Helper: common ENUMs
-- =====================================================================
-- You can inline these enums where used; kept as comments for clarity:
--   gender ENUM('Male','Female','Other')
--   claimstatus ENUM('Submitted','UnderReview','Approved','Rejected','Paid','Closed')
--   paymentmethod ENUM('UPI','Card','NetBanking','NEFT','RTGS','Cash','Cheque')
--   relation ENUM('Self','Spouse','Child','Parent','Other')

-- =====================================================================
-- ROLE
-- =====================================================================
DROP TABLE IF EXISTS Role;
CREATE TABLE Role (
    RoleId          INT AUTO_INCREMENT PRIMARY KEY,
    RoleType        VARCHAR(50) NOT NULL UNIQUE           -- e.g., 'PolicyHolder','Agent','InsuranceCompany'
) ENGINE=InnoDB;

-- =====================================================================
-- USER
-- =====================================================================
DROP TABLE IF EXISTS User;
CREATE TABLE User (
    UserId          INT AUTO_INCREMENT PRIMARY KEY,
    RoleId          INT NOT NULL,
    UserPassword    VARCHAR(255) NOT NULL,               -- store a hash, not plaintext
    User            VARCHAR(150) NOT NULL UNIQUE,        -- username / login (often email)

    CONSTRAINT fk_user_role
        FOREIGN KEY (RoleId) REFERENCES Role(RoleId)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX ix_user_role ON User(RoleId);

-- =====================================================================
-- INSURANCE COMPANY
-- =====================================================================
DROP TABLE IF EXISTS InsuranceCompany;
CREATE TABLE InsuranceCompany (
    CompanyId       INT AUTO_INCREMENT PRIMARY KEY,
    CompanyName     VARCHAR(150) NOT NULL,
    CompanyEmailId  VARCHAR(150) NULL
) ENGINE=InnoDB;

-- =====================================================================
-- POLICY HOLDER
-- =====================================================================
DROP TABLE IF EXISTS PolicyHolder;
CREATE TABLE PolicyHolder (
    PolicyHolderId  INT AUTO_INCREMENT PRIMARY KEY,
    FirstName       VARCHAR(100) NOT NULL,
    LastName        VARCHAR(100) NOT NULL,
    Address         VARCHAR(300) NULL,
    MobileNumber    VARCHAR(25) NULL,
    EmailId         VARCHAR(150) NULL,
    UserId          INT NOT NULL,
    CompanyId       INT NOT NULL,

    CONSTRAINT uq_policyholder_user UNIQUE (UserId),

    CONSTRAINT fk_policyholder_user
        FOREIGN KEY (UserId) REFERENCES User(UserId)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_policyholder_company
        FOREIGN KEY (CompanyId) REFERENCES InsuranceCompany(CompanyId)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX ix_policyholder_company ON PolicyHolder(CompanyId);

-- =====================================================================
-- AGENT
-- =====================================================================
DROP TABLE IF EXISTS Agent;
CREATE TABLE Agent (
    AgentId         INT AUTO_INCREMENT PRIMARY KEY,
    FirstName       VARCHAR(100) NOT NULL,
    LastName        VARCHAR(100) NOT NULL,
    Address         VARCHAR(300) NULL,
    Gender          ENUM('Male','Female','Other') NULL,
    Mobile          VARCHAR(25) NULL,
    EmailId         VARCHAR(150) NULL,
    CreatedBy       VARCHAR(150) NULL,
    CreatedOn       DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    UserId          INT NOT NULL,
    CompanyId       INT NOT NULL,

    CONSTRAINT uq_agent_user UNIQUE (UserId),

    CONSTRAINT fk_agent_user
        FOREIGN KEY (UserId) REFERENCES User(UserId)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_agent_company
        FOREIGN KEY (CompanyId) REFERENCES InsuranceCompany(CompanyId)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX ix_agent_company ON Agent(CompanyId);

-- =====================================================================
-- POLICY
-- =====================================================================
DROP TABLE IF EXISTS Policy;
CREATE TABLE Policy (
    PolicyId        INT AUTO_INCREMENT PRIMARY KEY,
    PolicyHolderId  INT NOT NULL,
    AgentId         INT NULL,                            -- allow NULL for direct channel policies
    PolicyIssueDate DATE NOT NULL,
    IsActive        TINYINT(1) NOT NULL DEFAULT 1,
    SumInsured      DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    PolicyCover     VARCHAR(200) NULL,                   -- e.g., plan name or coverage type
    PolicyExpiryDate DATE NOT NULL,
    Term            INT NULL,                            -- months/years based on business need
    IsApproved      TINYINT(1) NOT NULL DEFAULT 0,

    CONSTRAINT fk_policy_holder
        FOREIGN KEY (PolicyHolderId) REFERENCES PolicyHolder(PolicyHolderId)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_policy_agent
        FOREIGN KEY (AgentId) REFERENCES Agent(AgentId)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE INDEX ix_policy_holder ON Policy(PolicyHolderId);
CREATE INDEX ix_policy_agent  ON Policy(AgentId);

-- =====================================================================
-- INSURED MEMBER
-- =====================================================================
DROP TABLE IF EXISTS InsuredMember;
CREATE TABLE InsuredMember (
    InsuredMemberId INT AUTO_INCREMENT PRIMARY KEY,
    PolicyId        INT NOT NULL,
    FirstName       VARCHAR(100) NOT NULL,
    LastName        VARCHAR(100) NOT NULL,
    Address         VARCHAR(300) NULL,
    Gender          ENUM('Male','Female','Other') NULL,
    BirthDate       DATE NULL,
    Relation        ENUM('Self','Spouse','Child','Parent','Other') NOT NULL,
    IsPrimary       TINYINT(1) NOT NULL DEFAULT 0,
    IsApproved      TINYINT(1) NOT NULL DEFAULT 0,

    CONSTRAINT fk_insuredmember_policy
        FOREIGN KEY (PolicyId) REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_insuredmember_policy ON InsuredMember(PolicyId);

-- =====================================================================
-- POLICY DOCUMENT
-- =====================================================================
DROP TABLE IF EXISTS PolicyDocument;
CREATE TABLE PolicyDocument (
    PolicyDocumentId    INT AUTO_INCREMENT PRIMARY KEY,
    PolicyId            INT NOT NULL,
    DocumentType        VARCHAR(100) NOT NULL,
    DocumentPath        VARCHAR(500) NOT NULL,
    IsValidDocument     TINYINT(1) NOT NULL DEFAULT 0,
    DocumentValidatedBy VARCHAR(150) NULL,
    DocumentValidatedOn DATETIME NULL,
    DocumentUploadedBy  VARCHAR(150) NULL,

    CONSTRAINT fk_policydocument_policy
        FOREIGN KEY (PolicyId) REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_policydoc_policy ON PolicyDocument(PolicyId);

-- =====================================================================
-- PREMIUM PAYMENT (Yearly)
-- =====================================================================
DROP TABLE IF EXISTS PremiumPayment;
CREATE TABLE PremiumPayment (
    PremiumPaymentId        INT AUTO_INCREMENT PRIMARY KEY,
    PolicyId                INT NOT NULL,
    PolicyYear              INT NOT NULL,                 -- 1,2,3,...
    AnnualPremiumAmt        DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    TaxAmount               DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    PaymentMethod           ENUM('UPI','Card','NetBanking','NEFT','RTGS','Cash','Cheque') NULL,
    TransactionReferenceNumber VARCHAR(100) NULL,
    TransactionDate         DATETIME NULL,
    TransactionBy           VARCHAR(150) NULL,
    TransactionSuccessful   TINYINT(1) NOT NULL DEFAULT 0,

    CONSTRAINT fk_premiumpayment_policy
        FOREIGN KEY (PolicyId) REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_premium_policy ON PremiumPayment(PolicyId);
CREATE UNIQUE INDEX uq_premium_policy_year ON PremiumPayment(PolicyId, PolicyYear);

-- =====================================================================
-- CLAIM
-- =====================================================================
DROP TABLE IF EXISTS Claim;
CREATE TABLE Claim (
    ClaimId             INT AUTO_INCREMENT PRIMARY KEY,
    PolicyId            INT NOT NULL,
    InsuredMemberId     INT NOT NULL,
    AdmissionDate       DATETIME NULL,
    ClaimDescription    VARCHAR(500) NULL,
    ClaimReportDate     DATETIME NULL,
    ClaimAmount         DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    ApprovedAmount      DECIMAL(18,2) NULL,
    ClaimStatus         ENUM('Submitted','UnderReview','Approved','Rejected','Paid','Closed') NOT NULL DEFAULT 'Submitted',
    ClaimSubmittedBy    VARCHAR(150) NULL,
    ClaimSubmittedOn    DATETIME NULL,
    ClaimApprovedBy     VARCHAR(150) NULL,
    ClaimApprovedOn     DATETIME NULL,

    CONSTRAINT fk_claim_policy
        FOREIGN KEY (PolicyId) REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE RESTRICT,

    CONSTRAINT fk_claim_insuredmember
        FOREIGN KEY (InsuredMemberId) REFERENCES InsuredMember(InsuredMemberId)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE INDEX ix_claim_policy ON Claim(PolicyId);
CREATE INDEX ix_claim_insuredmember ON Claim(InsuredMemberId);

-- =====================================================================
-- CLAIM DOCUMENT
-- =====================================================================
DROP TABLE IF EXISTS ClaimDocument;
CREATE TABLE ClaimDocument (
    ClaimDocumentId     INT AUTO_INCREMENT PRIMARY KEY,
    ClaimId             INT NOT NULL,
    DocumentType        VARCHAR(100) NOT NULL,
    DocumentPath        VARCHAR(500) NOT NULL,
    IsValidDocument     TINYINT(1) NOT NULL DEFAULT 0,
    DocumentUploadedBy  VARCHAR(150) NULL,
    DocumentApprovedBy  VARCHAR(150) NULL,
    DocumentApprovedOn  DATETIME NULL,
    DocumentUploadedOn  DATETIME NULL,

    CONSTRAINT fk_claimdocument_claim
        FOREIGN KEY (ClaimId) REFERENCES Claim(ClaimId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_claimdoc_claim ON ClaimDocument(ClaimId);

-- =====================================================================
-- CLAIM REIMBURSEMENT
-- =====================================================================
DROP TABLE IF EXISTS ClaimReimbursement;
CREATE TABLE ClaimReimbursement (
    ClaimReimbursementId INT AUTO_INCREMENT PRIMARY KEY,
    ClaimId              INT NOT NULL,
    ClaimPaymentType     ENUM('NEFT','RTGS','UPI','Cheque','Cash') NOT NULL,
    InsuredBankDetails   VARCHAR(300) NULL,
    ClaimReimbursementDate DATETIME NULL,

    CONSTRAINT fk_claimreimbursement_claim
        FOREIGN KEY (ClaimId) REFERENCES Claim(ClaimId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_claimreimb_claim ON ClaimReimbursement(ClaimId);

-- =====================================================================
-- POLICY REJECTION STATUS
-- (As per diagram: ties to Policy and InsuredMember)
-- =====================================================================
DROP TABLE IF EXISTS PolicyRejectionStatus;
CREATE TABLE PolicyRejectionStatus (
    PolicyRejectionId   INT AUTO_INCREMENT PRIMARY KEY,
    PolicyId            INT NOT NULL,
    InsuredMemberId     INT NOT NULL,
    AdmissionDateTime   DATETIME NULL,
    ClaimDescription    VARCHAR(500) NULL,
    ClaimAmountRequested DECIMAL(18,2) NULL,
    ApprovedAmount      DECIMAL(18,2) NULL,

    CONSTRAINT fk_policyrej_policy
        FOREIGN KEY (PolicyId) REFERENCES Policy(PolicyId)
        ON UPDATE CASCADE ON DELETE CASCADE,

    CONSTRAINT fk_policyrej_member
        FOREIGN KEY (InsuredMemberId) REFERENCES InsuredMember(InsuredMemberId)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE INDEX ix_policyrej_policy ON PolicyRejectionStatus(PolicyId);
CREATE INDEX ix_policyrej_member ON PolicyRejectionStatus(InsuredMemberId);