drop table if exists para_apply_check_publish;

drop table if exists para_circle_flow;

drop table if exists para_difference_check_publish;

drop table if exists para_env_org;

drop table if exists para_fields_column;

drop table if exists para_module_org;

drop table if exists para_namespace_org;

drop table if exists para_select_fields;

drop table if exists para_system_org;

drop table if exists para_table_fields;

drop table if exists para_transaction_table_org;

drop table if exists para_user_authority;

create table para_apply_check_publish
(
   req_no               varchar(50) not null comment '����+ʱ��',
   tran_timestamp       varchar(20) not null comment 'ʱ���',
   operator_type        varchar(1) not null comment '��������: A:����;C:����;P:����;R:���˲���;J:��������;E:����;S:����;F:����',
   check_text           varchar(500) not null comment '���˷������',
   approve              varchar(1) not null comment '�Ƿ�ͨ��:Y;N,����:C',
   operator_id          varchar(30) not null comment '������ID',
   currentsystem_time   varchar(50) not null comment '����ʱ��',
   client_ip            varchar(30) not null comment '������IP',
   primary key (req_no, tran_timestamp)
);

alter table para_apply_check_publish comment '������˷������̹����';

create table para_circle_flow
(
   req_no               varchar(60) not null comment '����+ʱ��',
   transaction_id       varchar(50) not null comment '����������(MenuID)/������ȫ��',
   transaction_desc     varchar(100) not null comment '������������',
   current_status       varchar(1) not null comment '��ǰ״̬:������1����¼��2���Ѹ���3���ѷ���4��������5���Ѳ���6, ��������0',
   multitbdata          longblob comment '���յ��������޸�/ɾ��/��Ӳ��������ݵı���',
   operate_desc         varchar(500) comment '��������',
   primary key (req_no)
);

alter table para_circle_flow comment '�������̿��Ʊ�';

create table para_difference_check_publish
(
   tran_timestamp       varchar(20) not null comment 'ʱ���',
   series_num           int not null comment '���к�',
   req_no               varchar(60) not null comment '����+ʱ��',
   table_full_name      varchar(50) not null comment '������ȫ��',
   primary_keyvalue     varchar(2000) comment '����ֵ���',
   key_value            longblob comment '�����ֶκ�ֵ',
   operate_type         varchar(1) not null comment '�������ͣ�D/U/I',
   data_dui             longblob comment '����ɾ��/���/�޸Ĳ��������ݵı���',
   olddata_upd          longblob comment '�����޸�֮ǰ�Ĳ��������ݱ���',
   primary key (tran_timestamp, series_num)
);

alter table para_difference_check_publish comment '�������ݲ���һ����';

create table para_env_org
(
   env_id               varchar(30) not null comment '����ID',
   system_id            varchar(10) not null comment 'ϵͳID',
   env_desc             varchar(100) not null comment '��������',
   url                  varchar(100) not null comment 'HTTP����URL',
   module               varchar(5) not null comment 'ģ��',
   service_code         varchar(30) not null comment '�������',
   message_type         varchar(4) not null comment '��������',
   message_code         varchar(6) not null comment '���Ĵ���',
   operator             varchar(50) default null comment '�����޸���ID',
   time                 varchar(50) default null comment '�����޸�ʱ��',
   ip                   varchar(50) default null comment '����޸���IP',
   primary key (env_id)
);

alter table para_env_org comment '�������ñ�';

create table para_fields_column
(
   column_name          varchar(32) not null comment '����',
   column_type          varchar(16) not null comment '�ֶ�����',
   column_desc          varchar(50) not null comment '�ֶ�����',
   data_length          int default null comment '���ݳ���',
   value_method         varchar(2) default null comment '��ʾ����',
   value_score          varchar(500) default null comment '�̶���ѡ',
   ref_table            varchar(50) default null comment '���Ա�',
   ref_col              varchar(50) default null comment '������',
   primary key (column_name)
);

alter table para_fields_column comment 'Ԫ�ֶ�������';

create table para_module_org
(
   module_id            varchar(10) not null comment 'ģ�����',
   system_id            varchar(10) not null comment 'Ŀ��ϵͳID',
   module_name          varchar(60) not null comment 'Ŀ��ģ������',
   module_desc          varchar(100) default null comment 'Ŀ��ģ������',
   primary key (module_id, system_id)
);

alter table para_module_org comment 'Ŀ��ģ���';

create table para_namespace_org
(
   transaction_id       varchar(50) not null comment '����/����ID',
   system_id            varchar(10) not null comment 'Ŀ��ϵͳID',
   is_tbname            varchar(1) not null comment '�Ƿ������Y;N',
   transaction_desc     varchar(100) not null comment '������������',
   module_id            varchar(10) not null comment 'ģ�����',
   jsp_url              varchar(100) not null comment '�Ƚϲ�������,�༭���ݵ�jsp����',
   band_enteringcheck   varchar(10) not null default 'Y' comment '¼��͸����Ƿ������ͬһ����:Y;N',
   delete_auth          varchar(10) not null default 'Y' comment '�ܷ�ɾ������:Y;N',
   namespace_name       varchar(60) not null comment '�����ռ�����',
   namespace_desc       varchar(100) default null comment '�����ռ�����',
   jsp_viewurl          varchar(100) default null comment '���鿴jsp����',
   primary key (transaction_id, system_id)
);

alter table para_namespace_org comment '��������Ϣ�����';

create table para_select_fields
(
   table_name           varchar(32) not null comment '����',
   select1              varchar(32) not null comment '����1',
   select2              varchar(32) default null comment '����2',
   select3              varchar(32) default null comment '����3',
   primary key (table_name)
);

alter table para_select_fields comment '���������������';

create table para_system_org
(
   system_id            varchar(10) not null comment 'Ŀ��ϵͳID',
   system_name          varchar(60) not null comment 'Ŀ��ϵͳ����',
   system_desc          varchar(100) default null comment 'Ŀ��ϵͳ����',
   primary key (system_id)
);

alter table para_system_org comment 'Ŀ��ϵͳ��';

create table para_table_fields
(
   table_name           varchar(32) not null comment '����',
   column_name          varchar(32) not null comment '����',
   is_null              varchar(1) not null comment '�Ƿ�Ϊ�գ�Y;N',
   is_primary           varchar(1) not null comment '�Ƿ�������Y;N',
   reg_format           varchar(500) comment '������ʽ',
   tip_message          varchar(500) comment '������ʾ��Ϣ',
   primary key (table_name, column_name, is_primary)
);

alter table para_table_fields comment '�������ֶ���Ϣ�����';

create table para_transaction_table_org
(
   req_no               varchar(60) not null comment '����������+ʱ��',
   transaction_id       varchar(100) not null comment '������ȫ��:ϵͳ��_����',
   sub_req_no           varchar(60) not null comment '������������+ʱ��',
   publish_status       varchar(1) default 'N',
   primary key (req_no, transaction_id)
);

alter table para_transaction_table_org comment '�������׺ͱ��Ӧ��ϵ��';

create table para_user_authority
(
   user_id              varchar(20) not null comment '�û�ID',
   auth_application     varchar(10) not null comment '���룺Y;N',
   auth_entering        varchar(10) not null comment '¼��:Y;N',
   auth_check           varchar(10) not null comment '����:Y;N',
   auth_publish         varchar(10) not null comment '����:Y;N',
   primary key (user_id)
);

alter table para_user_authority comment '�û���������Ȩ�ޱ�';

