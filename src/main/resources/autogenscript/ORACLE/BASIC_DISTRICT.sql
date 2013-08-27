--****************************************************************************
-- 表：BASIC_DISTRICT
--****************************************************************************
create table BASIC_DISTRICT(
	id		varchar2(64 char),
	parentId		varchar2(64 char),
	description		varchar2(2000 char),
	name		varchar2(64 char),
	type		varchar2(64 char),
	primary key(ID)
);
--create index idx_xxxx_xxxx on BASIC_DISTRICT(xxxx);
--create unique index idx_xxxx_xxxx on BASIC_DISTRICT(xxxx);

--comment on table BASIC_DISTRICT is 'demo信息表';
--comment on column BASIC_DISTRICT.id is 'xxxx';
--comment on column BASIC_DISTRICT.id is 'xxxx';
--comment on column BASIC_DISTRICT.parentId is 'xxxx';
--comment on column BASIC_DISTRICT.description is 'xxxx';
--comment on column BASIC_DISTRICT.name is 'xxxx';
--comment on column BASIC_DISTRICT.type is 'xxxx';