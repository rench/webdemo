--****************************************************************************
-- ����OPER_ORGANIZATION
--****************************************************************************
drop table OPER_ORGANIZATION;
create table OPER_ORGANIZATION(
  valid number(1,0),
  fullAddress varchar2(255),
  remark varchar2(2000),
  alias varchar2(255),
  code varchar2(64) not null,
  type varchar2(64),
  id varchar2(64) not null,
  parentId varchar2(64),
  districtId varchar2(64),
  chiefType varchar2(64),
  address varchar2(255),
  name varchar2(64) not null,
  fullName varchar2(64) not null,
  chiefId varchar2(64),
  primary key(ID)
);
create unique index idx_oper_organ_01 on OPER_ORGANIZATION(code);
--create unique index idx_xxxx_xxxx on OPER_ORGANIZATION(xxxx);

--comment on table OPER_ORGANIZATION is 'demo��Ϣ��';
--comment on column OPER_ORGANIZATION.valid is 'xxxx';
--comment on column OPER_ORGANIZATION.fullAddress is 'xxxx';
--comment on column OPER_ORGANIZATION.remark is 'xxxx';
--comment on column OPER_ORGANIZATION.alias is 'xxxx';
--comment on column OPER_ORGANIZATION.code is 'xxxx';
--comment on column OPER_ORGANIZATION.type is 'xxxx';
--comment on column OPER_ORGANIZATION.id is 'xxxx';
--comment on column OPER_ORGANIZATION.parentId is 'xxxx';
--comment on column OPER_ORGANIZATION.districtId is 'xxxx';
--comment on column OPER_ORGANIZATION.chiefType is 'xxxx';
--comment on column OPER_ORGANIZATION.address is 'xxxx';
--comment on column OPER_ORGANIZATION.name is 'xxxx';
--comment on column OPER_ORGANIZATION.fullName is 'xxxx';
--comment on column OPER_ORGANIZATION.chiefId is 'xxxx';
