# Dummy Data for data table

# --- !Ups

INSERT INTO data (`ORG_ID`, `TABLE_ID`, `OBJECT_ID`, `COL_1`, `COL_2`, `COL_3` ) VALUES ('Microsoft', 'Contact', 'C-00001', 'Bill', 'Gates', 'bill.gates@microsoft.com');
INSERT INTO data (`ORG_ID`, `TABLE_ID`, `OBJECT_ID`, `COL_1`, `COL_2`, `COL_3` ) VALUES ('Apple', 'Contact', 'C-00001', 'Jobs', 'Steve', 'jobs.steve@heaven.com');
INSERT INTO data (`ORG_ID`, `TABLE_ID`, `OBJECT_ID`, `COL_1`, `COL_2`, `COL_3` ) VALUES ('Alibaba', 'Contact', 'C-00001', 'Yun', 'Ma', 'ma.yun@alibaba-retired.com');

# --- !Downs

DELETE FROM data;