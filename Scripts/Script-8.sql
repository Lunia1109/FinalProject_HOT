SELECT * FROM APPROVAL;
SELECT * FROM APPROVER;
SELECT * FROM APPROVAL_ATT;
SELECT * FROM REFERENCE;
SELECT * FROM COMMUTING_TIME_FORM;

DROP TABLE OVERTIME_FORM;

CREATE TABLE OVERTIME_FORM (
	OVERTIME_FORM_NO	NUMBER		NOT NULL,
	APPROVAL_NO	VARCHAR2(100)		NOT NULL,
	OVERTIME_DATE	DATE		NULL,
	OVERTIME_START_TIME	TIMESTAMP		NULL,
	OVERTIME_END_TIME	TIMESTAMP		NULL,
	OVERTIME_HOURS	NUMBER		NULL
);

ALTER TABLE OVERTIME_FORM ADD CONSTRAINT PK_OVERTIME_FORM PRIMARY KEY (
	OVERTIME_FORM_NO
);

SELECT * FROM OVERTIME_FORM;