DROP TABLE shop;
DROP TABLE admin;
DROP TABLE day_off;
DROP TABLE review;
DROP TABLE user;
DROP TABLE user_detail;
DROP TABLE service;
DROP TABLE sales;
DROP TABLE reservation;
DROP TABLE membership;
DROP TABLE membership_usage;

CREATE TABLE SHOP
(
    SHOP_NO   INT AUTO_INCREMENT,
    SHOP_NAME VARCHAR(30) NOT NULL,
    OWNER     VARCHAR(15),
    PRIMARY KEY (SHOP_NO)
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE ADMIN
(
    ADMIN_NO    INT AUTO_INCREMENT,
    ADMIN_ID    VARCHAR(30) NOT NULL,
    SHOP_NO     INT         NOT NULL,
    PASSWORD    BLOB        NOT NULL,
    NAME        VARCHAR(30) NOT NULL,
    SEX         VARCHAR(2)  NOT NULL,
    PHONE       BLOB        NOT NULL,
    AGE         INT         NOT NULL,
    PROFILE     TEXT,
    IMG_URL     VARCHAR(100),
    INSERT_DATE TIMESTAMP DEFAULT NOW(),
    DELETE_DATE TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (ADMIN_NO)
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE SALES
(
    SALES_NO    INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ADMIN_NO    INT             NOT NULL,
    INCOME      INT             NOT NULL,
    MEMO        TEXT            NOT NULL,
    INSERT_DATE TIMESTAMP DEFAULT NOW()
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE DAY_OFF
(
    DAY_OFF      VARCHAR(30) PRIMARY KEY NOT NULL,
    DAY_OFF_DATE TIMESTAMP DEFAULT NOW(),
    INSERT_DATE  TIMESTAMP DEFAULT NOW(),
    ADMIN_NO     VARCHAR(30)             NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE USER
(
    USER_NO     INT AUTO_INCREMENT,
    USER_ID     VARCHAR(30) NOT NULL,
    PASSWORD    BLOB        NOT NULL,
    NAME        VARCHAR(30) NOT NULL,
    SEX         VARCHAR(2)  NOT NULL,
    PHONE       BLOB        NOT NULL,
    AGE         INT         NOT NULL,
    INSERT_DATE TIMESTAMP DEFAULT NOW(),
    DELETE_DATE TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (USER_NO)
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE USER_DETAIL
(
    USER_DETAIL_NO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    MEMO           TEXT        NOT NULL,
    COUNT          INT       DEFAULT 0,
    INSERT_DATE    TIMESTAMP DEFAULT NOW(),
    USER_NO        VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE REVIEW
(
    REVIEW_NO      INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    REVIEW_CONTENT TEXT        NOT NULL,
    INSERT_DATE    TIMESTAMP DEFAULT NOW(),
    USER_ID        VARCHAR(30) NOT NULL,
    ADMIN_NO       VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE STAR
(
    USER_ID    VARCHAR(30) NOT NULL,
    ADMIN_NO   INT         NOT NULL,
    STAR_POINT INT DEFAULT 0,
    PRIMARY KEY (USER_ID, ADMIN_NO)
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;

CREATE TABLE MEMBERSHIP
(
    MEMBERSHIP_NO INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    MEMO          TEXT NOT NULL,
    INSERT_DATE   TIMESTAMP DEFAULT NOW(),
    USER_NO       INT
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE MEMBERSHIP_USAGE
(
    USAGE_NO    INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    PRICE       INT  NOT NULL,
    DESCRIPTION TEXT NOT NULL,
    INSERT_DATE   TIMESTAMP DEFAULT NOW(),
    MEMBERSHIP_NO     INT  NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;


CREATE TABLE RESERVATION
(
    RESERVATION_NO   INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    RESERVATION_DATE TIMESTAMP  DEFAULT NOW(),
    IS_CONFIRM       VARCHAR(1) DEFAULT 'N',
    MEMO             TEXT        NOT NULL,
    INSERT_DATE      TIMESTAMP  DEFAULT NOW(),
    SERVICE_NO       INT         NOT NULL,
    ADMIN_NO         INT         NOT NULL,
    USER_ID          VARCHAR(30) NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;



CREATE TABLE SERVICE (
	SERVICE_NO 				INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	SHOP_NO					INT NOT NULL,
	SERVICE_NAME			VARCHAR(30) NOT NULL,
	SERVICE_PRICE			INT NOT NULL,
	MEMO						TEXT NOT NULL
)ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;



INSERT INTO SHOP (SHOP_NO, SHOP_NAME, OWNER)
VALUES (null, 'GOOD MAKER', 'YJKIM');
INSERT INTO SERVICE (SHOP_NO, SERVICE_NAME, SERVICE_PRICE, MEMO)
VALUES (1, '남성  커트', 15000, '');
INSERT INTO SERVICE (SHOP_NO, SERVICE_NAME, SERVICE_PRICE, MEMO)
VALUES (1, '여성  커트', 30000, '');
INSERT INTO USER (USER_ID, PASSWORD, NAME, SEX, PHONE, AGE)
VALUES ('TEST', 'TEST', '김윤제', '남', '01040712232', 29);
INSERT INTO ADMIN (ADMIN_ID, SHOP_NO, PASSWORD, NAME, SEX, PHONE, AGE)
VALUES ('ADMIN', 1, 'ADMIN', '김성모', '여', '01011112222', 30);
