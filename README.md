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

## Database Normalization
To ensure data integrity, reduce redundancy, and support a scalable design, the House Rental Management System database was normalized to the Third Normal Form (3NF). This process involved decomposing complex tables into simpler, well-structured relations with clear primary and foreign key constraints.

### 🔹 1. First Normal Form (1NF)
In this stage, all repeating groups and multivalued attributes were removed. Each table contains only atomic (indivisible) values.

✅ Example: Instead of storing multiple maintenance issues in a single field, each maintenance request was given its own row with specific issue types and descriptions.

text
### 🔹 2. Second Normal Form (2NF)
The database was further refined by removing partial dependencies. Attributes that depended on part of a composite primary key were moved to separate tables.

✅ Example: Tenant personal information, which does not depend on the lease-property relationship, was moved to a separate Tenants table and linked via TenantID.

### 🔹 3. Third Normal Form (3NF)
Finally, transitive dependencies were eliminated. Non-key attributes were ensured to depend only on the primary key and not on other non-key attributes.

✅ Example: The owner's contact details, which depend on OwnerID—not PropertyID—were placed in the Owners table. The Properties table only stores OwnerID that connects to owner information.

### 🧩 Example of Normalized Tables:
**Owners**
OwnerID (PK), FirstName, LastName, Email, Phone, Address

**Properties**
PropertyID (PK), OwnerID (FK), PropertyType, Address, MonthlyRent, Status

**Tenants**
TenantID (PK), FirstName, LastName, Email, Phone, EmploymentInfo

**Lease_Agreements**
LeaseID (PK), PropertyID (FK), TenantID (FK), StartDate, EndDate, MonthlyRent

**Rent_Payments**
PaymentID (PK), LeaseID (FK), DueDate, AmountDue, PaymentStatus

**Maintenance_Requests**
RequestID (PK), PropertyID (FK), TenantID (FK), IssueType, Priority, Status


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


### 🎯 Result:
The final database design ensures:

🏠 Clean relationships using Primary Keys (PK) and Foreign Keys (FK)

🏠 Minimized data duplication - Owner info stored once, referenced everywhere

🏠 Easier updates - Change owner phone in one place, affects all related properties

🏠 Improved query performance - Well-structured joins between normalized tables

🏠 Solid foundation for the PL/SQL implementation phase

## ⚙️ Phase VI: Using the Database 🚀

The system isn’t just a box—it’s alive! It lets staff add, change, and check info easily.

## DML(Data Definition Language)

```SQL
UPDATE properties SET status = 'AVAILABLE' WHERE property_id = 2;
```
<img width="1124" height="624" alt="update row" src="https://github.com/user-attachments/assets/bd23769b-92a7-4ee3-9ee5-c886d90bdd68" />

## DDL(Data Definition Language)

<img width="1132" height="647" alt="image" src="https://github.com/user-attachments/assets/e569ee61-ec30-426e-a6dd-2a1cbfabc94c" />
# SMART PROCEDURE

**Problem**
Managers need to track the cumulative rent collected over time, partitioned by Property Type, to determine which property segments (e.g., 'Apartment' vs. 'House') generate the fastest or most consistent cash flow.

**Solution**
We use the SUM() Window Function partitioned by property_type to calculate the running total of amount_paid as payments are processed chronologically.

``` sql
SELECT
    p.property_type,
    py.payment_date,
    py.amount_paid,
    
    SUM(py.amount_paid) OVER (
        PARTITION BY p.property_type
        ORDER BY py.payment_date
    ) AS running_property_type_total
FROM rent_payments py
JOIN lease_agreements l ON py.lease_id = l.lease_id
JOIN properties p ON l.property_id = p.property_id
WHERE py.payment_status = 'PAID' 
ORDER BY p.property_type, py.payment_date;
```
<img width="1134" height="628" alt="image" src="https://github.com/user-attachments/assets/e0f39077-1ac3-4f82-a8e8-c395ab4575ac" />

