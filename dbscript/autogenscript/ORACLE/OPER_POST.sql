--****************************************************************************
-- 表：OPER_POST
--****************************************************************************
create table OPER_POST(
	id varchar2(64 char),
	valid number(1,0),
	organization varchar2(64 char),
	name varchar2(64 char),
	code varchar2(64 char),
	primary key(ID)
);
--create index idx_xxxx_xxxx on OPER_POST(xxxx);
--create unique index idx_xxxx_xxxx on OPER_POST(xxxx);

--comment on table OPER_POST is 'demo信息表';
--comment on column OPER_POST.id is 'xxxx';
--comment on column OPER_POST.valid is 'xxxx';
--comment on column OPER_POST.organization is 'xxxx';
--comment on column OPER_POST.name is 'xxxx';
--comment on column OPER_POST.code is 'xxxx';