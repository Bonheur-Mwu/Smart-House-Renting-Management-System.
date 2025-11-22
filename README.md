# 💒 Smart House Renting Management System.

Tired of rental management chaos? Our automated system handles payments, maintenance, and leases so you can focus on growing your business.

## 📄  What’s This Project About? 
This is a House Rental Management System built with PL/SQL that automates property rentals - handling everything from tenant applications and lease agreements to rent collection, maintenance requests, and financial tracking through intelligent database automation.

This House Rental Management System is a sophisticated database solution built with Oracle PL/SQL to transform property rental operations from chaotic paperwork to streamlined automation. It's my final exam project for Database Development with PL/SQL at Adventist University of Central Africa (AUCA), designed to help property managers and landlords with 10-100 rental units transition from messy spreadsheets and manual tracking to an efficient, intelligent management platform.

**Student name:** Mwungeri Bonheur

**Student ID:** 29337

**Course:** Database Development with PL/SQL (INSY 8311)

**Lecturer:** Eric Maniraguha (eric.maniraguha@auca.ac.rw)

**Academic Year:** 2025-2026

**Github:** [Link to be added for submission]

My system fixes that!

1. Phase I: Problem Statement and Presentation

2. Phase II: Business Process Modeling (MIS)

3. Phase III: Logical Model Design

4. Phase IV: Database Creation and Naming

5. Phase V: Table Implementation and Data Insertion

6. Phase VI: Database Interaction and Transactions

7. Phase VII: Advanced Database Programming and Auditing

8. Phase VIII: Documentation and Demonstration

9. Testing Results
10. Conclusion

## 🎯 Phase I: What's the Problem? 😕

### The Big Issues

Most property managers and landlords strugles:

👉**Tenant communications** across multiple channels

👉**Manual rent collection** and payment tracking

👉**Paper-based lease agreements** and renewals

👉**Maintenance request chaos** through calls and messages

👉**Financial reporting** in scattered spreadsheets

### Where it fits:

- 🏠 Property Management Companies - Handling multiple rental properties for owners

- 🏢 Real Estate Agencies - Managing their rental portfolios

- 👨‍💼 Individual Landlords - Owning 5-50 rental units

- 🏘️ Vacation Rental Hosts - Managing short-term and long-term rentals

- 🏬 Commercial Property Managers - Office spaces and retail units

### Who uses it?
- 👨‍⚕️**Property Owners/Landlords:** Manage multiple properties and tenants 

- 🙍‍♂️🙎‍♀️**Tenants:** Search for properties, pay rent, and request maintenance 

- 👨💼**Property Managers:** Oversee properties on behalf of owners 

- 👨‍⚖️**Administrators:** Manage the entire platform

### Our Gaols

- ✅ Reduce administrative time: 20+ hours → 5 hours monthly
- ✅ Increase rent collection rate: 85% → 95% on-time payments
- ✅ Cut maintenance response time: 48 hours → 24 hours average
- ✅ Eliminate manual errors: 100% automated financial calculations
- ✅ Improve tenant satisfaction: Measured via reduced complaints
## 🔄 Phase II: Business Process Modeling (MIS)
House rentals are like well-oiled machines ⚙️—every component needs to work together seamlessly. This system organizes the rental process to make it simple and efficient for both landlords and tenants.

### Main Tasks
**Finding & Renting a Property**
Tenant searches → Views available properties → Applies online → Gets approved → Signs digital lease → Pays deposit.

*Example: A young professional relocating to Kigali finds a 2-bedroom apartment online, applies through the system, gets approved in 24 hours, and moves in the following week.*

**Monthly Rent Cycle**
System generates invoice → Tenant pays → Automatic receipt issued → Late fees applied if overdue → Status updated in real-time.

*Real-World: Properties with automated payment systems see 40% faster rent collection and 30% reduction in late payments (Property Management Report, 2024).*

**Maintenance & Repairs**
Tenant reports issue → System prioritizes urgency → Assigns to vendor → Tracks progress → Updates all parties → Closes ticket.

Example: A tenant reports a leaking pipe through the mobile app, system flags it as "URGENT," assigns a plumber within 2 hours, and tracks repair completion.

**Lease Management**
System tracks lease dates → Sends renewal reminders 60 days early → Processes extensions → Updates terms automatically.