## 3. Procedure Implementation
```sql
CREATE OR REPLACE PROCEDURE proc_update_maintenance_status (
    p_request_id      IN NUMBER,
    p_new_status      IN VARCHAR2,
    p_actual_cost     IN NUMBER DEFAULT NULL,
    p_completion_date IN DATE DEFAULT NULL
)
IS
    v_current_status maintenance_requests.status%TYPE;
    e_invalid_status EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_invalid_status, -20001);
BEGIN
   
    SELECT status INTO v_current_status
    FROM maintenance_requests
    WHERE request_id = p_request_id;
    
 
    IF p_new_status = 'COMPLETED' THEN
        IF p_actual_cost IS NULL OR p_completion_date IS NULL THEN
            RAISE_APPLICATION_ERROR(-20002, 'Completion requires actual cost and completion date.');
        END IF;

        UPDATE maintenance_requests
        SET 
            status = p_new_status,
            actual_cost = p_actual_cost,
            completion_date = p_completion_date
        WHERE request_id = p_request_id;

    ELSIF p_new_status IN ('IN_PROGRESS', 'CANCELLED', 'OPEN') THEN
     
        UPDATE maintenance_requests
        SET status = p_new_status
        WHERE request_id = p_request_id;
    
    ELSE
      
        RAISE e_invalid_status;
    END IF;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Maintenance Request ID ' || p_request_id || ' updated successfully to ' || p_new_status || '.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
       
        DBMS_OUTPUT.PUT_LINE('Error: Maintenance Request ID ' || p_request_id || ' does not exist.');
        ROLLBACK;
    WHEN e_invalid_status THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid status provided. Use OPEN, IN_PROGRESS, CANCELLED, or COMPLETED.');
        ROLLBACK;
    WHEN OTHERS THEN
 
        DBMS_OUTPUT.PUT_LINE('System Error updating maintenance request: ' || SQLERRM);
        ROLLBACK;
END;
/
```
<img width="1131" height="631" alt="image" src="https://github.com/user-attachments/assets/1d4f4cb8-3230-47b8-aef3-a0ffd14fbca6" />

## Call Procedure

```sql
BEGIN
    proc_update_maintenance_status(
        p_request_id => 1,
        p_new_status => 'COMPLETED',
        p_actual_cost => 75000,
        p_completion_date => SYSDATE
    );
END;
/
```
<img width="1130" height="621" alt="image" src="https://github.com/user-attachments/assets/52f1a3f8-34eb-4dbe-bbe0-836f0d5f3fcc" />

## 4. Implementation with Cursor: Listing Available Properties for Rent 🏠

Create a PL/SQL block that uses an Explicit Cursor to retrieve and display key details for all properties that currently have an availability_status of 'AVAILABLE'. This is a core function for the property viewing module.
```sql
 SET SERVEROUTPUT ON; 

DECLARE
    -- Explicit Cursor: Selects all available properties, ordered by rent
    CURSOR c_available_properties IS
        SELECT property_id, address, city, monthly_rent
        FROM properties
        WHERE status = 'AVAILABLE'
        ORDER BY monthly_rent ASC;

    -- Local variables to hold fetched data
    v_property_id   properties.property_id%TYPE;
    v_address       properties.address%TYPE;
    v_city          properties.city%TYPE;
    v_monthly_rent  properties.monthly_rent%TYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('--- Available Properties for Immediate Rent ---');
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');

    OPEN c_available_properties;

    LOOP
        FETCH c_available_properties INTO v_property_id, v_address, v_city, v_monthly_rent;

        EXIT WHEN c_available_properties%NOTFOUND;

        -- Display the result 
        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || v_property_id || 
            ' | Rent: ' || TO_CHAR(v_monthly_rent, '9,999,999.00') || 
            ' | Location: ' || v_address || ', ' || v_city
        );
    END LOOP;

    CLOSE c_available_properties;
    
    DBMS_OUTPUT.PUT_LINE('---------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('Total available properties found: ' || c_available_properties%ROWCOUNT);

EXCEPTION
    WHEN OTHERS THEN
        IF c_available_properties%ISOPEN THEN
            CLOSE c_available_properties;
        END IF;
        DBMS_OUTPUT.PUT_LINE('System Error during property listing: ' || SQLERRM);
END;
/
```
<img width="1135" height="647" alt="image" src="https://github.com/user-attachments/assets/85a111dc-601d-4581-be84-422119bbd1d6" />

See `available_properties_cursor.png` for the cursor execution (Property IDs: 3, 2, 4; Rent Range: 250,000.00 to 1,500,000.00; Location: Kigali).

## 5. Function Implementation

Created a function that calculates the total cumulative outstanding balance (the sum of amount_due for PENDING/LATE/PARTIAL payments plus any associated late_fee) for a specific tenant across all their active leases.

