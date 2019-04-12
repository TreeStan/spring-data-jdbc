DROP TABLE MANUAL;
DROP TABLE LEGO_SET;
DROP TABLE ONE_TO_ONE_PARENT;
DROP TABLE Child_No_Id;
DROP TABLE LIST_PARENT;
DROP TABLE element_no_id;
DROP TABLE ARRAY_OWNER;
DROP TABLE BYTE_ARRAY_OWNER;
DROP TABLE CHAIN4;
DROP TABLE CHAIN3;
DROP TABLE CHAIN2;
DROP TABLE CHAIN1;
DROP TABLE CHAIN0;

CREATE TABLE LEGO_SET
(
  id1  SERIAL PRIMARY KEY,
  NAME VARCHAR(30)
);
CREATE TABLE MANUAL
(
  id2         SERIAL PRIMARY KEY,
  LEGO_SET    BIGINT,
  ALTERNATIVE BIGINT,
  CONTENT     VARCHAR(2000)
);

ALTER TABLE MANUAL
  ADD FOREIGN KEY (LEGO_SET)
    REFERENCES LEGO_SET (id1);

CREATE TABLE ONE_TO_ONE_PARENT
(
  id3     SERIAL PRIMARY KEY,
  content VARCHAR(30)
);
CREATE TABLE Child_No_Id
(
  ONE_TO_ONE_PARENT INTEGER PRIMARY KEY,
  content           VARCHAR(30)
);

CREATE TABLE LIST_PARENT
(
  id4  SERIAL PRIMARY KEY,
  NAME VARCHAR(100)
);
CREATE TABLE element_no_id
(
  content         VARCHAR(100),
  LIST_PARENT_key BIGINT,
  LIST_PARENT     INTEGER
);

CREATE TABLE ARRAY_OWNER
(
  ID               SERIAL PRIMARY KEY,
  DIGITS           VARCHAR(20)[10],
  MULTIDIMENSIONAL VARCHAR(20)[10][10]
);

CREATE TABLE BYTE_ARRAY_OWNER
(
  ID          SERIAL PRIMARY KEY,
  BINARY_DATA BYTEA NOT NULL
);

CREATE TABLE CHAIN4
(
  FOUR       SERIAL PRIMARY KEY,
  FOUR_VALUE VARCHAR(20)
);

CREATE TABLE CHAIN3
(
  THREE       SERIAL PRIMARY KEY,
  THREE_VALUE VARCHAR(20),
  CHAIN4      BIGINT,
  FOREIGN KEY (CHAIN4) REFERENCES CHAIN4 (FOUR)
);

CREATE TABLE CHAIN2
(
  TWO       SERIAL PRIMARY KEY,
  TWO_VALUE VARCHAR(20),
  CHAIN3    BIGINT,
  FOREIGN KEY (CHAIN3) REFERENCES CHAIN3 (THREE)
);

CREATE TABLE CHAIN1
(
  ONE       SERIAL PRIMARY KEY,
  ONE_VALUE VARCHAR(20),
  CHAIN2    BIGINT,
  FOREIGN KEY (CHAIN2) REFERENCES CHAIN2 (TWO)
);

CREATE TABLE CHAIN0
(
  ZERO       SERIAL PRIMARY KEY,
  ZERO_VALUE VARCHAR(20),
  CHAIN1     BIGINT,
  FOREIGN KEY (CHAIN1) REFERENCES CHAIN1 (ONE)
);