Why It Matters: Automated lease management reduces vacancy rates by 15% and ensures continuous rental income.

### 🎯 Why This System Helps
This platform connects to Management Information Systems (MIS), serving as the central brain for rental operations. It:

**📊 Provides Real-Time Dashboards**
- Shows occupancy rates and rental income

- Tracks maintenance response times

- Monitors payment compliance rates

**⚙️ Automates Routine Tasks**
- Generates monthly rent invoices automatically

- Sends payment reminders 3 days before due dates

- Updates property status from "available" to "rented" instantly

**🔗 Centralizes All Data**
- Tenant profiles and rental history in one place

- Maintenance records and cost tracking

- Financial reports and tax documentation

**📈 Measures Performance**
- Tracks average time to fill vacancies

- Monitors tenant satisfaction through request resolution

- Analyzes rental yield and return on investment

 ### Picture of the Process
 I’ll create a **BPMN diagram** (like a map of tasks) showing who does what:

 <img width="5492" height="696" alt="BON BPNM" src="https://github.com/user-attachments/assets/76403b19-70bb-4b4c-9315-a639b47a1a22" />

## 🗂️ Phase III: Planning the Database 📚

Think of the database as a super-organized filing cabinet 📂.It stores all info in a way that’s easy to find and use.
### The Tables
The system has **7 core tables**, like organized folders for different rental information:

1. **Owners:** Who owns the properties?
- `owner_id (unique number), first_name (text, must have), last_name (text, must have), email (text, unique), phone_number (text), address (text), created_date (date, default today)`

2. **Properties:** What houses are available?
- `property_id (unique number), owner_id (links to owners), property_type (text, like "Apartment"), address (text, must have), city (text), monthly_rent (number, must be > 0), bedrooms (number), bathrooms (number), status (text, like "Available")`

3. **Tenants:** Who's renting?
- `tenant_id (unique number), first_name (text, must have), last_name (text, must have), email (text, unique), phone_number (text), employment_info (text), emergency_contact (text), created_date (date, default today)`
4. **Lease_Agreements:** Who rented what?
- `lease_id (unique number), property_id (links to properties), tenant_id (links to tenants), start_date (date, must have), end_date (date, must have), monthly_rent (number, must be > 0), security_deposit (number), lease_status (text, default "Active")`

5. **Rent_Payments:** Who paid when?
- `payment_id (unique number), lease_id (links to leases), due_date (date, must have), amount_due (number, must be > 0), amount_paid (number), payment_date (date), payment_status (text, default "Pending"), late_fee (number, default 0)`

6. **Maintenance_Requests:** What needs fixing?
- `request_id (unique number), property_id (links to properties), tenant_id (links to tenants), issue_type (text, like "Plumbing"), description (text, must have), priority (text, default "Medium"), status (text, default "Open"), completion_date (date)`

7. **Property_Viewings:** Who wants to see what?
- `viewing_id (unique number), property_id (links to properties), tenant_id (links to tenants), scheduled_date (date, must have), status (text, default "Scheduled"), notes (text)`

### 🔗 Relationships
- One owner can own many properties (like one landlord, multiple houses)

- One property can have many leases (rented by different tenants over time)

- One tenant can have many maintenance requests (multiple issues during tenancy)

- One lease can have many rent payments (monthly payments over the lease term)

- One property can have many viewings (shown to multiple potential tenants)

### 🧹 Keeping It Clean
The database is organized to avoid chaos:

- ✅ No repeats: Each owner's info stored once, referenced everywhere
- ✅ Clear links: Every lease connects to both tenant and property
- ✅ No confusion: Simple, direct data with clear relationships
- ✅ Automatic tracking: System dates track when things happen
- ✅ Status management: Current state always visible and updatable
<img width="544" height="618" alt="image" src="https://github.com/user-attachments/assets/bf67dbdf-ee99-4a4b-b5fe-31257e184966" />

**Real-World Fact:** Well-organized databases can cut data errors by 90% in renting house, saving hours of managers and property owner's time (Database Management Trends, 2025).
## 💾 Phase IV: Setting Up the Database 🛠️
Database is like the renting room. It needs a name, a key, and a way to watch it work.

### Details. 

