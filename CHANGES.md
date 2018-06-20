# #2.0.1 Release Date: 2018-06-20
Minor bugs fix release

Bugs fixed:

* Notification issue where change manager role is not accessible
* Agent Login-Create Change-Validations and form submit issues
* Agent Login-Create Change-Mandatory filed Issue
* Agent Login-Create Change-Attachment Issue
* Customer Login-New Process Ticket
* Customer Login-Landing page-Search Box UI break Issue
* Problem Dashboard - Issue counts optimized
* Agent Side - Overview page - Bulk issue
* Agent Login-Ticket Overview Page-Quick Actions-Queue Drop down Issue
* Agent Login-Ticket Overview Page-Bulk Print Option Issue
* Agent Login-Ticket Overview Page Issue
* Dashboard-Graph Issue
* Admin-Login Page-Captcha deprecated

# #2.0.0 Release Date: 2018-06-09
Felicity community release candidate features:
Base OTRS version 5.0.18 with ITSM, FAQ, Survey modules with MySQL back-end
Enhanced and additional features as part of Felicity Ganges release:
* Main Dashboard optimized and severity driven visual cues
* Separated ITSM sub-modules for Incident, Problem and Service Request
    * Dashboards, Overview, Escalation grids for each type
    * Multiple incidents to Problem ticket auto-creation 
    * Service Catalog features
    * Standard Workflows for Incident and Problem tickets based on ITIL processes
    * Change and workorders access rights management
    * Workorder assignment to Customer type user
    * Create approval workorder(s) directly from create change 
* New Customer interface
    * Post login landing page
    * FAQ search
    * Service Catalog
* UI changes
    * Queue view changed to selectable dropdown
    * Closed tickets now view-able on respective module page
    * UI as per Unotech custom template – Customer and Agent interface
    * Responsive UI
    * Grid feature change –
        * Customer user
        * From and title now separated 
    * Layout change of Admin page
* General features
    * CK Editor upgraded to version 4.8
    * Custom Print
    * Bulk Print
    * Sorting by Age on grids
    * Agent signature
    * Captcha introduced on Agent interface (feature to be deprecated in next release)
    * Dynamic filed queue mapping (configurable from Admin interface)
    * Escalation Matrix
    * SLA on hold
    * Showing change and workorder details on ticket page
    * Showing ticket details on change page (also on create change page)
* System setup and configuration
    * Created docker compose for application and database