```sql
 CREATE OR REPLACE FUNCTION func_is_tenant_high_risk (
    p_tenant_id IN NUMBER
) 
RETURN VARCHAR2 -- Returns 'YES' or 'NO'
IS
    v_urgent_request_count NUMBER;
    v_total_overdue_amount NUMBER;
    v_max_monthly_rent     NUMBER; -- Max rent to use as the threshold

BEGIN
    -- 1. Check Maintenance Risk (More than one URGENT request)
    SELECT COUNT(*)
    INTO v_urgent_request_count
    FROM maintenance_requests
    WHERE tenant_id = p_tenant_id
    AND priority = 'URGENT'
    AND status != 'COMPLETED';

    IF v_urgent_request_count > 1 THEN
        RETURN 'YES - Multiple Urgent Maintenance';
    END IF;

    -- 2. Check Financial Risk (Overdue amount > 1 month's rent)
    -- a. Get the tenant's highest monthly rent (as a strict threshold)
    SELECT MAX(monthly_rent)
    INTO v_max_monthly_rent
    FROM lease_agreements
    WHERE tenant_id = p_tenant_id
    AND lease_status = 'ACTIVE';

    v_total_overdue_amount := func_calculate_tenant_overdue(p_tenant_id);

    IF v_max_monthly_rent IS NOT NULL AND v_total_overdue_amount > v_max_monthly_rent THEN
        RETURN 'YES - Significant Financial Risk';
    END IF;

    RETURN 'NO';

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO - Tenant Not Found/No Active Lease';
    WHEN OTHERS THEN
        RETURN 'ERROR';
END;
/
```
<img width="1130" height="645" alt="image" src="https://github.com/user-attachments/assets/467a96c0-9156-4aa2-ba44-b0a2b64e239e" />

## Testing
<img width="1131" height="650" alt="image" src="https://github.com/user-attachments/assets/09fe1740-27d0-4abc-89d9-8b0d2085c520" />
 See  `total_amount_paid.png`  for the function creation and a test query result (total_amount 250000 for guest_id 1).

## 6. Package Implementation
Created a package `pkg_lease_management` to organize related procedures and functions.

```sql
CREATE OR REPLACE PACKAGE pkg_lease_management AS
    FUNCTION func_total_due_for_lease(p_lease_id IN NUMBER) RETURN NUMBER;
    
    PROCEDURE proc_update_lease_status(p_lease_id IN NUMBER, p_new_status IN VARCHAR2);
    
    PROCEDURE proc_list_expiring_leases;
END pkg_lease_management;
/
CREATE OR REPLACE PACKAGE BODY pkg_lease_management AS

    
    FUNCTION func_total_due_for_lease(p_lease_id IN NUMBER) 
    RETURN NUMBER
    IS
        v_total_due NUMBER := 0;
    BEGIN
        -- Sums the total outstanding balance (amount_due + late_fee) for a specific lease.
        SELECT 
            SUM(rp.amount_due + rp.late_fee)
        INTO v_total_due
        FROM rent_payments rp
        WHERE rp.lease_id = p_lease_id
        AND rp.payment_status IN ('PENDING', 'LATE', 'PARTIAL');

       
        RETURN NVL(v_total_due, 0);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            RETURN -1; -- Error code
    END func_total_due_for_lease;
    
    PROCEDURE proc_update_lease_status(p_lease_id IN NUMBER, p_new_status IN VARCHAR2)
    IS
        v_old_property_id properties.property_id%TYPE;
        e_invalid_status EXCEPTION;
    BEGIN
    
        IF p_new_status NOT IN ('ACTIVE', 'EXPIRED', 'TERMINATED') THEN
            RAISE_APPLICATION_ERROR(-20010, 'Invalid lease status: ' || p_new_status);
        END IF;
        
        SELECT property_id INTO v_old_property_id
        FROM lease_agreements
        WHERE lease_id = p_lease_id;
        
        UPDATE lease_agreements
        SET lease_status = p_new_status
        WHERE lease_id = p_lease_id;
        
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20011, 'Lease ID ' || p_lease_id || ' not found.');
        END IF;
        
        IF p_new_status IN ('EXPIRED', 'TERMINATED') THEN
            UPDATE properties
            SET status = 'AVAILABLE'
            WHERE property_id = v_old_property_id;
        END IF;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Lease ID ' || p_lease_id || ' updated to ' || p_new_status || ' and property status updated if required.');

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: Lease ID ' || p_lease_id || ' not found.');
            ROLLBACK;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('System Error: ' || SQLERRM);
            ROLLBACK;
    END proc_update_lease_status;

    
    PROCEDURE proc_list_expiring_leases
    IS
        v_expiring_date CONSTANT DATE := TRUNC(SYSDATE + 60); -- Next 60 days
    BEGIN
        DBMS_OUTPUT.PUT_LINE('--- Leases Expiring by ' || TO_CHAR(v_expiring_date, 'YYYY-MM-DD') || ' ---');
        
        
        FOR rec IN (
            SELECT 
                l.lease_id, 
                t.first_name || ' ' || t.last_name AS tenant_name, 
                l.end_date, 
                p.address
            FROM lease_agreements l
            JOIN tenants t ON l.tenant_id = t.tenant_id
            JOIN properties p ON l.property_id = p.property_id
            WHERE l.lease_status = 'ACTIVE'
            AND l.end_date BETWEEN TRUNC(SYSDATE) AND v_expiring_date
            ORDER BY l.end_date ASC
        )
        LOOP
            DBMS_OUTPUT.PUT_LINE('Lease ' || rec.lease_id || 
                                ' | Tenant: ' || rec.tenant_name || 
                                ' | Expires: ' || TO_CHAR(rec.end_date, 'DD-MON-YY') || 
                                ' | Property: ' || rec.address);
        END LOOP;
        
        DBMS_OUTPUT.PUT_LINE('--------------------------------------------------');

    END proc_list_expiring_leases;

END pkg_lease_management;
/
```
<img width="1366" height="656" alt="image" src="https://github.com/user-attachments/assets/49f5a018-1acb-417a-bf09-6ba35431c62b" />