- **Name:** wed_29337_Bonheur_SMARTHRMS_DB
- **Password:** Bonheur
- **Access:** Super Admin (full control)
- **Tool:** Oracle Enterprise Manager (OEM) to check performance
<img width="1357" height="729" alt="PDBS 2" src="https://github.com/user-attachments/assets/1c678961-b571-44ca-ad29-5bba0c3415c2" />

Real-World Facts: Tools like OEM help property managers spot maintenance patterns and payment trends early, reducing vacancy periods by 40% in professionally managed properties (Property Tech Analytics, 2025)

<img width="1365" height="689" alt="OEM 2" src="https://github.com/user-attachments/assets/a50c7201-211e-44d8-9381-c0d1b5b6cc26" />

## 🛠️ Phase V: Building Tables & Adding Info 📦
### Creating Tables
Here’s how I built the database’s “folders”

```SQL
CREATE TABLE owners (
    owner_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(20),
    address VARCHAR2(200),
    created_date DATE DEFAULT SYSDATE
);

CREATE TABLE properties (
    property_id NUMBER PRIMARY KEY,
    owner_id NUMBER NOT NULL,
    property_type VARCHAR2(50) NOT NULL,
    address VARCHAR2(200) NOT NULL,
    city VARCHAR2(100) NOT NULL,
    state VARCHAR2(50) NOT NULL,
    zip_code VARCHAR2(20),
    bedrooms NUMBER,
    bathrooms NUMBER,
    square_feet NUMBER,
    monthly_rent NUMBER(10,2) NOT NULL,
    security_deposit NUMBER(10,2),
    available_date DATE,
    status VARCHAR2(20) DEFAULT 'AVAILABLE',
    description CLOB,
    amenities VARCHAR2(500),
    CONSTRAINT fk_property_owner FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);


CREATE TABLE tenants (
    tenant_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone VARCHAR2(20),
    date_of_birth DATE,
    employment_info VARCHAR2(200),
    emergency_contact VARCHAR2(100),
    emergency_phone VARCHAR2(20),
    created_date DATE DEFAULT SYSDATE
);


CREATE TABLE lease_agreements (
    lease_id NUMBER PRIMARY KEY,
    property_id NUMBER NOT NULL,
    tenant_id NUMBER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    monthly_rent NUMBER(10,2) NOT NULL,
    security_deposit NUMBER(10,2),
    deposit_paid_date DATE,
    lease_status VARCHAR2(20) DEFAULT 'ACTIVE', -- ACTIVE, EXPIRED, TERMINATED
    created_date DATE DEFAULT SYSDATE,
    CONSTRAINT fk_lease_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
    CONSTRAINT fk_lease_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id)
);


CREATE TABLE rent_payments (
    payment_id NUMBER PRIMARY KEY,
    lease_id NUMBER NOT NULL,
    payment_date DATE NOT NULL,
    due_date DATE NOT NULL,
    amount_due NUMBER(10,2) NOT NULL,
    amount_paid NUMBER(10,2),
    payment_method VARCHAR2(50),
    payment_status VARCHAR2(20) DEFAULT 'PENDING', -- PENDING, PAID, LATE, PARTIAL
    late_fee NUMBER(8,2) DEFAULT 0,
    notes VARCHAR2(500),
    CONSTRAINT fk_payment_lease FOREIGN KEY (lease_id) REFERENCES lease_agreements(lease_id)
);


CREATE TABLE maintenance_requests (
    request_id NUMBER PRIMARY KEY,
    property_id NUMBER NOT NULL,
    tenant_id NUMBER NOT NULL,
    request_date DATE DEFAULT SYSDATE,
    issue_type VARCHAR2(100) NOT NULL, -- Plumbing, Electrical, HVAC, etc.
    description CLOB NOT NULL,
    priority VARCHAR2(20) DEFAULT 'MEDIUM', -- LOW, MEDIUM, HIGH, URGENT
    status VARCHAR2(20) DEFAULT 'OPEN', -- OPEN, IN_PROGRESS, COMPLETED, CANCELLED
    assigned_vendor VARCHAR2(100),
    estimated_cost NUMBER(8,2),
    actual_cost NUMBER(8,2),
    completion_date DATE,
    CONSTRAINT fk_maintenance_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
    CONSTRAINT fk_maintenance_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id)
);


CREATE TABLE property_viewings (
    viewing_id NUMBER PRIMARY KEY,
    property_id NUMBER NOT NULL,
    tenant_id NUMBER NOT NULL,
    scheduled_date DATE NOT NULL,
    status VARCHAR2(20) DEFAULT 'SCHEDULED', -- SCHEDULED, COMPLETED, CANCELLED
    notes VARCHAR2(500),
    CONSTRAINT fk_viewing_property FOREIGN KEY (property_id) REFERENCES properties(property_id),
    CONSTRAINT fk_viewing_tenant FOREIGN KEY (tenant_id) REFERENCES tenants(tenant_id)
);
```

