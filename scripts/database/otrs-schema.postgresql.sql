-- ----------------------------------------------------------
--  driver: postgresql
-- ----------------------------------------------------------
SET standard_conforming_strings TO ON;
-- ----------------------------------------------------------
--  create table acl
-- ----------------------------------------------------------
CREATE TABLE acl (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    description VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    stop_after_match SMALLINT NULL,
    config_match TEXT NULL,
    config_change TEXT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT acl_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table acl_sync
-- ----------------------------------------------------------
CREATE TABLE acl_sync (
    acl_id VARCHAR (200) NOT NULL,
    sync_state VARCHAR (30) NOT NULL,
    create_time timestamp(0) NOT NULL,
    change_time timestamp(0) NOT NULL
);
-- ----------------------------------------------------------
--  create table valid
-- ----------------------------------------------------------
CREATE TABLE valid (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT valid_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table users
-- ----------------------------------------------------------
CREATE TABLE users (
    id serial NOT NULL,
    login VARCHAR (200) NOT NULL,
    pw VARCHAR (64) NOT NULL,
    title VARCHAR (50) NULL,
    first_name VARCHAR (100) NOT NULL,
    last_name VARCHAR (100) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT users_login UNIQUE (login)
);
-- ----------------------------------------------------------
--  create table user_preferences
-- ----------------------------------------------------------
CREATE TABLE user_preferences (
    user_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value TEXT NULL
);
CREATE INDEX user_preferences_user_id ON user_preferences (user_id);
-- ----------------------------------------------------------
--  create table groups
-- ----------------------------------------------------------
CREATE TABLE groups (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT groups_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table group_user
-- ----------------------------------------------------------
CREATE TABLE group_user (
    user_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    permission_key VARCHAR (20) NOT NULL,
    permission_value SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
CREATE INDEX group_user_group_id ON group_user (group_id);
CREATE INDEX group_user_user_id ON group_user (user_id);
-- ----------------------------------------------------------
--  create table group_role
-- ----------------------------------------------------------
CREATE TABLE group_role (
    role_id INTEGER NOT NULL,
    group_id INTEGER NOT NULL,
    permission_key VARCHAR (20) NOT NULL,
    permission_value SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
CREATE INDEX group_role_group_id ON group_role (group_id);
CREATE INDEX group_role_role_id ON group_role (role_id);
-- ----------------------------------------------------------
--  create table group_customer_user
-- ----------------------------------------------------------
CREATE TABLE group_customer_user (
    user_id VARCHAR (100) NOT NULL,
    group_id INTEGER NOT NULL,
    permission_key VARCHAR (20) NOT NULL,
    permission_value SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
CREATE INDEX group_customer_user_group_id ON group_customer_user (group_id);
CREATE INDEX group_customer_user_user_id ON group_customer_user (user_id);
-- ----------------------------------------------------------
--  create table roles
-- ----------------------------------------------------------
CREATE TABLE roles (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT roles_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table role_user
-- ----------------------------------------------------------
CREATE TABLE role_user (
    user_id INTEGER NOT NULL,
    role_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
CREATE INDEX role_user_role_id ON role_user (role_id);
CREATE INDEX role_user_user_id ON role_user (user_id);
-- ----------------------------------------------------------
--  create table personal_queues
-- ----------------------------------------------------------
CREATE TABLE personal_queues (
    user_id INTEGER NOT NULL,
    queue_id INTEGER NOT NULL
);
CREATE INDEX personal_queues_queue_id ON personal_queues (queue_id);
CREATE INDEX personal_queues_user_id ON personal_queues (user_id);
-- ----------------------------------------------------------
--  create table personal_services
-- ----------------------------------------------------------
CREATE TABLE personal_services (
    user_id INTEGER NOT NULL,
    service_id INTEGER NOT NULL
);
CREATE INDEX personal_services_service_id ON personal_services (service_id);
CREATE INDEX personal_services_user_id ON personal_services (user_id);
-- ----------------------------------------------------------
--  create table salutation
-- ----------------------------------------------------------
CREATE TABLE salutation (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    text VARCHAR (3000) NOT NULL,
    content_type VARCHAR (250) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT salutation_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table signature
-- ----------------------------------------------------------
CREATE TABLE signature (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    text VARCHAR (3000) NOT NULL,
    content_type VARCHAR (250) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT signature_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table system_address
-- ----------------------------------------------------------
CREATE TABLE system_address (
    id serial NOT NULL,
    value0 VARCHAR (200) NOT NULL,
    value1 VARCHAR (200) NOT NULL,
    value2 VARCHAR (200) NULL,
    value3 VARCHAR (200) NULL,
    queue_id INTEGER NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table system_maintenance
-- ----------------------------------------------------------
CREATE TABLE system_maintenance (
    id serial NOT NULL,
    start_date INTEGER NOT NULL,
    stop_date INTEGER NOT NULL,
    comments VARCHAR (250) NOT NULL,
    login_message VARCHAR (250) NULL,
    show_login_message SMALLINT NULL,
    notify_message VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table follow_up_possible
-- ----------------------------------------------------------
CREATE TABLE follow_up_possible (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT follow_up_possible_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table queue
-- ----------------------------------------------------------
CREATE TABLE queue (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    group_id INTEGER NOT NULL,
    unlock_timeout INTEGER NULL,
    first_response_time INTEGER NULL,
    first_response_notify SMALLINT NULL,
    update_time INTEGER NULL,
    update_notify SMALLINT NULL,
    solution_time INTEGER NULL,
    solution_notify SMALLINT NULL,
    system_address_id SMALLINT NOT NULL,
    calendar_name VARCHAR (100) NULL,
    default_sign_key VARCHAR (100) NULL,
    salutation_id SMALLINT NOT NULL,
    signature_id SMALLINT NOT NULL,
    follow_up_id SMALLINT NOT NULL,
    follow_up_lock SMALLINT NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT queue_name UNIQUE (name)
);
CREATE INDEX queue_group_id ON queue (group_id);
-- ----------------------------------------------------------
--  create table queue_preferences
-- ----------------------------------------------------------
CREATE TABLE queue_preferences (
    queue_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250) NULL
);
CREATE INDEX queue_preferences_queue_id ON queue_preferences (queue_id);
-- ----------------------------------------------------------
--  create table ticket_priority
-- ----------------------------------------------------------
CREATE TABLE ticket_priority (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_priority_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket_type
-- ----------------------------------------------------------
CREATE TABLE ticket_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket_lock_type
-- ----------------------------------------------------------
CREATE TABLE ticket_lock_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_lock_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket_state
-- ----------------------------------------------------------
CREATE TABLE ticket_state (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    type_id SMALLINT NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_state_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket_state_type
-- ----------------------------------------------------------
CREATE TABLE ticket_state_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_state_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket
-- ----------------------------------------------------------
CREATE TABLE ticket (
    id bigserial NOT NULL,
    tn VARCHAR (50) NOT NULL,
    title VARCHAR (255) NULL,
    queue_id INTEGER NOT NULL,
    ticket_lock_id SMALLINT NOT NULL,
    type_id SMALLINT NULL,
    service_id INTEGER NULL,
    sla_id INTEGER NULL,
    user_id INTEGER NOT NULL,
    responsible_user_id INTEGER NOT NULL,
    ticket_priority_id SMALLINT NOT NULL,
    ticket_state_id SMALLINT NOT NULL,
    customer_id VARCHAR (150) NULL,
    customer_user_id VARCHAR (250) NULL,
    timeout INTEGER NOT NULL,
    until_time INTEGER NOT NULL,
    escalation_time INTEGER NOT NULL,
    escalation_update_time INTEGER NOT NULL,
    escalation_response_time INTEGER NOT NULL,
    escalation_solution_time INTEGER NOT NULL,
    archive_flag SMALLINT DEFAULT 0 NOT NULL,
    create_time_unix BIGINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_tn UNIQUE (tn)
);
CREATE INDEX ticket_archive_flag ON ticket (archive_flag);
CREATE INDEX ticket_create_time ON ticket (create_time);
CREATE INDEX ticket_create_time_unix ON ticket (create_time_unix);
CREATE INDEX ticket_customer_id ON ticket (customer_id);
CREATE INDEX ticket_customer_user_id ON ticket (customer_user_id);
CREATE INDEX ticket_escalation_response_time ON ticket (escalation_response_time);
CREATE INDEX ticket_escalation_solution_time ON ticket (escalation_solution_time);
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
    ticket_id BIGINT NOT NULL,
    ticket_key VARCHAR (50) NOT NULL,
    ticket_value VARCHAR (50) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    CONSTRAINT ticket_flag_per_user UNIQUE (ticket_id, ticket_key, create_by)
);
CREATE INDEX ticket_flag_ticket_id ON ticket_flag (ticket_id);
CREATE INDEX ticket_flag_ticket_id_create_by ON ticket_flag (ticket_id, create_by);
CREATE INDEX ticket_flag_ticket_id_ticket_key ON ticket_flag (ticket_id, ticket_key);
-- ----------------------------------------------------------
--  create table ticket_history
-- ----------------------------------------------------------
CREATE TABLE ticket_history (
    id bigserial NOT NULL,
    name VARCHAR (200) NOT NULL,
    history_type_id SMALLINT NOT NULL,
    ticket_id BIGINT NOT NULL,
    article_id BIGINT NULL,
    type_id SMALLINT NOT NULL,
    queue_id INTEGER NOT NULL,
    owner_id INTEGER NOT NULL,
    priority_id SMALLINT NOT NULL,
    state_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
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
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT ticket_history_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table ticket_watcher
-- ----------------------------------------------------------
CREATE TABLE ticket_watcher (
    ticket_id BIGINT NOT NULL,
    user_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
CREATE INDEX ticket_watcher_ticket_id ON ticket_watcher (ticket_id);
CREATE INDEX ticket_watcher_user_id ON ticket_watcher (user_id);
-- ----------------------------------------------------------
--  create table ticket_index
-- ----------------------------------------------------------
CREATE TABLE ticket_index (
    ticket_id BIGINT NOT NULL,
    queue_id INTEGER NOT NULL,
    queue VARCHAR (200) NOT NULL,
    group_id INTEGER NOT NULL,
    s_lock VARCHAR (200) NOT NULL,
    s_state VARCHAR (200) NOT NULL,
    create_time_unix BIGINT NOT NULL
);
CREATE INDEX ticket_index_group_id ON ticket_index (group_id);
CREATE INDEX ticket_index_queue_id ON ticket_index (queue_id);
CREATE INDEX ticket_index_ticket_id ON ticket_index (ticket_id);
-- ----------------------------------------------------------
--  create table ticket_lock_index
-- ----------------------------------------------------------
CREATE TABLE ticket_lock_index (
    ticket_id BIGINT NOT NULL
);
CREATE INDEX ticket_lock_index_ticket_id ON ticket_lock_index (ticket_id);
-- ----------------------------------------------------------
--  create table ticket_loop_protection
-- ----------------------------------------------------------
CREATE TABLE ticket_loop_protection (
    sent_to VARCHAR (250) NOT NULL,
    sent_date VARCHAR (150) NOT NULL
);
CREATE INDEX ticket_loop_protection_sent_date ON ticket_loop_protection (sent_date);
CREATE INDEX ticket_loop_protection_sent_to ON ticket_loop_protection (sent_to);
-- ----------------------------------------------------------
--  create table article_type
-- ----------------------------------------------------------
CREATE TABLE article_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT article_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table article_sender_type
-- ----------------------------------------------------------
CREATE TABLE article_sender_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT article_sender_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table article_flag
-- ----------------------------------------------------------
CREATE TABLE article_flag (
    article_id BIGINT NOT NULL,
    article_key VARCHAR (50) NOT NULL,
    article_value VARCHAR (50) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL
);
CREATE INDEX article_flag_article_id ON article_flag (article_id);
CREATE INDEX article_flag_article_id_create_by ON article_flag (article_id, create_by);
-- ----------------------------------------------------------
--  create table article
-- ----------------------------------------------------------
CREATE TABLE article (
    id bigserial NOT NULL,
    ticket_id BIGINT NOT NULL,
    article_type_id SMALLINT NOT NULL,
    article_sender_type_id SMALLINT NOT NULL,
    a_from VARCHAR (3800) NULL,
    a_reply_to VARCHAR (500) NULL,
    a_to VARCHAR (3800) NULL,
    a_cc VARCHAR (3800) NULL,
    a_subject VARCHAR (3800) NULL,
    a_message_id VARCHAR (3800) NULL,
    a_message_id_md5 VARCHAR (32) NULL,
    a_in_reply_to VARCHAR (3800) NULL,
    a_references VARCHAR (3800) NULL,
    a_content_type VARCHAR (250) NULL,
    a_body VARCHAR NOT NULL,
    incoming_time INTEGER NOT NULL,
    content_path VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX article_article_sender_type_id ON article (article_sender_type_id);
CREATE INDEX article_article_type_id ON article (article_type_id);
CREATE INDEX article_message_id_md5 ON article (a_message_id_md5);
CREATE INDEX article_ticket_id ON article (ticket_id);
-- ----------------------------------------------------------
--  create table article_search
-- ----------------------------------------------------------
CREATE TABLE article_search (
    id BIGINT NOT NULL,
    ticket_id BIGINT NOT NULL,
    article_type_id SMALLINT NOT NULL,
    article_sender_type_id SMALLINT NOT NULL,
    a_from VARCHAR (3800) NULL,
    a_to VARCHAR (3800) NULL,
    a_cc VARCHAR (3800) NULL,
    a_subject VARCHAR (3800) NULL,
    a_body VARCHAR NOT NULL,
    incoming_time INTEGER NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX article_search_article_sender_type_id ON article_search (article_sender_type_id);
CREATE INDEX article_search_article_type_id ON article_search (article_type_id);
CREATE INDEX article_search_ticket_id ON article_search (ticket_id);
-- ----------------------------------------------------------
--  create table article_plain
-- ----------------------------------------------------------
CREATE TABLE article_plain (
    id bigserial NOT NULL,
    article_id BIGINT NOT NULL,
    body TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX article_plain_article_id ON article_plain (article_id);
-- ----------------------------------------------------------
--  create table article_attachment
-- ----------------------------------------------------------
CREATE TABLE article_attachment (
    id bigserial NOT NULL,
    article_id BIGINT NOT NULL,
    filename VARCHAR (250) NULL,
    content_size VARCHAR (30) NULL,
    content_type VARCHAR (450) NULL,
    content_id VARCHAR (250) NULL,
    content_alternative VARCHAR (50) NULL,
    disposition VARCHAR (15) NULL,
    content TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX article_attachment_article_id ON article_attachment (article_id);
-- ----------------------------------------------------------
--  create table time_accounting
-- ----------------------------------------------------------
CREATE TABLE time_accounting (
    id bigserial NOT NULL,
    ticket_id BIGINT NOT NULL,
    article_id BIGINT NULL,
    time_unit DECIMAL (10,2) NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX time_accounting_ticket_id ON time_accounting (ticket_id);
-- ----------------------------------------------------------
--  create table standard_template
-- ----------------------------------------------------------
CREATE TABLE standard_template (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    text VARCHAR NULL,
    content_type VARCHAR (250) NULL,
    template_type VARCHAR (100) DEFAULT 'Answer' NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT standard_template_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table queue_standard_template
-- ----------------------------------------------------------
CREATE TABLE queue_standard_template (
    queue_id INTEGER NOT NULL,
    standard_template_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL
);
-- ----------------------------------------------------------
--  create table standard_attachment
-- ----------------------------------------------------------
CREATE TABLE standard_attachment (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    content_type VARCHAR (250) NOT NULL,
    content TEXT NOT NULL,
    filename VARCHAR (250) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT standard_attachment_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table standard_template_attachment
-- ----------------------------------------------------------
CREATE TABLE standard_template_attachment (
    id serial NOT NULL,
    standard_attachment_id INTEGER NOT NULL,
    standard_template_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table auto_response_type
-- ----------------------------------------------------------
CREATE TABLE auto_response_type (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT auto_response_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table auto_response
-- ----------------------------------------------------------
CREATE TABLE auto_response (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    text0 VARCHAR (6000) NULL,
    text1 VARCHAR (6000) NULL,
    type_id SMALLINT NOT NULL,
    system_address_id SMALLINT NOT NULL,
    content_type VARCHAR (250) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT auto_response_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table queue_auto_response
-- ----------------------------------------------------------
CREATE TABLE queue_auto_response (
    id serial NOT NULL,
    queue_id INTEGER NOT NULL,
    auto_response_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table service
-- ----------------------------------------------------------
CREATE TABLE service (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    valid_id SMALLINT NOT NULL,
    comments VARCHAR (250) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT service_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table service_preferences
-- ----------------------------------------------------------
CREATE TABLE service_preferences (
    service_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250) NULL
);
CREATE INDEX service_preferences_service_id ON service_preferences (service_id);
-- ----------------------------------------------------------
--  create table service_customer_user
-- ----------------------------------------------------------
CREATE TABLE service_customer_user (
    customer_user_login VARCHAR (200) NOT NULL,
    service_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL
);
CREATE INDEX service_customer_user_customer_user_login ON service_customer_user (customer_user_login);
CREATE INDEX service_customer_user_service_id ON service_customer_user (service_id);
-- ----------------------------------------------------------
--  create table sla
-- ----------------------------------------------------------
CREATE TABLE sla (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    calendar_name VARCHAR (100) NULL,
    first_response_time INTEGER NOT NULL,
    first_response_notify SMALLINT NULL,
    update_time INTEGER NOT NULL,
    update_notify SMALLINT NULL,
    solution_time INTEGER NOT NULL,
    solution_notify SMALLINT NULL,
    valid_id SMALLINT NOT NULL,
    comments VARCHAR (250) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT sla_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table sla_preferences
-- ----------------------------------------------------------
CREATE TABLE sla_preferences (
    sla_id INTEGER NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250) NULL
);
CREATE INDEX sla_preferences_sla_id ON sla_preferences (sla_id);
-- ----------------------------------------------------------
--  create table service_sla
-- ----------------------------------------------------------
CREATE TABLE service_sla (
    service_id INTEGER NOT NULL,
    sla_id INTEGER NOT NULL,
    CONSTRAINT service_sla_service_sla UNIQUE (service_id, sla_id)
);
-- ----------------------------------------------------------
--  create table sessions
-- ----------------------------------------------------------
CREATE TABLE sessions (
    id bigserial NOT NULL,
    session_id VARCHAR (100) NOT NULL,
    data_key VARCHAR (100) NOT NULL,
    data_value VARCHAR NULL,
    serialized SMALLINT NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX sessions_data_key ON sessions (data_key);
CREATE INDEX sessions_session_id_data_key ON sessions (session_id, data_key);
-- ----------------------------------------------------------
--  create table customer_user
-- ----------------------------------------------------------
CREATE TABLE customer_user (
    id serial NOT NULL,
    login VARCHAR (200) NOT NULL,
    email VARCHAR (150) NOT NULL,
    customer_id VARCHAR (150) NOT NULL,
    pw VARCHAR (64) NULL,
    title VARCHAR (50) NULL,
    first_name VARCHAR (100) NOT NULL,
    last_name VARCHAR (100) NOT NULL,
    phone VARCHAR (150) NULL,
    fax VARCHAR (150) NULL,
    mobile VARCHAR (150) NULL,
    street VARCHAR (150) NULL,
    zip VARCHAR (200) NULL,
    city VARCHAR (200) NULL,
    country VARCHAR (200) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT customer_user_login UNIQUE (login)
);
-- ----------------------------------------------------------
--  create table customer_preferences
-- ----------------------------------------------------------
CREATE TABLE customer_preferences (
    user_id VARCHAR (250) NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (250) NULL
);
CREATE INDEX customer_preferences_user_id ON customer_preferences (user_id);
-- ----------------------------------------------------------
--  create table customer_company
-- ----------------------------------------------------------
CREATE TABLE customer_company (
    customer_id VARCHAR (150) NOT NULL,
    name VARCHAR (200) NOT NULL,
    street VARCHAR (200) NULL,
    zip VARCHAR (200) NULL,
    city VARCHAR (200) NULL,
    country VARCHAR (200) NULL,
    url VARCHAR (200) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(customer_id),
    CONSTRAINT customer_company_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table mail_account
-- ----------------------------------------------------------
CREATE TABLE mail_account (
    id serial NOT NULL,
    login VARCHAR (200) NOT NULL,
    pw VARCHAR (200) NOT NULL,
    host VARCHAR (200) NOT NULL,
    account_type VARCHAR (20) NOT NULL,
    queue_id INTEGER NOT NULL,
    trusted SMALLINT NOT NULL,
    imap_folder VARCHAR (250) NULL,
    comments VARCHAR (250) NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table postmaster_filter
-- ----------------------------------------------------------
CREATE TABLE postmaster_filter (
    f_name VARCHAR (200) NOT NULL,
    f_stop SMALLINT NULL,
    f_type VARCHAR (20) NOT NULL,
    f_key VARCHAR (200) NOT NULL,
    f_value VARCHAR (200) NOT NULL,
    f_not SMALLINT NULL
);
CREATE INDEX postmaster_filter_f_name ON postmaster_filter (f_name);
-- ----------------------------------------------------------
--  create table generic_agent_jobs
-- ----------------------------------------------------------
CREATE TABLE generic_agent_jobs (
    job_name VARCHAR (200) NOT NULL,
    job_key VARCHAR (200) NOT NULL,
    job_value VARCHAR (200) NULL
);
CREATE INDEX generic_agent_jobs_job_name ON generic_agent_jobs (job_name);
-- ----------------------------------------------------------
--  create table search_profile
-- ----------------------------------------------------------
CREATE TABLE search_profile (
    login VARCHAR (200) NOT NULL,
    profile_name VARCHAR (200) NOT NULL,
    profile_type VARCHAR (30) NOT NULL,
    profile_key VARCHAR (200) NOT NULL,
    profile_value VARCHAR (200) NULL
);
CREATE INDEX search_profile_login ON search_profile (login);
CREATE INDEX search_profile_profile_name ON search_profile (profile_name);
-- ----------------------------------------------------------
--  create table process_id
-- ----------------------------------------------------------
CREATE TABLE process_id (
    process_name VARCHAR (200) NOT NULL,
    process_id VARCHAR (200) NOT NULL,
    process_host VARCHAR (200) NOT NULL,
    process_create INTEGER NOT NULL,
    process_change INTEGER NOT NULL
);
-- ----------------------------------------------------------
--  create table web_upload_cache
-- ----------------------------------------------------------
CREATE TABLE web_upload_cache (
    form_id VARCHAR (250) NULL,
    filename VARCHAR (250) NULL,
    content_id VARCHAR (250) NULL,
    content_size VARCHAR (30) NULL,
    content_type VARCHAR (250) NULL,
    disposition VARCHAR (15) NULL,
    content TEXT NOT NULL,
    create_time_unix BIGINT NOT NULL
);
-- ----------------------------------------------------------
--  create table notification_event
-- ----------------------------------------------------------
CREATE TABLE notification_event (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    valid_id SMALLINT NOT NULL,
    comments VARCHAR (250) NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT notification_event_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table notification_event_message
-- ----------------------------------------------------------
CREATE TABLE notification_event_message (
    id serial NOT NULL,
    notification_id INTEGER NOT NULL,
    subject VARCHAR (200) NOT NULL,
    text VARCHAR (4000) NOT NULL,
    content_type VARCHAR (250) NOT NULL,
    language VARCHAR (60) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT notification_event_message_notification_id_language UNIQUE (notification_id, language)
);
CREATE INDEX notification_event_message_language ON notification_event_message (language);
CREATE INDEX notification_event_message_notification_id ON notification_event_message (notification_id);
-- ----------------------------------------------------------
--  create table notification_event_item
-- ----------------------------------------------------------
CREATE TABLE notification_event_item (
    notification_id INTEGER NOT NULL,
    event_key VARCHAR (200) NOT NULL,
    event_value VARCHAR (200) NOT NULL
);
CREATE INDEX notification_event_item_event_key ON notification_event_item (event_key);
CREATE INDEX notification_event_item_event_value ON notification_event_item (event_value);
CREATE INDEX notification_event_item_notification_id ON notification_event_item (notification_id);
-- ----------------------------------------------------------
--  create table link_type
-- ----------------------------------------------------------
CREATE TABLE link_type (
    id serial NOT NULL,
    name VARCHAR (50) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT link_type_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table link_state
-- ----------------------------------------------------------
CREATE TABLE link_state (
    id serial NOT NULL,
    name VARCHAR (50) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT link_state_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table link_object
-- ----------------------------------------------------------
CREATE TABLE link_object (
    id serial NOT NULL,
    name VARCHAR (100) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT link_object_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table link_relation
-- ----------------------------------------------------------
CREATE TABLE link_relation (
    source_object_id SMALLINT NOT NULL,
    source_key VARCHAR (50) NOT NULL,
    target_object_id SMALLINT NOT NULL,
    target_key VARCHAR (50) NOT NULL,
    type_id SMALLINT NOT NULL,
    state_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    CONSTRAINT link_relation_view UNIQUE (source_object_id, source_key, target_object_id, target_key, type_id)
);
CREATE INDEX link_relation_list_source ON link_relation (source_object_id, source_key, state_id);
CREATE INDEX link_relation_list_target ON link_relation (target_object_id, target_key, state_id);
-- ----------------------------------------------------------
--  create table system_data
-- ----------------------------------------------------------
CREATE TABLE system_data (
    data_key VARCHAR (160) NOT NULL,
    data_value TEXT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(data_key)
);
-- ----------------------------------------------------------
--  create table xml_storage
-- ----------------------------------------------------------
CREATE TABLE xml_storage (
    xml_type VARCHAR (200) NOT NULL,
    xml_key VARCHAR (250) NOT NULL,
    xml_content_key VARCHAR (250) NOT NULL,
    xml_content_value VARCHAR NULL
);
CREATE INDEX xml_storage_key_type ON xml_storage (xml_key, xml_type);
CREATE INDEX xml_storage_xml_content_key ON xml_storage (xml_content_key);
-- ----------------------------------------------------------
--  create table virtual_fs
-- ----------------------------------------------------------
CREATE TABLE virtual_fs (
    id bigserial NOT NULL,
    filename VARCHAR (350) NOT NULL,
    backend VARCHAR (60) NOT NULL,
    backend_key VARCHAR (160) NOT NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX virtual_fs_backend ON virtual_fs (backend);
CREATE INDEX virtual_fs_filename ON virtual_fs (filename);
-- ----------------------------------------------------------
--  create table virtual_fs_preferences
-- ----------------------------------------------------------
CREATE TABLE virtual_fs_preferences (
    virtual_fs_id BIGINT NOT NULL,
    preferences_key VARCHAR (150) NOT NULL,
    preferences_value VARCHAR (350) NULL
);
CREATE INDEX virtual_fs_preferences_key_value ON virtual_fs_preferences (preferences_key, preferences_value);
CREATE INDEX virtual_fs_preferences_virtual_fs_id ON virtual_fs_preferences (virtual_fs_id);
-- ----------------------------------------------------------
--  create table virtual_fs_db
-- ----------------------------------------------------------
CREATE TABLE virtual_fs_db (
    id bigserial NOT NULL,
    filename VARCHAR (350) NOT NULL,
    content TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX virtual_fs_db_filename ON virtual_fs_db (filename);
-- ----------------------------------------------------------
--  create table package_repository
-- ----------------------------------------------------------
CREATE TABLE package_repository (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    version VARCHAR (250) NOT NULL,
    vendor VARCHAR (250) NOT NULL,
    install_status VARCHAR (250) NOT NULL,
    filename VARCHAR (250) NULL,
    content_type VARCHAR (250) NULL,
    content TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table gi_webservice_config
-- ----------------------------------------------------------
CREATE TABLE gi_webservice_config (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    config_md5 VARCHAR (32) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT gi_webservice_config_config_md5 UNIQUE (config_md5),
    CONSTRAINT gi_webservice_config_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table gi_webservice_config_history
-- ----------------------------------------------------------
CREATE TABLE gi_webservice_config_history (
    id bigserial NOT NULL,
    config_id INTEGER NOT NULL,
    config TEXT NOT NULL,
    config_md5 VARCHAR (32) NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT gi_webservice_config_history_config_md5 UNIQUE (config_md5)
);
-- ----------------------------------------------------------
--  create table gi_debugger_entry
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry (
    id bigserial NOT NULL,
    communication_id VARCHAR (32) NOT NULL,
    communication_type VARCHAR (50) NOT NULL,
    remote_ip VARCHAR (50) NULL,
    webservice_id INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT gi_debugger_entry_communication_id UNIQUE (communication_id)
);
CREATE INDEX gi_debugger_entry_create_time ON gi_debugger_entry (create_time);
-- ----------------------------------------------------------
--  create table gi_debugger_entry_content
-- ----------------------------------------------------------
CREATE TABLE gi_debugger_entry_content (
    id bigserial NOT NULL,
    gi_debugger_entry_id BIGINT NOT NULL,
    debug_level VARCHAR (50) NOT NULL,
    subject VARCHAR (255) NOT NULL,
    content TEXT NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX gi_debugger_entry_content_create_time ON gi_debugger_entry_content (create_time);
CREATE INDEX gi_debugger_entry_content_debug_level ON gi_debugger_entry_content (debug_level);
-- ----------------------------------------------------------
--  create table gi_object_lock_state
-- ----------------------------------------------------------
CREATE TABLE gi_object_lock_state (
    webservice_id INTEGER NOT NULL,
    object_type VARCHAR (30) NOT NULL,
    object_id BIGINT NOT NULL,
    lock_state VARCHAR (30) NOT NULL,
    lock_state_counter INTEGER NOT NULL,
    create_time timestamp(0) NOT NULL,
    change_time timestamp(0) NOT NULL,
    CONSTRAINT gi_object_lock_state_list UNIQUE (webservice_id, object_type, object_id)
);
CREATE INDEX object_lock_state_list_state ON gi_object_lock_state (webservice_id, object_type, object_id, lock_state);
-- ----------------------------------------------------------
--  create table smime_signer_cert_relations
-- ----------------------------------------------------------
CREATE TABLE smime_signer_cert_relations (
    id serial NOT NULL,
    cert_hash VARCHAR (8) NOT NULL,
    cert_fingerprint VARCHAR (59) NOT NULL,
    ca_hash VARCHAR (8) NOT NULL,
    ca_fingerprint VARCHAR (59) NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id)
);
-- ----------------------------------------------------------
--  create table dynamic_field_value
-- ----------------------------------------------------------
CREATE TABLE dynamic_field_value (
    id serial NOT NULL,
    field_id INTEGER NOT NULL,
    object_id BIGINT NOT NULL,
    value_text VARCHAR (3800) NULL,
    value_date timestamp(0) NULL,
    value_int BIGINT NULL,
    PRIMARY KEY(id)
);
CREATE INDEX dynamic_field_value_field_values ON dynamic_field_value (object_id, field_id);
CREATE INDEX dynamic_field_value_search_date ON dynamic_field_value (field_id, value_date);
CREATE INDEX dynamic_field_value_search_int ON dynamic_field_value (field_id, value_int);
-- ----------------------------------------------------------
--  create table dynamic_field
-- ----------------------------------------------------------
CREATE TABLE dynamic_field (
    id serial NOT NULL,
    internal_field SMALLINT DEFAULT 0 NOT NULL,
    name VARCHAR (200) NOT NULL,
    label VARCHAR (200) NOT NULL,
    field_order INTEGER NOT NULL,
    field_type VARCHAR (200) NOT NULL,
    object_type VARCHAR (200) NOT NULL,
    config TEXT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT dynamic_field_name UNIQUE (name)
);
-- ----------------------------------------------------------
--  create table pm_process
-- ----------------------------------------------------------
CREATE TABLE pm_process (
    id serial NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    name VARCHAR (200) NOT NULL,
    state_entity_id VARCHAR (50) NOT NULL,
    layout TEXT NOT NULL,
    config TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT pm_process_entity_id UNIQUE (entity_id)
);
-- ----------------------------------------------------------
--  create table pm_activity
-- ----------------------------------------------------------
CREATE TABLE pm_activity (
    id serial NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT pm_activity_entity_id UNIQUE (entity_id)
);
-- ----------------------------------------------------------
--  create table pm_activity_dialog
-- ----------------------------------------------------------
CREATE TABLE pm_activity_dialog (
    id serial NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT pm_activity_dialog_entity_id UNIQUE (entity_id)
);
-- ----------------------------------------------------------
--  create table pm_transition
-- ----------------------------------------------------------
CREATE TABLE pm_transition (
    id serial NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT pm_transition_entity_id UNIQUE (entity_id)
);
-- ----------------------------------------------------------
--  create table pm_transition_action
-- ----------------------------------------------------------
CREATE TABLE pm_transition_action (
    id serial NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT pm_transition_action_entity_id UNIQUE (entity_id)
);
-- ----------------------------------------------------------
--  create table pm_entity_sync
-- ----------------------------------------------------------
CREATE TABLE pm_entity_sync (
    entity_type VARCHAR (30) NOT NULL,
    entity_id VARCHAR (50) NOT NULL,
    sync_state VARCHAR (30) NOT NULL,
    create_time timestamp(0) NOT NULL,
    change_time timestamp(0) NOT NULL,
    CONSTRAINT pm_entity_sync_list UNIQUE (entity_type, entity_id)
);
-- ----------------------------------------------------------
--  create table scheduler_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_task (
    id bigserial NOT NULL,
    ident BIGINT NOT NULL,
    name VARCHAR (150) NULL,
    task_type VARCHAR (150) NOT NULL,
    task_data TEXT NOT NULL,
    attempts SMALLINT NOT NULL,
    lock_key BIGINT NOT NULL,
    lock_time timestamp(0) NULL,
    lock_update_time timestamp(0) NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT scheduler_task_ident UNIQUE (ident)
);
CREATE INDEX scheduler_task_ident_id ON scheduler_task (ident, id);
CREATE INDEX scheduler_task_lock_key_id ON scheduler_task (lock_key, id);
-- ----------------------------------------------------------
--  create table scheduler_future_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_future_task (
    id bigserial NOT NULL,
    ident BIGINT NOT NULL,
    execution_time timestamp(0) NOT NULL,
    name VARCHAR (150) NULL,
    task_type VARCHAR (150) NOT NULL,
    task_data TEXT NOT NULL,
    attempts SMALLINT NOT NULL,
    lock_key BIGINT NOT NULL,
    lock_time timestamp(0) NULL,
    create_time timestamp(0) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT scheduler_future_task_ident UNIQUE (ident)
);
CREATE INDEX scheduler_future_task_ident_id ON scheduler_future_task (ident, id);
CREATE INDEX scheduler_future_task_lock_key_id ON scheduler_future_task (lock_key, id);
-- ----------------------------------------------------------
--  create table scheduler_recurrent_task
-- ----------------------------------------------------------
CREATE TABLE scheduler_recurrent_task (
    id bigserial NOT NULL,
    name VARCHAR (150) NOT NULL,
    task_type VARCHAR (150) NOT NULL,
    last_execution_time timestamp(0) NOT NULL,
    last_worker_task_id BIGINT NULL,
    last_worker_status SMALLINT NULL,
    last_worker_running_time INTEGER NULL,
    lock_key BIGINT NOT NULL,
    lock_time timestamp(0) NULL,
    create_time timestamp(0) NOT NULL,
    change_time timestamp(0) NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT scheduler_recurrent_task_name_task_type UNIQUE (name, task_type)
);
CREATE INDEX scheduler_recurrent_task_lock_key_id ON scheduler_recurrent_task (lock_key, id);
CREATE INDEX scheduler_recurrent_task_task_type_name ON scheduler_recurrent_task (task_type, name);
-- ----------------------------------------------------------
--  create table cloud_service_config
-- ----------------------------------------------------------
CREATE TABLE cloud_service_config (
    id serial NOT NULL,
    name VARCHAR (200) NOT NULL,
    config TEXT NOT NULL,
    config_md5 VARCHAR (32) NOT NULL,
    valid_id SMALLINT NOT NULL,
    create_time timestamp(0) NOT NULL,
    create_by INTEGER NOT NULL,
    change_time timestamp(0) NOT NULL,
    change_by INTEGER NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT cloud_service_config_config_md5 UNIQUE (config_md5),
    CONSTRAINT cloud_service_config_name UNIQUE (name)
);