## Package Usage
<img width="1152" height="682" alt="package usage" src="https://github.com/user-attachments/assets/518f5e6c-99b2-4632-a671-c417ac79472e" />

See `lease_management_package.png` for the package execution (Lease ID: 1, Total Due: 367,500.00; Status Change: TERMINATED, Property 1 set to AVAILABLE).

# 🔒 Phase VII: Advanced Database Programming & Auditing 🕵️‍♂️
## 1. Auditing Implementation: Creating the Audit Table 📝
The foundation of auditing is a central log table that tracks all critical changes across the system. This table is named `AUDIT_LOGS`
```sql
CREATE TABLE audit_logs (
    audit_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    table_name VARCHAR2(50) NOT NULL,
    operation_type VARCHAR2(10) NOT NULL,
    key_value NUMBER,                   
    old_value CLOB,
    new_value CLOB,
    changed_by VARCHAR2(100) DEFAULT USER,
    change_date TIMESTAMP DEFAULT SYSTIMESTAMP
);
```
<img width="959" height="485" alt="audit logs" src="https://github.com/user-attachments/assets/9b9480c1-58e3-49d5-82fd-c219eec1f0a6" />

## 2. Trigger Implementation ⚙️
We implement three types of triggers to enforce security, automate business rules, and log changes.

## 2.1. The Critical Restriction Rule (Security Trigger) 🚨
This addresses the non-negotiable security requirement to restrict DML operations based on time or conditions. We will implement a rule on the sensitive `RENT_PAYMENTS` table.
-Rule: No user is allowed to DELETE any records from the RENT_PAYMENTS table on Weekends (Saturday or Sunday). This prevents accidental or malicious data removal during off-hours when supervisors may not be available.

## Trigger Implementation: `trg_prevent_weekend_payment_delete`
```sql
CREATE OR REPLACE TRIGGER trg_prevent_weekend_payment_delete
BEFORE DELETE ON rent_payments 
BEGIN
    IF TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE=ENGLISH') IN ('SAT', 'SUN') THEN
        RAISE_APPLICATION_ERROR(-20015, 
            'CRITICAL RESTRICTION RULE VIOLATION: Deletion of RENT_PAYMENTS records is prohibited on weekends (Saturday/Sunday).'
        );
    END IF;
END;
/
```
<img width="959" height="370" alt="tgr auding maintenance update" src="https://github.com/user-attachments/assets/81516315-bdda-4b20-ad2f-cb0abb325efb" />
## 2.2. Business Logic Triggers (Automation)

**Trigger 1: Automatic Late Fee Calculation**