<img width="1361" height="725" alt="table creation" src="https://github.com/user-attachments/assets/aee82ace-6774-4246-8b86-008723c9ec6c" />

### Adding Sample Data

I added example info to test the system:

```SQL
INSERT INTO owners (owner_id, first_name, last_name, email, phone, address) VALUES 
(1, 'James', 'Uwimana', 'j.uwimana@email.com', '+250788100100', 'KN 45 St, Kigali, Rwanda')
(2, 'Marie', 'Umutoni', 'm.umutoni@email.com', '+250788200200', 'KK 15 Ave, Kigali, Rwanda');

INSERT INTO properties (property_id, owner_id, property_type, address, city, state, bedrooms, bathrooms, monthly_rent, security_deposit, status) VALUES 
(1, 1, 'Apartment', 'KN 45 St, Apt 3B', 'Kigali', 'Kigali', 2, 1, 350000, 350000, 'RENTED')
(2, 2, 'House', 'KK 15 Ave, House 7', 'Kigali', 'Kigali', 3, 2, 600000, 600000, 'AVAILABLE');

INSERT INTO tenants (tenant_id, first_name, last_name, email, phone, date_of_birth, employment_info, emergency_contact, emergency_phone) VALUES 
(1, 'Alice', 'Uwase', 'a.uwase@email.com', '+250788500500', DATE '1995-03-15', 'Software Developer at K-Lab', 'John Uwase', '+250788500501')
(2, 'Eric', 'Ndungutse', 'e.ndungutse@email.com', '+250788600600', DATE '1992-07-22', 'Teacher at GS Kicukiro', 'Marie Ndungutse', '+250788600601');

INSERT INTO lease_agreements (lease_id, property_id, tenant_id, start_date, end_date, monthly_rent, security_deposit, deposit_paid_date, lease_status) VALUES 
(1, 1, 1, DATE '2024-01-01', DATE '2024-12-31', 350000, 350000, DATE '2023-12-15', 'ACTIVE')
(2, 2, 2, DATE '2024-02-01', DATE '2025-01-31', 600000, 600000, DATE '2024-01-20', 'ACTIVE');

INSERT INTO rent_payments (payment_id, lease_id, payment_date, due_date, amount_due, amount_paid, payment_method, payment_status, late_fee) VALUES 
(1, 1, DATE '2024-01-02', DATE '2024-01-01', 350000, 350000, 'Bank Transfer', 'PAID', 0)
(2, 1, DATE '2024-02-05', DATE '2024-02-01', 350000, 350000, 'Mobile Money', 'PAID', 17500);

INSERT INTO maintenance_requests (request_id, property_id, tenant_id, request_date, issue_type, description, priority, status, assigned_vendor, estimated_cost) VALUES 
(1, 1, 1, DATE '2024-03-15', 'Plumbing', 'Kitchen sink is leaking and water pressure is low', 'HIGH', 'IN_PROGRESS', 'Kigali Plumbing Co.', 75000)
(2, 2, 2, DATE '2024-02-10', 'Electrical', 'Bedroom light switch not working properly', 'MEDIUM', 'COMPLETED', 'Safe Electric Ltd.', 45000, DATE '2024-02-12');

INSERT INTO property_viewings (viewing_id, property_id, tenant_id, scheduled_date, status, notes) VALUES 
(1, 2, 1, DATE '2024-03-25', 'COMPLETED', 'Tenant interested in upgrading to larger property')
(2, 2, 2, DATE '2024-03-28', 'SCHEDULED', 'Initial viewing for potential move');

COMMIT;
```
<img width="1366" height="768" alt="data insertion" src="https://github.com/user-attachments/assets/581f459d-329e-4fdb-a657-19c7d6076ae8" />
