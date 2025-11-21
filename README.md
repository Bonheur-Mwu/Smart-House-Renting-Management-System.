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

- **Name:** wed_29337_Bonheur_HouseRMS_DB
- **Password:** Bonheur
- **Access:** Super Admin (full control)
- **Tool:** Oracle Enterprise Manager (OEM) to check performance
