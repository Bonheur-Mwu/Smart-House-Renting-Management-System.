================================
 Smart House Renting Management System - SQL Implementation (Phase V to VII)
 MWUNGERI Bonheur | ID: 29337
 Course: Database Development with PL/SQL (INSY 8311)
 Lecturer: Eric Maniraguha
 Date: 04 DECEMBER 2025
================================
    
 ========== PHASE V: Table Implementation and Data Insertion ==========

---create tables
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
    property_type VARCHAR2(50) NOT NULL, -- Apartment, House, Condo, etc.
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
    status VARCHAR2(20) DEFAULT 'AVAILABLE', -- AVAILABLE, RENTED, MAINTENANCE
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


--sample data

INSERT INTO owners (owner_id, first_name, last_name, email, phone, address) VALUES 
(1, 'James', 'Uwimana', 'j.uwimana@email.com', '+250788100100', 'KN 45 St, Kigali, Rwanda');
INSERT INTO owners (owner_id, first_name, last_name, email, phone, address) VALUES 
(2, 'Marie', 'Umutoni', 'm.umutoni@email.com', '+250788200200', 'KK 15 Ave, Kigali, Rwanda');

INSERT INTO properties (property_id, owner_id, property_type, address, city, state, bedrooms, bathrooms, monthly_rent, security_deposit, status) VALUES 
(1, 1, 'Apartment', 'KN 45 St, Apt 3B', 'Kigali', 'Kigali', 2, 1, 350000, 350000, 'RENTED');
INSERT INTO properties (property_id, owner_id, property_type, address, city, state, bedrooms, bathrooms, monthly_rent, security_deposit, status) VALUES 
(2, 2, 'House', 'KK 15 Ave, House 7', 'Kigali', 'Kigali', 3, 2, 600000, 600000, 'AVAILABLE');

INSERT INTO tenants (tenant_id, first_name, last_name, email, phone, date_of_birth, employment_info, emergency_contact, emergency_phone) VALUES 
(1, 'Alice', 'Uwase', 'a.uwase@email.com', '+250788500500', DATE '1995-03-15', 'Software Developer at K-Lab', 'John Uwase', '+250788500501');
INSERT INTO tenants (tenant_id, first_name, last_name, email, phone, date_of_birth, employment_info, emergency_contact, emergency_phone) VALUES 
(2, 'Eric', 'Ndungutse', 'e.ndungutse@email.com', '+250788600600', DATE '1992-07-22', 'Teacher at GS Kicukiro', 'Marie Ndungutse', '+250788600601');

INSERT INTO lease_agreements (lease_id, property_id, tenant_id, start_date, end_date, monthly_rent, security_deposit, deposit_paid_date, lease_status) VALUES 
(1, 1, 1, DATE '2024-01-01', DATE '2024-12-31', 350000, 350000, DATE '2023-12-15', 'ACTIVE');
INSERT INTO lease_agreements (lease_id, property_id, tenant_id, start_date, end_date, monthly_rent, security_deposit, deposit_paid_date, lease_status) VALUES 
(2, 2, 2, DATE '2024-02-01', DATE '2025-01-31', 600000, 600000, DATE '2024-01-20', 'ACTIVE');

INSERT INTO rent_payments (payment_id, lease_id, payment_date, due_date, amount_due, amount_paid, payment_method, payment_status, late_fee) VALUES 
(1, 1, DATE '2024-01-02', DATE '2024-01-01', 350000, 350000, 'Bank Transfer', 'PAID', 0);
INSERT INTO rent_payments (payment_id, lease_id, payment_date, due_date, amount_due, amount_paid, payment_method, payment_status, late_fee) VALUES 
(2, 1, DATE '2024-02-05', DATE '2024-02-01', 350000, 350000, 'Mobile Money', 'PAID', 17500);

INSERT INTO maintenance_requests (request_id, property_id, tenant_id, request_date, issue_type, description, priority, status, assigned_vendor, estimated_cost) VALUES 
(1, 1, 1, DATE '2024-03-15', 'Plumbing', 'Kitchen sink is leaking and water pressure is low', 'HIGH', 'IN_PROGRESS', 'Kigali Plumbing Co.', 75000);
INSERT INTO maintenance_requests (request_id, property_id, tenant_id, request_date, issue_type, description, priority, status, assigned_vendor, actual_cost, completion_date) VALUES 
(2, 2, 2, DATE '2024-02-10', 'Electrical', 'Bedroom light switch not working properly', 'MEDIUM', 'COMPLETED', 'Safe Electric Ltd.', 45000, DATE '2024-02-12');

INSERT INTO property_viewings (viewing_id, property_id, tenant_id, scheduled_date, status, notes) VALUES 
(1, 2, 1, DATE '2024-03-25', 'COMPLETED', 'Tenant interested in upgrading to larger property');
INSERT INTO property_viewings (viewing_id, property_id, tenant_id, scheduled_date, status, notes) VALUES 
(2, 2, 2, DATE '2024-03-28', 'SCHEDULED', 'Initial viewing for potential move');


-- ========== PHASE VI: Database Interaction and Transactions ==========
 Data Manupulation Language(DML)

 -- Update room status
UPDATE properties SET status = 'AVAILABLE' WHERE property_id = 2;

DDL(Data Definition Language)

CREATE TABLE staff (
	staff id NUMBER PRIMARY RE
	first name VARCHARI (50) NOT NULL,
	last name VARCHAR2 (50) MUT NULL,
	position VARCHAR2 (50),
	phone VARCHAR2 (21),
	email VARCHAR2(100),
	hire date DATE DEFAULT SYSDATE
	);
-- Add a new column
ALTER TABLE staff ADD hire_date DATE;

-- Drop the reviews table
DROP TABLE staff;

Simple Problem:
 “Show the record of every rental payment made by each Tenant, calculate the running total of all payments received from that individual Tenant over
 the lease period, and simultaneously compute the grand running sum of all system revenue collected to date.”

Solution using Window Function:

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

# PROCEDURE


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

Procedure-call 
 
 This goes in your worksheet and works

DECLARE
    v_request_id maintenance_requests.request_id%TYPE := 1;
    v_status maintenance_requests.status%TYPE := 'COMPLETED';
    v_cost maintenance_requests.actual_cost%TYPE := 85000;
    v_completion_date DATE := DATE '2024-03-25';
BEGIN
    proc_update_maintenance_status(
        p_request_id => v_request_id,
        p_new_status => v_status,
        p_actual_cost => v_cost,
        p_completion_date => v_completion_date
    );
END;
/

===============================================================
CREATING TRIGGER:trg_prevent_weekend_payment_delete
===============================================================
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


---CREATING TRIGGER: Automatic Late Fee Calculation.

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

----CREATING TRIGGER: Automatic Property Status Update.

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

----CREATING TRIGGER: Auditing Trigger and data insertion.


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

