-- ----------------------------------------------------------
--  driver: oracle
-- ----------------------------------------------------------
SET DEFINE OFF;
SET SQLBLANKLINES ON;
-- ----------------------------------------------------------
--  create table acl
-- ----------------------------------------------------------
CREATE TABLE acl (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    description VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    stop_after_match NUMBER (5, 0) NULL,
    config_match CLOB NULL,
    config_change CLOB NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT acl_name UNIQUE (name)
);
ALTER TABLE acl ADD CONSTRAINT PK_acl PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_acl';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_acl
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_acl_t
BEFORE INSERT ON acl
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_acl.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_acl_change_by ON acl (change_by);
CREATE INDEX FK_acl_create_by ON acl (create_by);
CREATE INDEX FK_acl_valid_id ON acl (valid_id);
-- ----------------------------------------------------------
--  create table acl_sync
-- ----------------------------------------------------------
CREATE TABLE acl_sync (
    acl_id VARCHAR2 (200) NOT NULL,
    sync_state VARCHAR2 (30) NOT NULL,
    create_time DATE NOT NULL,
    change_time DATE NOT NULL
);
-- ----------------------------------------------------------
--  create table valid
-- ----------------------------------------------------------
CREATE TABLE valid (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT valid_name UNIQUE (name)
);
ALTER TABLE valid ADD CONSTRAINT PK_valid PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_valid';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_valid
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_valid_t
BEFORE INSERT ON valid
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_valid.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_valid_change_by ON valid (change_by);
CREATE INDEX FK_valid_create_by ON valid (create_by);
-- ----------------------------------------------------------
--  create table users
-- ----------------------------------------------------------
CREATE TABLE users (
    id NUMBER (12, 0) NOT NULL,
    login VARCHAR2 (200) NOT NULL,
    pw VARCHAR2 (64) NOT NULL,
    title VARCHAR2 (50) NULL,
    first_name VARCHAR2 (100) NOT NULL,
    last_name VARCHAR2 (100) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT users_login UNIQUE (login)
);
ALTER TABLE users ADD CONSTRAINT PK_users PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_users';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_users
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_users_t
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_users.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_users_change_by ON users (change_by);
CREATE INDEX FK_users_create_by ON users (create_by);
CREATE INDEX FK_users_valid_id ON users (valid_id);
-- ----------------------------------------------------------
--  create table user_preferences
-- ----------------------------------------------------------
CREATE TABLE user_preferences (
    user_id NUMBER (12, 0) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value CLOB NULL
);
CREATE INDEX user_preferences_user_id ON user_preferences (user_id);
-- ----------------------------------------------------------
--  create table groups
-- ----------------------------------------------------------
CREATE TABLE groups (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT groups_name UNIQUE (name)
);
ALTER TABLE groups ADD CONSTRAINT PK_groups PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_groups';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_groups
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_groups_t
BEFORE INSERT ON groups
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_groups.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_groups_change_by ON groups (change_by);
CREATE INDEX FK_groups_create_by ON groups (create_by);
CREATE INDEX FK_groups_valid_id ON groups (valid_id);
-- ----------------------------------------------------------
--  create table group_user
-- ----------------------------------------------------------
CREATE TABLE group_user (
    user_id NUMBER (12, 0) NOT NULL,
    group_id NUMBER (12, 0) NOT NULL,
    permission_key VARCHAR2 (20) NOT NULL,
    permission_value NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_group_user_change_by ON group_user (change_by);
CREATE INDEX FK_group_user_create_by ON group_user (create_by);
CREATE INDEX group_user_group_id ON group_user (group_id);
CREATE INDEX group_user_user_id ON group_user (user_id);
-- ----------------------------------------------------------
--  create table group_role
-- ----------------------------------------------------------
CREATE TABLE group_role (
    role_id NUMBER (12, 0) NOT NULL,
    group_id NUMBER (12, 0) NOT NULL,
    permission_key VARCHAR2 (20) NOT NULL,
    permission_value NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_group_role_change_by ON group_role (change_by);
CREATE INDEX FK_group_role_create_by ON group_role (create_by);
CREATE INDEX group_role_group_id ON group_role (group_id);
CREATE INDEX group_role_role_id ON group_role (role_id);
-- ----------------------------------------------------------
--  create table group_customer_user
-- ----------------------------------------------------------
CREATE TABLE group_customer_user (
    user_id VARCHAR2 (100) NOT NULL,
    group_id NUMBER (12, 0) NOT NULL,
    permission_key VARCHAR2 (20) NOT NULL,
    permission_value NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_group_customer_user_chang04 ON group_customer_user (change_by);
CREATE INDEX FK_group_customer_user_creata6 ON group_customer_user (create_by);
CREATE INDEX group_customer_user_group_id ON group_customer_user (group_id);
CREATE INDEX group_customer_user_user_id ON group_customer_user (user_id);
-- ----------------------------------------------------------
--  create table roles
-- ----------------------------------------------------------
CREATE TABLE roles (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT roles_name UNIQUE (name)
);
ALTER TABLE roles ADD CONSTRAINT PK_roles PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_roles';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_roles
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_roles_t
BEFORE INSERT ON roles
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_roles.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_roles_change_by ON roles (change_by);
CREATE INDEX FK_roles_create_by ON roles (create_by);
CREATE INDEX FK_roles_valid_id ON roles (valid_id);
-- ----------------------------------------------------------
--  create table role_user
-- ----------------------------------------------------------
CREATE TABLE role_user (
    user_id NUMBER (12, 0) NOT NULL,
    role_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_role_user_change_by ON role_user (change_by);
CREATE INDEX FK_role_user_create_by ON role_user (create_by);
CREATE INDEX role_user_role_id ON role_user (role_id);
CREATE INDEX role_user_user_id ON role_user (user_id);
-- ----------------------------------------------------------
--  create table personal_queues
-- ----------------------------------------------------------
CREATE TABLE personal_queues (
    user_id NUMBER (12, 0) NOT NULL,
    queue_id NUMBER (12, 0) NOT NULL
);
CREATE INDEX personal_queues_queue_id ON personal_queues (queue_id);
CREATE INDEX personal_queues_user_id ON personal_queues (user_id);
-- ----------------------------------------------------------
--  create table personal_services
-- ----------------------------------------------------------
CREATE TABLE personal_services (
    user_id NUMBER (12, 0) NOT NULL,
    service_id NUMBER (12, 0) NOT NULL
);
CREATE INDEX personal_services_service_id ON personal_services (service_id);
CREATE INDEX personal_services_user_id ON personal_services (user_id);
-- ----------------------------------------------------------
--  create table salutation
-- ----------------------------------------------------------
CREATE TABLE salutation (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    text VARCHAR2 (3000) NOT NULL,
    content_type VARCHAR2 (250) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT salutation_name UNIQUE (name)
);
ALTER TABLE salutation ADD CONSTRAINT PK_salutation PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_salutation';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_salutation
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_salutation_t
BEFORE INSERT ON salutation
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_salutation.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_salutation_change_by ON salutation (change_by);
CREATE INDEX FK_salutation_create_by ON salutation (create_by);
CREATE INDEX FK_salutation_valid_id ON salutation (valid_id);
-- ----------------------------------------------------------
--  create table signature
-- ----------------------------------------------------------
CREATE TABLE signature (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    text VARCHAR2 (3000) NOT NULL,
    content_type VARCHAR2 (250) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT signature_name UNIQUE (name)
);
ALTER TABLE signature ADD CONSTRAINT PK_signature PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_signature';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_signature
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_signature_t
BEFORE INSERT ON signature
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_signature.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_signature_change_by ON signature (change_by);
CREATE INDEX FK_signature_create_by ON signature (create_by);
CREATE INDEX FK_signature_valid_id ON signature (valid_id);
-- ----------------------------------------------------------
--  create table system_address
-- ----------------------------------------------------------
CREATE TABLE system_address (
    id NUMBER (5, 0) NOT NULL,
    value0 VARCHAR2 (200) NOT NULL,
    value1 VARCHAR2 (200) NOT NULL,
    value2 VARCHAR2 (200) NULL,
    value3 VARCHAR2 (200) NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE system_address ADD CONSTRAINT PK_system_address PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_system_address';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_system_address
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_system_address_t
BEFORE INSERT ON system_address
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_system_address.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_system_address_change_by ON system_address (change_by);
CREATE INDEX FK_system_address_create_by ON system_address (create_by);
CREATE INDEX FK_system_address_valid_id ON system_address (valid_id);
-- ----------------------------------------------------------
--  create table system_maintenance
-- ----------------------------------------------------------
CREATE TABLE system_maintenance (
    id NUMBER (12, 0) NOT NULL,
    start_date NUMBER (12, 0) NOT NULL,
    stop_date NUMBER (12, 0) NOT NULL,
    comments VARCHAR2 (250) NOT NULL,
    login_message VARCHAR2 (250) NULL,
    show_login_message NUMBER (5, 0) NULL,
    notify_message VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE system_maintenance ADD CONSTRAINT PK_system_maintenance PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_system_maintenance';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_system_maintenance
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_system_maintenance_t
BEFORE INSERT ON system_maintenance
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_system_maintenance.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_system_maintenance_changefb ON system_maintenance (change_by);
CREATE INDEX FK_system_maintenance_createf5 ON system_maintenance (create_by);
CREATE INDEX FK_system_maintenance_valid_id ON system_maintenance (valid_id);
-- ----------------------------------------------------------
--  create table follow_up_possible
-- ----------------------------------------------------------
CREATE TABLE follow_up_possible (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT follow_up_possible_name UNIQUE (name)
);
ALTER TABLE follow_up_possible ADD CONSTRAINT PK_follow_up_possible PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_follow_up_possible';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_follow_up_possible
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_follow_up_possible_t
BEFORE INSERT ON follow_up_possible
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_follow_up_possible.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_follow_up_possible_change8f ON follow_up_possible (change_by);
CREATE INDEX FK_follow_up_possible_create7e ON follow_up_possible (create_by);
CREATE INDEX FK_follow_up_possible_valid_id ON follow_up_possible (valid_id);
-- ----------------------------------------------------------
--  create table queue
-- ----------------------------------------------------------
CREATE TABLE queue (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    group_id NUMBER (12, 0) NOT NULL,
    unlock_timeout NUMBER (12, 0) NULL,
    first_response_time NUMBER (12, 0) NULL,
    first_response_notify NUMBER (5, 0) NULL,
    update_time NUMBER (12, 0) NULL,
    update_notify NUMBER (5, 0) NULL,
    solution_time NUMBER (12, 0) NULL,
    solution_notify NUMBER (5, 0) NULL,
    system_address_id NUMBER (5, 0) NOT NULL,
    calendar_name VARCHAR2 (100) NULL,
    default_sign_key VARCHAR2 (100) NULL,
    salutation_id NUMBER (5, 0) NOT NULL,
    signature_id NUMBER (5, 0) NOT NULL,
    follow_up_id NUMBER (5, 0) NOT NULL,
    follow_up_lock NUMBER (5, 0) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT queue_name UNIQUE (name)
);
ALTER TABLE queue ADD CONSTRAINT PK_queue PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_queue';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_queue
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_queue_t
BEFORE INSERT ON queue
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_queue.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_queue_change_by ON queue (change_by);
CREATE INDEX FK_queue_create_by ON queue (create_by);
CREATE INDEX FK_queue_follow_up_id ON queue (follow_up_id);
CREATE INDEX FK_queue_salutation_id ON queue (salutation_id);
CREATE INDEX FK_queue_signature_id ON queue (signature_id);
CREATE INDEX FK_queue_system_address_id ON queue (system_address_id);
CREATE INDEX FK_queue_valid_id ON queue (valid_id);
CREATE INDEX queue_group_id ON queue (group_id);
-- ----------------------------------------------------------
--  create table queue_preferences
-- ----------------------------------------------------------
CREATE TABLE queue_preferences (
    queue_id NUMBER (12, 0) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value VARCHAR2 (250) NULL
);
CREATE INDEX queue_preferences_queue_id ON queue_preferences (queue_id);
-- ----------------------------------------------------------
--  create table ticket_priority
-- ----------------------------------------------------------
CREATE TABLE ticket_priority (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_priority_name UNIQUE (name)
);
ALTER TABLE ticket_priority ADD CONSTRAINT PK_ticket_priority PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_priority';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_priority
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_priority_t
BEFORE INSERT ON ticket_priority
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_priority.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_priority_change_by ON ticket_priority (change_by);
CREATE INDEX FK_ticket_priority_create_by ON ticket_priority (create_by);
-- ----------------------------------------------------------
--  create table ticket_type
-- ----------------------------------------------------------
CREATE TABLE ticket_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_type_name UNIQUE (name)
);
ALTER TABLE ticket_type ADD CONSTRAINT PK_ticket_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_type_t
BEFORE INSERT ON ticket_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_type_change_by ON ticket_type (change_by);
CREATE INDEX FK_ticket_type_create_by ON ticket_type (create_by);
CREATE INDEX FK_ticket_type_valid_id ON ticket_type (valid_id);
-- ----------------------------------------------------------
--  create table ticket_lock_type
-- ----------------------------------------------------------
CREATE TABLE ticket_lock_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_lock_type_name UNIQUE (name)
);
ALTER TABLE ticket_lock_type ADD CONSTRAINT PK_ticket_lock_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_lock_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_lock_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_lock_type_t
BEFORE INSERT ON ticket_lock_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_lock_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_lock_type_change_by ON ticket_lock_type (change_by);
CREATE INDEX FK_ticket_lock_type_create_by ON ticket_lock_type (create_by);
CREATE INDEX FK_ticket_lock_type_valid_id ON ticket_lock_type (valid_id);
-- ----------------------------------------------------------
--  create table ticket_state
-- ----------------------------------------------------------
CREATE TABLE ticket_state (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    type_id NUMBER (5, 0) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_state_name UNIQUE (name)
);
ALTER TABLE ticket_state ADD CONSTRAINT PK_ticket_state PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_state';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_state
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_state_t
BEFORE INSERT ON ticket_state
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_state.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_state_change_by ON ticket_state (change_by);
CREATE INDEX FK_ticket_state_create_by ON ticket_state (create_by);
CREATE INDEX FK_ticket_state_type_id ON ticket_state (type_id);
CREATE INDEX FK_ticket_state_valid_id ON ticket_state (valid_id);
-- ----------------------------------------------------------
--  create table ticket_state_type
-- ----------------------------------------------------------
CREATE TABLE ticket_state_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_state_type_name UNIQUE (name)
);
ALTER TABLE ticket_state_type ADD CONSTRAINT PK_ticket_state_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_state_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_state_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_state_type_t
BEFORE INSERT ON ticket_state_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_state_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_state_type_change_by ON ticket_state_type (change_by);
CREATE INDEX FK_ticket_state_type_create_by ON ticket_state_type (create_by);
-- ----------------------------------------------------------
--  create table ticket
-- ----------------------------------------------------------
CREATE TABLE ticket (
    id NUMBER (20, 0) NOT NULL,
    tn VARCHAR2 (50) NOT NULL,
    title VARCHAR2 (255) NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    ticket_lock_id NUMBER (5, 0) NOT NULL,
    type_id NUMBER (5, 0) NULL,
    service_id NUMBER (12, 0) NULL,
    sla_id NUMBER (12, 0) NULL,
    user_id NUMBER (12, 0) NOT NULL,
    responsible_user_id NUMBER (12, 0) NOT NULL,
    ticket_priority_id NUMBER (5, 0) NOT NULL,
    ticket_state_id NUMBER (5, 0) NOT NULL,
    customer_id VARCHAR2 (150) NULL,
    customer_user_id VARCHAR2 (250) NULL,
    timeout NUMBER (12, 0) NOT NULL,
    until_time NUMBER (12, 0) NOT NULL,
    escalation_time NUMBER (12, 0) NOT NULL,
    escalation_update_time NUMBER (12, 0) NOT NULL,
    escalation_response_time NUMBER (12, 0) NOT NULL,
    escalation_solution_time NUMBER (12, 0) NOT NULL,
    archive_flag NUMBER (5, 0) DEFAULT 0 NOT NULL,
    create_time_unix NUMBER (20, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_tn UNIQUE (tn)
);
ALTER TABLE ticket ADD CONSTRAINT PK_ticket PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_t
BEFORE INSERT ON ticket
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_change_by ON ticket (change_by);
CREATE INDEX FK_ticket_create_by ON ticket (create_by);
CREATE INDEX FK_ticket_service_id ON ticket (service_id);
CREATE INDEX FK_ticket_sla_id ON ticket (sla_id);
CREATE INDEX ticket_archive_flag ON ticket (archive_flag);
CREATE INDEX ticket_create_time ON ticket (create_time);
CREATE INDEX ticket_create_time_unix ON ticket (create_time_unix);
CREATE INDEX ticket_customer_id ON ticket (customer_id);
CREATE INDEX ticket_customer_user_id ON ticket (customer_user_id);
CREATE INDEX ticket_escalation_response_t29 ON ticket (escalation_response_time);
CREATE INDEX ticket_escalation_solution_td9 ON ticket (escalation_solution_time);
CREATE INDEX ticket_escalation_time ON ticket (escalation_time);
CREATE INDEX ticket_escalation_update_time ON ticket (escalation_update_time);
CREATE INDEX ticket_queue_id ON ticket (queue_id);
CREATE INDEX ticket_queue_view ON ticket (ticket_state_id, ticket_lock_id);
CREATE INDEX ticket_responsible_user_id ON ticket (responsible_user_id);
CREATE INDEX ticket_ticket_lock_id ON ticket (ticket_lock_id);
CREATE INDEX ticket_ticket_priority_id ON ticket (ticket_priority_id);
CREATE INDEX ticket_ticket_state_id ON ticket (ticket_state_id);
CREATE INDEX ticket_timeout ON ticket (timeout);
CREATE INDEX ticket_title ON ticket (title);
CREATE INDEX ticket_type_id ON ticket (type_id);
CREATE INDEX ticket_until_time ON ticket (until_time);
CREATE INDEX ticket_user_id ON ticket (user_id);
-- ----------------------------------------------------------
--  create table ticket_flag
-- ----------------------------------------------------------
CREATE TABLE ticket_flag (
    ticket_id NUMBER (20, 0) NOT NULL,
    ticket_key VARCHAR2 (50) NOT NULL,
    ticket_value VARCHAR2 (50) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_flag_per_user UNIQUE (ticket_id, ticket_key, create_by)
);
CREATE INDEX FK_ticket_flag_create_by ON ticket_flag (create_by);
CREATE INDEX ticket_flag_ticket_id ON ticket_flag (ticket_id);
CREATE INDEX ticket_flag_ticket_id_create7d ON ticket_flag (ticket_id, create_by);
CREATE INDEX ticket_flag_ticket_id_ticketca ON ticket_flag (ticket_id, ticket_key);
-- ----------------------------------------------------------
--  create table ticket_history
-- ----------------------------------------------------------
CREATE TABLE ticket_history (
    id NUMBER (20, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    history_type_id NUMBER (5, 0) NOT NULL,
    ticket_id NUMBER (20, 0) NOT NULL,
    article_id NUMBER (20, 0) NULL,
    type_id NUMBER (5, 0) NOT NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    owner_id NUMBER (12, 0) NOT NULL,
    priority_id NUMBER (5, 0) NOT NULL,
    state_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE ticket_history ADD CONSTRAINT PK_ticket_history PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_history';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_history
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_history_t
BEFORE INSERT ON ticket_history
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_history.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_history_article_id ON ticket_history (article_id);
CREATE INDEX FK_ticket_history_change_by ON ticket_history (change_by);
CREATE INDEX FK_ticket_history_create_by ON ticket_history (create_by);
CREATE INDEX ticket_history_create_time ON ticket_history (create_time);
CREATE INDEX ticket_history_history_type_id ON ticket_history (history_type_id);
CREATE INDEX ticket_history_owner_id ON ticket_history (owner_id);
CREATE INDEX ticket_history_priority_id ON ticket_history (priority_id);
CREATE INDEX ticket_history_queue_id ON ticket_history (queue_id);
CREATE INDEX ticket_history_state_id ON ticket_history (state_id);
CREATE INDEX ticket_history_ticket_id ON ticket_history (ticket_id);
CREATE INDEX ticket_history_type_id ON ticket_history (type_id);
-- ----------------------------------------------------------
--  create table ticket_history_type
-- ----------------------------------------------------------
CREATE TABLE ticket_history_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT ticket_history_type_name UNIQUE (name)
);
ALTER TABLE ticket_history_type ADD CONSTRAINT PK_ticket_history_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_ticket_history_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_ticket_history_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_ticket_history_type_t
BEFORE INSERT ON ticket_history_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_ticket_history_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_ticket_history_type_chang16 ON ticket_history_type (change_by);
CREATE INDEX FK_ticket_history_type_creat39 ON ticket_history_type (create_by);
CREATE INDEX FK_ticket_history_type_validad ON ticket_history_type (valid_id);
-- ----------------------------------------------------------
--  create table ticket_watcher
-- ----------------------------------------------------------
CREATE TABLE ticket_watcher (
    ticket_id NUMBER (20, 0) NOT NULL,
    user_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_ticket_watcher_change_by ON ticket_watcher (change_by);
CREATE INDEX FK_ticket_watcher_create_by ON ticket_watcher (create_by);
CREATE INDEX ticket_watcher_ticket_id ON ticket_watcher (ticket_id);
CREATE INDEX ticket_watcher_user_id ON ticket_watcher (user_id);
-- ----------------------------------------------------------
--  create table ticket_index
-- ----------------------------------------------------------
CREATE TABLE ticket_index (
    ticket_id NUMBER (20, 0) NOT NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    queue VARCHAR2 (200) NOT NULL,
    group_id NUMBER (12, 0) NOT NULL,
    s_lock VARCHAR2 (200) NOT NULL,
    s_state VARCHAR2 (200) NOT NULL,
    create_time_unix NUMBER (20, 0) NOT NULL
);
CREATE INDEX ticket_index_group_id ON ticket_index (group_id);
CREATE INDEX ticket_index_queue_id ON ticket_index (queue_id);
CREATE INDEX ticket_index_ticket_id ON ticket_index (ticket_id);
-- ----------------------------------------------------------
--  create table ticket_lock_index
-- ----------------------------------------------------------
CREATE TABLE ticket_lock_index (
    ticket_id NUMBER (20, 0) NOT NULL
);
CREATE INDEX ticket_lock_index_ticket_id ON ticket_lock_index (ticket_id);
-- ----------------------------------------------------------
--  create table ticket_loop_protection
-- ----------------------------------------------------------
CREATE TABLE ticket_loop_protection (
    sent_to VARCHAR2 (250) NOT NULL,
    sent_date VARCHAR2 (150) NOT NULL
);
CREATE INDEX ticket_loop_protection_sent_37 ON ticket_loop_protection (sent_date);
CREATE INDEX ticket_loop_protection_sent_to ON ticket_loop_protection (sent_to);
-- ----------------------------------------------------------
--  create table article_type
-- ----------------------------------------------------------
CREATE TABLE article_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT article_type_name UNIQUE (name)
);
ALTER TABLE article_type ADD CONSTRAINT PK_article_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_article_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_article_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_article_type_t
BEFORE INSERT ON article_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_article_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_article_type_change_by ON article_type (change_by);
CREATE INDEX FK_article_type_create_by ON article_type (create_by);
CREATE INDEX FK_article_type_valid_id ON article_type (valid_id);
-- ----------------------------------------------------------
--  create table article_sender_type
-- ----------------------------------------------------------
CREATE TABLE article_sender_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT article_sender_type_name UNIQUE (name)
);
ALTER TABLE article_sender_type ADD CONSTRAINT PK_article_sender_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_article_sender_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_article_sender_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_article_sender_type_t
BEFORE INSERT ON article_sender_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_article_sender_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_article_sender_type_chang7b ON article_sender_type (change_by);
CREATE INDEX FK_article_sender_type_creat54 ON article_sender_type (create_by);
CREATE INDEX FK_article_sender_type_validfb ON article_sender_type (valid_id);
-- ----------------------------------------------------------
--  create table article_flag
-- ----------------------------------------------------------
CREATE TABLE article_flag (
    article_id NUMBER (20, 0) NOT NULL,
    article_key VARCHAR2 (50) NOT NULL,
    article_value VARCHAR2 (50) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_article_flag_create_by ON article_flag (create_by);
CREATE INDEX article_flag_article_id ON article_flag (article_id);
CREATE INDEX article_flag_article_id_crea15 ON article_flag (article_id, create_by);
-- ----------------------------------------------------------
--  create table article
-- ----------------------------------------------------------
CREATE TABLE article (
    id NUMBER (20, 0) NOT NULL,
    ticket_id NUMBER (20, 0) NOT NULL,
    article_type_id NUMBER (5, 0) NOT NULL,
    article_sender_type_id NUMBER (5, 0) NOT NULL,
    a_from VARCHAR2 (3800) NULL,
    a_reply_to VARCHAR2 (500) NULL,
    a_to VARCHAR2 (3800) NULL,
    a_cc VARCHAR2 (3800) NULL,
    a_subject VARCHAR2 (3800) NULL,
    a_message_id VARCHAR2 (3800) NULL,
    a_message_id_md5 VARCHAR2 (32) NULL,
    a_in_reply_to VARCHAR2 (3800) NULL,
    a_references VARCHAR2 (3800) NULL,
    a_content_type VARCHAR2 (250) NULL,
    a_body CLOB NOT NULL,
    incoming_time NUMBER (12, 0) NOT NULL,
    content_path VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE article ADD CONSTRAINT PK_article PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_article';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_article
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_article_t
BEFORE INSERT ON article
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_article.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_article_change_by ON article (change_by);
CREATE INDEX FK_article_create_by ON article (create_by);
CREATE INDEX FK_article_valid_id ON article (valid_id);
CREATE INDEX article_article_sender_type_id ON article (article_sender_type_id);
CREATE INDEX article_article_type_id ON article (article_type_id);
CREATE INDEX article_message_id_md5 ON article (a_message_id_md5);
CREATE INDEX article_ticket_id ON article (ticket_id);
-- ----------------------------------------------------------
--  create table article_search
-- ----------------------------------------------------------
CREATE TABLE article_search (
    id NUMBER (20, 0) NOT NULL,
    ticket_id NUMBER (20, 0) NOT NULL,
    article_type_id NUMBER (5, 0) NOT NULL,
    article_sender_type_id NUMBER (5, 0) NOT NULL,
    a_from VARCHAR2 (3800) NULL,
    a_to VARCHAR2 (3800) NULL,
    a_cc VARCHAR2 (3800) NULL,
    a_subject VARCHAR2 (3800) NULL,
    a_body CLOB NOT NULL,
    incoming_time NUMBER (12, 0) NOT NULL
);
ALTER TABLE article_search ADD CONSTRAINT PK_article_search PRIMARY KEY (id);
CREATE INDEX article_search_article_sendec7 ON article_search (article_sender_type_id);
CREATE INDEX article_search_article_type_id ON article_search (article_type_id);
CREATE INDEX article_search_ticket_id ON article_search (ticket_id);
-- ----------------------------------------------------------
--  create table article_plain
-- ----------------------------------------------------------
CREATE TABLE article_plain (
    id NUMBER (20, 0) NOT NULL,
    article_id NUMBER (20, 0) NOT NULL,
    body CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE article_plain ADD CONSTRAINT PK_article_plain PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_article_plain';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_article_plain
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_article_plain_t
BEFORE INSERT ON article_plain
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_article_plain.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_article_plain_change_by ON article_plain (change_by);
CREATE INDEX FK_article_plain_create_by ON article_plain (create_by);
CREATE INDEX article_plain_article_id ON article_plain (article_id);
-- ----------------------------------------------------------
--  create table article_attachment
-- ----------------------------------------------------------
CREATE TABLE article_attachment (
    id NUMBER (20, 0) NOT NULL,
    article_id NUMBER (20, 0) NOT NULL,
    filename VARCHAR2 (250) NULL,
    content_size VARCHAR2 (30) NULL,
    content_type VARCHAR2 (450) NULL,
    content_id VARCHAR2 (250) NULL,
    content_alternative VARCHAR2 (50) NULL,
    disposition VARCHAR2 (15) NULL,
    content CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE article_attachment ADD CONSTRAINT PK_article_attachment PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_article_attachment';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_article_attachment
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_article_attachment_t
BEFORE INSERT ON article_attachment
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_article_attachment.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_article_attachment_change1e ON article_attachment (change_by);
CREATE INDEX FK_article_attachment_create01 ON article_attachment (create_by);
CREATE INDEX article_attachment_article_id ON article_attachment (article_id);
-- ----------------------------------------------------------
--  create table time_accounting
-- ----------------------------------------------------------
CREATE TABLE time_accounting (
    id NUMBER (20, 0) NOT NULL,
    ticket_id NUMBER (20, 0) NOT NULL,
    article_id NUMBER (20, 0) NULL,
    time_unit DECIMAL (10,2) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE time_accounting ADD CONSTRAINT PK_time_accounting PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_time_accounting';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_time_accounting
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_time_accounting_t
BEFORE INSERT ON time_accounting
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_time_accounting.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_time_accounting_article_id ON time_accounting (article_id);
CREATE INDEX FK_time_accounting_change_by ON time_accounting (change_by);
CREATE INDEX FK_time_accounting_create_by ON time_accounting (create_by);
CREATE INDEX time_accounting_ticket_id ON time_accounting (ticket_id);
-- ----------------------------------------------------------
--  create table standard_template
-- ----------------------------------------------------------
CREATE TABLE standard_template (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    text CLOB NULL,
    content_type VARCHAR2 (250) NULL,
    template_type VARCHAR2 (100) DEFAULT 'Answer' NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT standard_template_name UNIQUE (name)
);
ALTER TABLE standard_template ADD CONSTRAINT PK_standard_template PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_standard_template';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_standard_template
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_standard_template_t
BEFORE INSERT ON standard_template
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_standard_template.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_standard_template_change_by ON standard_template (change_by);
CREATE INDEX FK_standard_template_create_by ON standard_template (create_by);
CREATE INDEX FK_standard_template_valid_id ON standard_template (valid_id);
-- ----------------------------------------------------------
--  create table queue_standard_template
-- ----------------------------------------------------------
CREATE TABLE queue_standard_template (
    queue_id NUMBER (12, 0) NOT NULL,
    standard_template_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_queue_standard_template_c33 ON queue_standard_template (change_by);
CREATE INDEX FK_queue_standard_template_c0d ON queue_standard_template (create_by);
CREATE INDEX FK_queue_standard_template_q63 ON queue_standard_template (queue_id);
CREATE INDEX FK_queue_standard_template_s54 ON queue_standard_template (standard_template_id);
-- ----------------------------------------------------------
--  create table standard_attachment
-- ----------------------------------------------------------
CREATE TABLE standard_attachment (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    content_type VARCHAR2 (250) NOT NULL,
    content CLOB NOT NULL,
    filename VARCHAR2 (250) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT standard_attachment_name UNIQUE (name)
);
ALTER TABLE standard_attachment ADD CONSTRAINT PK_standard_attachment PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_standard_attachment';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_standard_attachment
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_standard_attachment_t
BEFORE INSERT ON standard_attachment
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_standard_attachment.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_standard_attachment_chang1b ON standard_attachment (change_by);
CREATE INDEX FK_standard_attachment_creat8b ON standard_attachment (create_by);
CREATE INDEX FK_standard_attachment_validfe ON standard_attachment (valid_id);
-- ----------------------------------------------------------
--  create table standard_template_attachment
-- ----------------------------------------------------------
CREATE TABLE standard_template_attachment (
    id NUMBER (12, 0) NOT NULL,
    standard_attachment_id NUMBER (12, 0) NOT NULL,
    standard_template_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE standard_template_attachment ADD CONSTRAINT PK_standard_template_attachmb7 PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_standard_template_attacc3';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_standard_template_attacc3
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_standard_template_attacc3_t
BEFORE INSERT ON standard_template_attachment
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_standard_template_attacc3.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_standard_template_attachmbd ON standard_template_attachment (change_by);
CREATE INDEX FK_standard_template_attachmb7 ON standard_template_attachment (create_by);
CREATE INDEX FK_standard_template_attachm9e ON standard_template_attachment (standard_attachment_id);
CREATE INDEX FK_standard_template_attachm29 ON standard_template_attachment (standard_template_id);
-- ----------------------------------------------------------
--  create table auto_response_type
-- ----------------------------------------------------------
CREATE TABLE auto_response_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT auto_response_type_name UNIQUE (name)
);
ALTER TABLE auto_response_type ADD CONSTRAINT PK_auto_response_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_auto_response_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_auto_response_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_auto_response_type_t
BEFORE INSERT ON auto_response_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_auto_response_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_auto_response_type_changeec ON auto_response_type (change_by);
CREATE INDEX FK_auto_response_type_created6 ON auto_response_type (create_by);
CREATE INDEX FK_auto_response_type_valid_id ON auto_response_type (valid_id);
-- ----------------------------------------------------------
--  create table auto_response
-- ----------------------------------------------------------
CREATE TABLE auto_response (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    text0 CLOB NULL,
    text1 CLOB NULL,
    type_id NUMBER (5, 0) NOT NULL,
    system_address_id NUMBER (5, 0) NOT NULL,
    content_type VARCHAR2 (250) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT auto_response_name UNIQUE (name)
);
ALTER TABLE auto_response ADD CONSTRAINT PK_auto_response PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_auto_response';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_auto_response
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_auto_response_t
BEFORE INSERT ON auto_response
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_auto_response.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_auto_response_change_by ON auto_response (change_by);
CREATE INDEX FK_auto_response_create_by ON auto_response (create_by);
CREATE INDEX FK_auto_response_system_addr26 ON auto_response (system_address_id);
CREATE INDEX FK_auto_response_type_id ON auto_response (type_id);
CREATE INDEX FK_auto_response_valid_id ON auto_response (valid_id);
-- ----------------------------------------------------------
--  create table queue_auto_response
-- ----------------------------------------------------------
CREATE TABLE queue_auto_response (
    id NUMBER (12, 0) NOT NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    auto_response_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE queue_auto_response ADD CONSTRAINT PK_queue_auto_response PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_queue_auto_response';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_queue_auto_response
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_queue_auto_response_t
BEFORE INSERT ON queue_auto_response
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_queue_auto_response.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_queue_auto_response_auto_3d ON queue_auto_response (auto_response_id);
CREATE INDEX FK_queue_auto_response_changc3 ON queue_auto_response (change_by);
CREATE INDEX FK_queue_auto_response_creat75 ON queue_auto_response (create_by);
CREATE INDEX FK_queue_auto_response_queue7a ON queue_auto_response (queue_id);
-- ----------------------------------------------------------
--  create table service
-- ----------------------------------------------------------
CREATE TABLE service (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    comments VARCHAR2 (250) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT service_name UNIQUE (name)
);
ALTER TABLE service ADD CONSTRAINT PK_service PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_service';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_service
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_service_t
BEFORE INSERT ON service
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_service.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_service_change_by ON service (change_by);
CREATE INDEX FK_service_create_by ON service (create_by);
-- ----------------------------------------------------------
--  create table service_preferences
-- ----------------------------------------------------------
CREATE TABLE service_preferences (
    service_id NUMBER (12, 0) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value VARCHAR2 (250) NULL
);
CREATE INDEX service_preferences_service_id ON service_preferences (service_id);
-- ----------------------------------------------------------
--  create table service_customer_user
-- ----------------------------------------------------------
CREATE TABLE service_customer_user (
    customer_user_login VARCHAR2 (200) NOT NULL,
    service_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL
);
CREATE INDEX FK_service_customer_user_creb7 ON service_customer_user (create_by);
CREATE INDEX service_customer_user_custom7e ON service_customer_user (customer_user_login);
CREATE INDEX service_customer_user_servic99 ON service_customer_user (service_id);
-- ----------------------------------------------------------
--  create table sla
-- ----------------------------------------------------------
CREATE TABLE sla (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    calendar_name VARCHAR2 (100) NULL,
    first_response_time NUMBER (12, 0) NOT NULL,
    first_response_notify NUMBER (5, 0) NULL,
    update_time NUMBER (12, 0) NOT NULL,
    update_notify NUMBER (5, 0) NULL,
    solution_time NUMBER (12, 0) NOT NULL,
    solution_notify NUMBER (5, 0) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    comments VARCHAR2 (250) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT sla_name UNIQUE (name)
);
ALTER TABLE sla ADD CONSTRAINT PK_sla PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_sla';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_sla
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_sla_t
BEFORE INSERT ON sla
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_sla.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_sla_change_by ON sla (change_by);
CREATE INDEX FK_sla_create_by ON sla (create_by);
-- ----------------------------------------------------------
--  create table sla_preferences
-- ----------------------------------------------------------
CREATE TABLE sla_preferences (
    sla_id NUMBER (12, 0) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value VARCHAR2 (250) NULL
);
CREATE INDEX sla_preferences_sla_id ON sla_preferences (sla_id);
-- ----------------------------------------------------------
--  create table service_sla
-- ----------------------------------------------------------
CREATE TABLE service_sla (
    service_id NUMBER (12, 0) NOT NULL,
    sla_id NUMBER (12, 0) NOT NULL,
    CONSTRAINT service_sla_service_sla UNIQUE (service_id, sla_id)
);
CREATE INDEX FK_service_sla_service_id ON service_sla (service_id);
CREATE INDEX FK_service_sla_sla_id ON service_sla (sla_id);
-- ----------------------------------------------------------
--  create table sessions
-- ----------------------------------------------------------
CREATE TABLE sessions (
    id NUMBER (20, 0) NOT NULL,
    session_id VARCHAR2 (100) NOT NULL,
    data_key VARCHAR2 (100) NOT NULL,
    data_value CLOB NULL,
    serialized NUMBER (5, 0) NOT NULL
);
ALTER TABLE sessions ADD CONSTRAINT PK_sessions PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_sessions';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_sessions
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_sessions_t
BEFORE INSERT ON sessions
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_sessions.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX sessions_data_key ON sessions (data_key);
CREATE INDEX sessions_session_id_data_key ON sessions (session_id, data_key);
-- ----------------------------------------------------------
--  create table customer_user
-- ----------------------------------------------------------
CREATE TABLE customer_user (
    id NUMBER (12, 0) NOT NULL,
    login VARCHAR2 (200) NOT NULL,
    email VARCHAR2 (150) NOT NULL,
    customer_id VARCHAR2 (150) NOT NULL,
    pw VARCHAR2 (64) NULL,
    title VARCHAR2 (50) NULL,
    first_name VARCHAR2 (100) NOT NULL,
    last_name VARCHAR2 (100) NOT NULL,
    phone VARCHAR2 (150) NULL,
    fax VARCHAR2 (150) NULL,
    mobile VARCHAR2 (150) NULL,
    street VARCHAR2 (150) NULL,
    zip VARCHAR2 (200) NULL,
    city VARCHAR2 (200) NULL,
    country VARCHAR2 (200) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT customer_user_login UNIQUE (login)
);
ALTER TABLE customer_user ADD CONSTRAINT PK_customer_user PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_customer_user';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_customer_user
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_customer_user_t
BEFORE INSERT ON customer_user
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_customer_user.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_customer_user_change_by ON customer_user (change_by);
CREATE INDEX FK_customer_user_create_by ON customer_user (create_by);
CREATE INDEX FK_customer_user_valid_id ON customer_user (valid_id);
-- ----------------------------------------------------------
--  create table customer_preferences
-- ----------------------------------------------------------
CREATE TABLE customer_preferences (
    user_id VARCHAR2 (250) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value VARCHAR2 (250) NULL
);
CREATE INDEX customer_preferences_user_id ON customer_preferences (user_id);
-- ----------------------------------------------------------
--  create table customer_company
-- ----------------------------------------------------------
CREATE TABLE customer_company (
    customer_id VARCHAR2 (150) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    street VARCHAR2 (200) NULL,
    zip VARCHAR2 (200) NULL,
    city VARCHAR2 (200) NULL,
    country VARCHAR2 (200) NULL,
    url VARCHAR2 (200) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT customer_company_name UNIQUE (name)
);
ALTER TABLE customer_company ADD CONSTRAINT PK_customer_company PRIMARY KEY (customer_id);
-- ----------------------------------------------------------
--  create table mail_account
-- ----------------------------------------------------------
CREATE TABLE mail_account (
    id NUMBER (12, 0) NOT NULL,
    login VARCHAR2 (200) NOT NULL,
    pw VARCHAR2 (200) NOT NULL,
    host VARCHAR2 (200) NOT NULL,
    account_type VARCHAR2 (20) NOT NULL,
    queue_id NUMBER (12, 0) NOT NULL,
    trusted NUMBER (5, 0) NOT NULL,
    imap_folder VARCHAR2 (250) NULL,
    comments VARCHAR2 (250) NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE mail_account ADD CONSTRAINT PK_mail_account PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_mail_account';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_mail_account
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_mail_account_t
BEFORE INSERT ON mail_account
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_mail_account.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_mail_account_change_by ON mail_account (change_by);
CREATE INDEX FK_mail_account_create_by ON mail_account (create_by);
CREATE INDEX FK_mail_account_valid_id ON mail_account (valid_id);
-- ----------------------------------------------------------
--  create table postmaster_filter
-- ----------------------------------------------------------
CREATE TABLE postmaster_filter (
    f_name VARCHAR2 (200) NOT NULL,
    f_stop NUMBER (5, 0) NULL,
    f_type VARCHAR2 (20) NOT NULL,
    f_key VARCHAR2 (200) NOT NULL,
    f_value VARCHAR2 (200) NOT NULL,
    f_not NUMBER (5, 0) NULL
);
CREATE INDEX postmaster_filter_f_name ON postmaster_filter (f_name);
-- ----------------------------------------------------------
--  create table generic_agent_jobs
-- ----------------------------------------------------------
CREATE TABLE generic_agent_jobs (
    job_name VARCHAR2 (200) NOT NULL,
    job_key VARCHAR2 (200) NOT NULL,
    job_value VARCHAR2 (200) NULL
);
CREATE INDEX generic_agent_jobs_job_name ON generic_agent_jobs (job_name);
-- ----------------------------------------------------------
--  create table search_profile
-- ----------------------------------------------------------
CREATE TABLE search_profile (
    login VARCHAR2 (200) NOT NULL,
    profile_name VARCHAR2 (200) NOT NULL,
    profile_type VARCHAR2 (30) NOT NULL,
    profile_key VARCHAR2 (200) NOT NULL,
    profile_value VARCHAR2 (200) NULL
);
CREATE INDEX search_profile_login ON search_profile (login);
CREATE INDEX search_profile_profile_name ON search_profile (profile_name);
-- ----------------------------------------------------------
--  create table process_id
-- ----------------------------------------------------------
CREATE TABLE process_id (
    process_name VARCHAR2 (200) NOT NULL,
    process_id VARCHAR2 (200) NOT NULL,
    process_host VARCHAR2 (200) NOT NULL,
    process_create NUMBER (12, 0) NOT NULL,
    process_change NUMBER (12, 0) NOT NULL
);
-- ----------------------------------------------------------
--  create table web_upload_cache
-- ----------------------------------------------------------
CREATE TABLE web_upload_cache (
    form_id VARCHAR2 (250) NULL,
    filename VARCHAR2 (250) NULL,
    content_id VARCHAR2 (250) NULL,
    content_size VARCHAR2 (30) NULL,
    content_type VARCHAR2 (250) NULL,
    disposition VARCHAR2 (15) NULL,
    content CLOB NOT NULL,
    create_time_unix NUMBER (20, 0) NOT NULL
);
-- ----------------------------------------------------------
--  create table notification_event
-- ----------------------------------------------------------
CREATE TABLE notification_event (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    comments VARCHAR2 (250) NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT notification_event_name UNIQUE (name)
);
ALTER TABLE notification_event ADD CONSTRAINT PK_notification_event PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_notification_event';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_notification_event
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_notification_event_t
BEFORE INSERT ON notification_event
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_notification_event.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_notification_event_changeaf ON notification_event (change_by);
CREATE INDEX FK_notification_event_create9d ON notification_event (create_by);
CREATE INDEX FK_notification_event_valid_id ON notification_event (valid_id);
-- ----------------------------------------------------------
--  create table notification_event_message
-- ----------------------------------------------------------
CREATE TABLE notification_event_message (
    id NUMBER (12, 0) NOT NULL,
    notification_id NUMBER (12, 0) NOT NULL,
    subject VARCHAR2 (200) NOT NULL,
    text VARCHAR2 (4000) NOT NULL,
    content_type VARCHAR2 (250) NOT NULL,
    language VARCHAR2 (60) NOT NULL,
    CONSTRAINT notification_event_message_nb4 UNIQUE (notification_id, language)
);
ALTER TABLE notification_event_message ADD CONSTRAINT PK_notification_event_message PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_notification_event_messe4';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_notification_event_messe4
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_notification_event_messe4_t
BEFORE INSERT ON notification_event_message
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_notification_event_messe4.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX notification_event_message_lb8 ON notification_event_message (language);
CREATE INDEX notification_event_message_n1c ON notification_event_message (notification_id);
-- ----------------------------------------------------------
--  create table notification_event_item
-- ----------------------------------------------------------
CREATE TABLE notification_event_item (
    notification_id NUMBER (12, 0) NOT NULL,
    event_key VARCHAR2 (200) NOT NULL,
    event_value VARCHAR2 (200) NOT NULL
);
CREATE INDEX notification_event_item_even64 ON notification_event_item (event_key);
CREATE INDEX notification_event_item_evene4 ON notification_event_item (event_value);
CREATE INDEX notification_event_item_notidc ON notification_event_item (notification_id);
-- ----------------------------------------------------------
--  create table link_type
-- ----------------------------------------------------------
CREATE TABLE link_type (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (50) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT link_type_name UNIQUE (name)
);
ALTER TABLE link_type ADD CONSTRAINT PK_link_type PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_link_type';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_link_type
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_link_type_t
BEFORE INSERT ON link_type
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_link_type.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_link_type_change_by ON link_type (change_by);
CREATE INDEX FK_link_type_create_by ON link_type (create_by);
CREATE INDEX FK_link_type_valid_id ON link_type (valid_id);
-- ----------------------------------------------------------
--  create table link_state
-- ----------------------------------------------------------
CREATE TABLE link_state (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (50) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT link_state_name UNIQUE (name)
);
ALTER TABLE link_state ADD CONSTRAINT PK_link_state PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_link_state';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_link_state
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_link_state_t
BEFORE INSERT ON link_state
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_link_state.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_link_state_change_by ON link_state (change_by);
CREATE INDEX FK_link_state_create_by ON link_state (create_by);
CREATE INDEX FK_link_state_valid_id ON link_state (valid_id);
-- ----------------------------------------------------------
--  create table link_object
-- ----------------------------------------------------------
CREATE TABLE link_object (
    id NUMBER (5, 0) NOT NULL,
    name VARCHAR2 (100) NOT NULL,
    CONSTRAINT link_object_name UNIQUE (name)
);
ALTER TABLE link_object ADD CONSTRAINT PK_link_object PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_link_object';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_link_object
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_link_object_t
BEFORE INSERT ON link_object
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_link_object.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
-- ----------------------------------------------------------
--  create table link_relation
-- ----------------------------------------------------------
CREATE TABLE link_relation (
    source_object_id NUMBER (5, 0) NOT NULL,
    source_key VARCHAR2 (50) NOT NULL,
    target_object_id NUMBER (5, 0) NOT NULL,
    target_key VARCHAR2 (50) NOT NULL,
    type_id NUMBER (5, 0) NOT NULL,
    state_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT link_relation_view UNIQUE (source_object_id, source_key, target_object_id, target_key, type_id)
);
CREATE INDEX FK_link_relation_create_by ON link_relation (create_by);
CREATE INDEX FK_link_relation_source_obje3c ON link_relation (source_object_id);
CREATE INDEX FK_link_relation_state_id ON link_relation (state_id);
CREATE INDEX FK_link_relation_target_obje99 ON link_relation (target_object_id);
CREATE INDEX FK_link_relation_type_id ON link_relation (type_id);
CREATE INDEX link_relation_list_source ON link_relation (source_object_id, source_key, state_id);
CREATE INDEX link_relation_list_target ON link_relation (target_object_id, target_key, state_id);
-- ----------------------------------------------------------
--  create table system_data
-- ----------------------------------------------------------
CREATE TABLE system_data (
    data_key VARCHAR2 (160) NOT NULL,
    data_value CLOB NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE system_data ADD CONSTRAINT PK_system_data PRIMARY KEY (data_key);
CREATE INDEX FK_system_data_change_by ON system_data (change_by);
CREATE INDEX FK_system_data_create_by ON system_data (create_by);
-- ----------------------------------------------------------
--  create table xml_storage
-- ----------------------------------------------------------
CREATE TABLE xml_storage (
    xml_type VARCHAR2 (200) NOT NULL,
    xml_key VARCHAR2 (250) NOT NULL,
    xml_content_key VARCHAR2 (250) NOT NULL,
    xml_content_value CLOB NULL
);
CREATE INDEX xml_storage_key_type ON xml_storage (xml_key, xml_type);
CREATE INDEX xml_storage_xml_content_key ON xml_storage (xml_content_key);
-- ----------------------------------------------------------
--  create table virtual_fs
-- ----------------------------------------------------------
CREATE TABLE virtual_fs (
    id NUMBER (20, 0) NOT NULL,
    filename VARCHAR2 (350) NOT NULL,
    backend VARCHAR2 (60) NOT NULL,
    backend_key VARCHAR2 (160) NOT NULL,
    create_time DATE NOT NULL
);
ALTER TABLE virtual_fs ADD CONSTRAINT PK_virtual_fs PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_virtual_fs';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_virtual_fs
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_virtual_fs_t
BEFORE INSERT ON virtual_fs
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_virtual_fs.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX virtual_fs_backend ON virtual_fs (backend);
CREATE INDEX virtual_fs_filename ON virtual_fs (filename);
-- ----------------------------------------------------------
--  create table virtual_fs_preferences
-- ----------------------------------------------------------
CREATE TABLE virtual_fs_preferences (
    virtual_fs_id NUMBER (20, 0) NOT NULL,
    preferences_key VARCHAR2 (150) NOT NULL,
    preferences_value VARCHAR2 (350) NULL
);
CREATE INDEX virtual_fs_preferences_key_v7c ON virtual_fs_preferences (preferences_key, preferences_value);
CREATE INDEX virtual_fs_preferences_virtuf6 ON virtual_fs_preferences (virtual_fs_id);
-- ----------------------------------------------------------
--  create table virtual_fs_db
-- ----------------------------------------------------------
CREATE TABLE virtual_fs_db (
    id NUMBER (20, 0) NOT NULL,
    filename VARCHAR2 (350) NOT NULL,
    content CLOB NOT NULL,
    create_time DATE NOT NULL
);
ALTER TABLE virtual_fs_db ADD CONSTRAINT PK_virtual_fs_db PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_virtual_fs_db';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_virtual_fs_db
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_virtual_fs_db_t
BEFORE INSERT ON virtual_fs_db
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_virtual_fs_db.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX virtual_fs_db_filename ON virtual_fs_db (filename);
-- ----------------------------------------------------------
--  create table package_repository
-- ----------------------------------------------------------
CREATE TABLE package_repository (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    version VARCHAR2 (250) NOT NULL,
    vendor VARCHAR2 (250) NOT NULL,
    install_status VARCHAR2 (250) NOT NULL,
    filename VARCHAR2 (250) NULL,
    content_type VARCHAR2 (250) NULL,
    content CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE package_repository ADD CONSTRAINT PK_package_repository PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_package_repository';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_package_repository
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_package_repository_t
BEFORE INSERT ON package_repository
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_package_repository.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_package_repository_changed7 ON package_repository (change_by);
CREATE INDEX FK_package_repository_create99 ON package_repository (create_by);
-- ----------------------------------------------------------
--  create table gi_webservice_config
-- ----------------------------------------------------------
CREATE TABLE gi_webservice_config (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    config_md5 VARCHAR2 (32) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT gi_webservice_config_config_89 UNIQUE (config_md5),
    CONSTRAINT gi_webservice_config_name UNIQUE (name)
);
ALTER TABLE gi_webservice_config ADD CONSTRAINT PK_gi_webservice_config PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_gi_webservice_config';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_gi_webservice_config
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_gi_webservice_config_t
BEFORE INSERT ON gi_webservice_config
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_gi_webservice_config.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_gi_webservice_config_chan16 ON gi_webservice_config (change_by);
CREATE INDEX FK_gi_webservice_config_crea62 ON gi_webservice_config (create_by);
CREATE INDEX FK_gi_webservice_config_vali90 ON gi_webservice_config (valid_id);
-- ----------------------------------------------------------
--  create table gi_webservice_config_history
-- ----------------------------------------------------------
CREATE TABLE gi_webservice_config_history (
    id NUMBER (20, 0) NOT NULL,
    config_id NUMBER (12, 0) NOT NULL,
    config CLOB NOT NULL,
    config_md5 VARCHAR2 (32) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT gi_webservice_config_history8b UNIQUE (config_md5)
);
ALTER TABLE gi_webservice_config_history ADD CONSTRAINT PK_gi_webservice_config_hist06 PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_gi_webservice_config_hi2f';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_gi_webservice_config_hi2f
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_gi_webservice_config_hi2f_t
BEFORE INSERT ON gi_webservice_config_history
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_gi_webservice_config_hi2f.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_gi_webservice_config_histe6 ON gi_webservice_config_history (change_by);
CREATE INDEX FK_gi_webservice_config_histeb ON gi_webservice_config_history (config_id);
CREATE INDEX FK_gi_webservice_config_hist3d ON gi_webservice_config_history (create_by);
-- ----------------------------------------------------------
--  create table gi_debugger_entry
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry (
    id NUMBER (20, 0) NOT NULL,
    communication_id VARCHAR2 (32) NOT NULL,
    communication_type VARCHAR2 (50) NOT NULL,
    remote_ip VARCHAR2 (50) NULL,
    webservice_id NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    CONSTRAINT gi_debugger_entry_communicat94 UNIQUE (communication_id)
);
ALTER TABLE gi_debugger_entry ADD CONSTRAINT PK_gi_debugger_entry PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_gi_debugger_entry';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_gi_debugger_entry
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_gi_debugger_entry_t
BEFORE INSERT ON gi_debugger_entry
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_gi_debugger_entry.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_gi_debugger_entry_webserv43 ON gi_debugger_entry (webservice_id);
CREATE INDEX gi_debugger_entry_create_time ON gi_debugger_entry (create_time);
-- ----------------------------------------------------------
--  create table gi_debugger_entry_content
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry_content (
    id NUMBER (20, 0) NOT NULL,
    gi_debugger_entry_id NUMBER (20, 0) NOT NULL,
    debug_level VARCHAR2 (50) NOT NULL,
    subject VARCHAR2 (255) NOT NULL,
    content CLOB NULL,
    create_time DATE NOT NULL
);
ALTER TABLE gi_debugger_entry_content ADD CONSTRAINT PK_gi_debugger_entry_content PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_gi_debugger_entry_content';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_gi_debugger_entry_content
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_gi_debugger_entry_content_t
BEFORE INSERT ON gi_debugger_entry_content
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_gi_debugger_entry_content.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_gi_debugger_entry_contentc3 ON gi_debugger_entry_content (gi_debugger_entry_id);
CREATE INDEX gi_debugger_entry_content_cr4e ON gi_debugger_entry_content (create_time);
CREATE INDEX gi_debugger_entry_content_dea1 ON gi_debugger_entry_content (debug_level);
-- ----------------------------------------------------------
--  create table gi_object_lock_state
-- ----------------------------------------------------------
CREATE TABLE gi_object_lock_state (
    webservice_id NUMBER (12, 0) NOT NULL,
    object_type VARCHAR2 (30) NOT NULL,
    object_id NUMBER (20, 0) NOT NULL,
    lock_state VARCHAR2 (30) NOT NULL,
    lock_state_counter NUMBER (12, 0) NOT NULL,
    create_time DATE NOT NULL,
    change_time DATE NOT NULL,
    CONSTRAINT gi_object_lock_state_list UNIQUE (webservice_id, object_type, object_id)
);
CREATE INDEX FK_gi_object_lock_state_webs55 ON gi_object_lock_state (webservice_id);
CREATE INDEX object_lock_state_list_state ON gi_object_lock_state (webservice_id, object_type, object_id, lock_state);
-- ----------------------------------------------------------
--  create table smime_signer_cert_relations
-- ----------------------------------------------------------
CREATE TABLE smime_signer_cert_relations (
    id NUMBER (12, 0) NOT NULL,
    cert_hash VARCHAR2 (8) NOT NULL,
    cert_fingerprint VARCHAR2 (59) NOT NULL,
    ca_hash VARCHAR2 (8) NOT NULL,
    ca_fingerprint VARCHAR2 (59) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL
);
ALTER TABLE smime_signer_cert_relations ADD CONSTRAINT PK_smime_signer_cert_relations PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_smime_signer_cert_relatef';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_smime_signer_cert_relatef
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_smime_signer_cert_relatef_t
BEFORE INSERT ON smime_signer_cert_relations
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_smime_signer_cert_relatef.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_smime_signer_cert_relatiob7 ON smime_signer_cert_relations (change_by);
CREATE INDEX FK_smime_signer_cert_relatiobb ON smime_signer_cert_relations (create_by);
-- ----------------------------------------------------------
--  create table dynamic_field_value
-- ----------------------------------------------------------
CREATE TABLE dynamic_field_value (
    id NUMBER (12, 0) NOT NULL,
    field_id NUMBER (12, 0) NOT NULL,
    object_id NUMBER (20, 0) NOT NULL,
    value_text VARCHAR2 (3800) NULL,
    value_date DATE NULL,
    value_int NUMBER (20, 0) NULL
);
ALTER TABLE dynamic_field_value ADD CONSTRAINT PK_dynamic_field_value PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_dynamic_field_value';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_dynamic_field_value
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_dynamic_field_value_t
BEFORE INSERT ON dynamic_field_value
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_dynamic_field_value.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_dynamic_field_value_field90 ON dynamic_field_value (field_id);
CREATE INDEX dynamic_field_value_field_va6e ON dynamic_field_value (object_id, field_id);
CREATE INDEX dynamic_field_value_search_db3 ON dynamic_field_value (field_id, value_date);
CREATE INDEX dynamic_field_value_search_int ON dynamic_field_value (field_id, value_int);
-- ----------------------------------------------------------
--  create table dynamic_field
-- ----------------------------------------------------------
CREATE TABLE dynamic_field (
    id NUMBER (12, 0) NOT NULL,
    internal_field NUMBER (5, 0) DEFAULT 0 NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    label VARCHAR2 (200) NOT NULL,
    field_order NUMBER (12, 0) NOT NULL,
    field_type VARCHAR2 (200) NOT NULL,
    object_type VARCHAR2 (200) NOT NULL,
    config CLOB NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT dynamic_field_name UNIQUE (name)
);
ALTER TABLE dynamic_field ADD CONSTRAINT PK_dynamic_field PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_dynamic_field';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_dynamic_field
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_dynamic_field_t
BEFORE INSERT ON dynamic_field
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_dynamic_field.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_dynamic_field_change_by ON dynamic_field (change_by);
CREATE INDEX FK_dynamic_field_create_by ON dynamic_field (create_by);
CREATE INDEX FK_dynamic_field_valid_id ON dynamic_field (valid_id);
-- ----------------------------------------------------------
--  create table pm_process
-- ----------------------------------------------------------
CREATE TABLE pm_process (
    id NUMBER (12, 0) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    state_entity_id VARCHAR2 (50) NOT NULL,
    layout CLOB NOT NULL,
    config CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT pm_process_entity_id UNIQUE (entity_id)
);
ALTER TABLE pm_process ADD CONSTRAINT PK_pm_process PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_pm_process';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_pm_process
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_pm_process_t
BEFORE INSERT ON pm_process
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_pm_process.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_pm_process_change_by ON pm_process (change_by);
CREATE INDEX FK_pm_process_create_by ON pm_process (create_by);
-- ----------------------------------------------------------
--  create table pm_activity
-- ----------------------------------------------------------
CREATE TABLE pm_activity (
    id NUMBER (12, 0) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT pm_activity_entity_id UNIQUE (entity_id)
);
ALTER TABLE pm_activity ADD CONSTRAINT PK_pm_activity PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_pm_activity';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_pm_activity
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_pm_activity_t
BEFORE INSERT ON pm_activity
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_pm_activity.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_pm_activity_change_by ON pm_activity (change_by);
CREATE INDEX FK_pm_activity_create_by ON pm_activity (create_by);
-- ----------------------------------------------------------
--  create table pm_activity_dialog
-- ----------------------------------------------------------
CREATE TABLE pm_activity_dialog (
    id NUMBER (12, 0) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT pm_activity_dialog_entity_id UNIQUE (entity_id)
);
ALTER TABLE pm_activity_dialog ADD CONSTRAINT PK_pm_activity_dialog PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_pm_activity_dialog';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_pm_activity_dialog
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_pm_activity_dialog_t
BEFORE INSERT ON pm_activity_dialog
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_pm_activity_dialog.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_pm_activity_dialog_change65 ON pm_activity_dialog (change_by);
CREATE INDEX FK_pm_activity_dialog_create86 ON pm_activity_dialog (create_by);
-- ----------------------------------------------------------
--  create table pm_transition
-- ----------------------------------------------------------
CREATE TABLE pm_transition (
    id NUMBER (12, 0) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT pm_transition_entity_id UNIQUE (entity_id)
);
ALTER TABLE pm_transition ADD CONSTRAINT PK_pm_transition PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_pm_transition';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_pm_transition
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_pm_transition_t
BEFORE INSERT ON pm_transition
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_pm_transition.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_pm_transition_change_by ON pm_transition (change_by);
CREATE INDEX FK_pm_transition_create_by ON pm_transition (create_by);
-- ----------------------------------------------------------
--  create table pm_transition_action
-- ----------------------------------------------------------
CREATE TABLE pm_transition_action (
    id NUMBER (12, 0) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT pm_transition_action_entity_id UNIQUE (entity_id)
);
ALTER TABLE pm_transition_action ADD CONSTRAINT PK_pm_transition_action PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_pm_transition_action';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_pm_transition_action
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_pm_transition_action_t
BEFORE INSERT ON pm_transition_action
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_pm_transition_action.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_pm_transition_action_chan4f ON pm_transition_action (change_by);
CREATE INDEX FK_pm_transition_action_crea78 ON pm_transition_action (create_by);
-- ----------------------------------------------------------
--  create table pm_entity_sync
-- ----------------------------------------------------------
CREATE TABLE pm_entity_sync (
    entity_type VARCHAR2 (30) NOT NULL,
    entity_id VARCHAR2 (50) NOT NULL,
    sync_state VARCHAR2 (30) NOT NULL,
    create_time DATE NOT NULL,
    change_time DATE NOT NULL,
    CONSTRAINT pm_entity_sync_list UNIQUE (entity_type, entity_id)
);
-- ----------------------------------------------------------
--  create table scheduler_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_task (
    id NUMBER (20, 0) NOT NULL,
    ident NUMBER (20, 0) NOT NULL,
    name VARCHAR2 (150) NULL,
    task_type VARCHAR2 (150) NOT NULL,
    task_data CLOB NOT NULL,
    attempts NUMBER (5, 0) NOT NULL,
    lock_key NUMBER (20, 0) NOT NULL,
    lock_time DATE NULL,
    lock_update_time DATE NULL,
    create_time DATE NOT NULL,
    CONSTRAINT scheduler_task_ident UNIQUE (ident)
);
ALTER TABLE scheduler_task ADD CONSTRAINT PK_scheduler_task PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_scheduler_task';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_scheduler_task
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_scheduler_task_t
BEFORE INSERT ON scheduler_task
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_scheduler_task.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX scheduler_task_ident_id ON scheduler_task (ident, id);
CREATE INDEX scheduler_task_lock_key_id ON scheduler_task (lock_key, id);
-- ----------------------------------------------------------
--  create table scheduler_future_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_future_task (
    id NUMBER (20, 0) NOT NULL,
    ident NUMBER (20, 0) NOT NULL,
    execution_time DATE NOT NULL,
    name VARCHAR2 (150) NULL,
    task_type VARCHAR2 (150) NOT NULL,
    task_data CLOB NOT NULL,
    attempts NUMBER (5, 0) NOT NULL,
    lock_key NUMBER (20, 0) NOT NULL,
    lock_time DATE NULL,
    create_time DATE NOT NULL,
    CONSTRAINT scheduler_future_task_ident UNIQUE (ident)
);
ALTER TABLE scheduler_future_task ADD CONSTRAINT PK_scheduler_future_task PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_scheduler_future_task';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_scheduler_future_task
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_scheduler_future_task_t
BEFORE INSERT ON scheduler_future_task
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_scheduler_future_task.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX scheduler_future_task_ident_id ON scheduler_future_task (ident, id);
CREATE INDEX scheduler_future_task_lock_kbd ON scheduler_future_task (lock_key, id);
-- ----------------------------------------------------------
--  create table scheduler_recurrent_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_recurrent_task (
    id NUMBER (20, 0) NOT NULL,
    name VARCHAR2 (150) NOT NULL,
    task_type VARCHAR2 (150) NOT NULL,
    last_execution_time DATE NOT NULL,
    last_worker_task_id NUMBER (20, 0) NULL,
    last_worker_status NUMBER (5, 0) NULL,
    last_worker_running_time NUMBER (12, 0) NULL,
    lock_key NUMBER (20, 0) NOT NULL,
    lock_time DATE NULL,
    create_time DATE NOT NULL,
    change_time DATE NOT NULL,
    CONSTRAINT scheduler_recurrent_task_nam4e UNIQUE (name, task_type)
);
ALTER TABLE scheduler_recurrent_task ADD CONSTRAINT PK_scheduler_recurrent_task PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_scheduler_recurrent_task';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_scheduler_recurrent_task
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_scheduler_recurrent_task_t
BEFORE INSERT ON scheduler_recurrent_task
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_scheduler_recurrent_task.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX scheduler_recurrent_task_locb6 ON scheduler_recurrent_task (lock_key, id);
CREATE INDEX scheduler_recurrent_task_tas3a ON scheduler_recurrent_task (task_type, name);
-- ----------------------------------------------------------
--  create table cloud_service_config
-- ----------------------------------------------------------
CREATE TABLE cloud_service_config (
    id NUMBER (12, 0) NOT NULL,
    name VARCHAR2 (200) NOT NULL,
    config CLOB NOT NULL,
    config_md5 VARCHAR2 (32) NOT NULL,
    valid_id NUMBER (5, 0) NOT NULL,
    create_time DATE NOT NULL,
    create_by NUMBER (12, 0) NOT NULL,
    change_time DATE NOT NULL,
    change_by NUMBER (12, 0) NOT NULL,
    CONSTRAINT cloud_service_config_config_39 UNIQUE (config_md5),
    CONSTRAINT cloud_service_config_name UNIQUE (name)
);
ALTER TABLE cloud_service_config ADD CONSTRAINT PK_cloud_service_config PRIMARY KEY (id);
BEGIN
  EXECUTE IMMEDIATE 'DROP SEQUENCE SE_cloud_service_config';
EXCEPTION
  WHEN OTHERS THEN NULL;
END;
/
--;
CREATE SEQUENCE SE_cloud_service_config
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCYCLE
CACHE 20
ORDER;
CREATE OR REPLACE TRIGGER SE_cloud_service_config_t
BEFORE INSERT ON cloud_service_config
FOR EACH ROW
BEGIN
  IF :new.id IS NULL THEN
    SELECT SE_cloud_service_config.nextval
    INTO :new.id
    FROM DUAL;
  END IF;
END;
/
--;
CREATE INDEX FK_cloud_service_config_chane1 ON cloud_service_config (change_by);
CREATE INDEX FK_cloud_service_config_crea30 ON cloud_service_config (create_by);
CREATE INDEX FK_cloud_service_config_valib2 ON cloud_service_config (valid_id);
