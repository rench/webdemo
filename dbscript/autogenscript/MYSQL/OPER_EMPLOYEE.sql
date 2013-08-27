--****************************************************************************
-- 表：OPER_EMPLOYEE
--****************************************************************************
create table OPER_EMPLOYEE(
	leavingDate datetime,
	sex integer,
	operatorId varchar(64),
	code varchar(64),
	officialDate datetime,
	entryDate datetime,
	trialPeriodEndDate datetime,
	leaving bit,
	name varchar(64),
	age integer,
	official bit,
	lastUpdatePhoneLinkInfoDate datetime,
	cardNum varchar(255),
	primary key(OPERATORID)
);
--create index idx_xxxx_xxxx on OPER_EMPLOYEE(xxxx);
--create unique index idx_xxxx_xxxx on OPER_EMPLOYEE(xxxx);

--comment on table OPER_EMPLOYEE is 'demo信息表';
--comment on column OPER_EMPLOYEE.leavingDate is 'xxxx';
--comment on column OPER_EMPLOYEE.sex is 'xxxx';
--comment on column OPER_EMPLOYEE.operatorId is 'xxxx';
--comment on column OPER_EMPLOYEE.code is 'xxxx';
--comment on column OPER_EMPLOYEE.officialDate is 'xxxx';
--comment on column OPER_EMPLOYEE.entryDate is 'xxxx';
--comment on column OPER_EMPLOYEE.trialPeriodEndDate is 'xxxx';
--comment on column OPER_EMPLOYEE.leaving is 'xxxx';
--comment on column OPER_EMPLOYEE.name is 'xxxx';
--comment on column OPER_EMPLOYEE.age is 'xxxx';
--comment on column OPER_EMPLOYEE.official is 'xxxx';
--comment on column OPER_EMPLOYEE.lastUpdatePhoneLinkInfoDate is 'xxxx';
--comment on column OPER_EMPLOYEE.cardNum is 'xxxx';