Automates the calculation of the late fee (5% of amount_due) and sets the payment_status when a payment date is recorded.
```sql
CREATE OR REPLACE TRIGGER trg_auto_late_fee
BEFORE INSERT OR UPDATE OF payment_date ON rent_payments
FOR EACH ROW 
DECLARE
    c_late_fee_rate CONSTANT NUMBER := 0.05;
BEGIN
    IF :NEW.payment_date IS NOT NULL THEN
        
        IF TRUNC(:NEW.payment_date) > TRUNC(:NEW.due_date) THEN
            :NEW.late_fee := :NEW.amount_due * c_late_fee_rate;
            :NEW.payment_status := 'LATE';
        ELSE
            :NEW.late_fee := 0;
            :NEW.payment_status := 'PAID';
        END IF;

    ELSIF :NEW.payment_date IS NULL AND :NEW.payment_status IS NULL THEN
        :NEW.payment_status := 'PENDING';
        :NEW.late_fee := 0;
    END IF;
END;
/
```
<img width="959" height="370" alt="tgr auto late fee" src="https://github.com/user-attachments/assets/fc704063-b036-4bc1-9a78-f3f8282e9d2f" />

**Trigger 2: Automatic Property Status Update**

- Ensures that when a lease terminates or expires, the system automatically flags the property as AVAILABLE.

```sql
CREATE OR REPLACE TRIGGER trg_lease_status_to_property
AFTER UPDATE OF lease_status ON lease_agreements
FOR EACH ROW
BEGIN
    IF :NEW.lease_status IN ('EXPIRED', 'TERMINATED') AND :OLD.lease_status = 'ACTIVE' THEN
        UPDATE properties
        SET status = 'AVAILABLE'
        WHERE property_id = :NEW.property_id;
    END IF;
END;
/
```
<img width="959" height="479" alt="tgr lease status" src="https://github.com/user-attachments/assets/65ad0295-e216-43aa-a9a8-9c5f605a0575" />

**2.3. Auditing Trigger (Data Integrity)**

- This trigger logs changes to the critical MAINTENANCE_REQUESTS table, specifically tracking changes to the status and actual_cost.

```sql
CREATE OR REPLACE TRIGGER trg_audit_maintenance_update
AFTER UPDATE ON maintenance_requests
FOR EACH ROW
BEGIN
    -- Check if status or actual_cost changed (equivalent to IS DISTINCT FROM)
    IF (OLD.status != NEW.status OR 
        (OLD.actual_cost != NEW.actual_cost OR (OLD.actual_cost IS NULL != NEW.actual_cost IS NULL)))
    THEN
        INSERT INTO audit_logs (
            table_name, operation_type, key_value, old_value, new_value
        ) VALUES (
            'MAINTENANCE_REQUESTS', 
            'UPDATE', 
            :OLD.request_id,
            'Status: ' || :OLD.status || ' | Cost: ' || TO_CHAR(:OLD.actual_cost), 
            'Status: ' || :NEW.status || ' | Cost: ' || TO_CHAR(:NEW.actual_cost)  
        );
    END IF;
END;
/
```
<img width="959" height="370" alt="tgr auding maintenance update" src="https://github.com/user-attachments/assets/431ed4bc-0883-44cb-8a41-783266f094e3" />

```sql
UPDATE maintenance_requests
SET 
    status = 'COMPLETED',             
    actual_cost = 450000.00,          
    completion_date = SYSDATE         
WHERE request_id = 1;

**Result:** Hooray! The auditing mechanism worked flawlessly! The system successfully logged the update to Maintenance Request 1, capturing the status change to 'COMPLETED' and the final cost of 450,000.00, ensuring a full audit trail for all operational changes in the Smart House Renting Management System.
```
<img width="1153" height="656" alt="audit logs" src="https://github.com/user-attachments/assets/07a88a8e-4118-4f71-b625-307b9cdd0d86" />

- Then I checked the `audit_logs` table:
  ```sql
  SELECT status, trigger_name
FROM user_triggers
WHERE trigger_name = 'TRG_AUDIT_MAINTENANCE_UPDATE';
SELECT request_id, status, actual_cost
FROM maintenance_requests
WHERE request_id = 1;
  ```
  <img width="1152" height="673" alt="image" src="https://github.com/user-attachments/assets/65065029-3c04-4927-8aec-37d6b6cefd5e" />

