



## 1. DB 설정 

### 1. 기본 설정

```SQL
-- DB USER를 확인한다. 'shop'이 있는 지?
SELECT host, user FROM user;

-- 없으면 만든다.
CREATE USER 'shop'@'localhost' IDENTIFIED BY 'shop';
GRANT ALL PRIVILEGES on shop.* to 'shop'@'localhost' identified by 'shop';
FLUSH PRIVILEGES;

-- DATABASE 를 생성한다.
CREATE DATABASE shop default CHARACTER SET UTF8;
```

### 2. Test 확인

```sql
-- 유저 테이블 SAMPLE 용으로 생성한다.
CREATE TABLE TB_USER (
	USER_ID 		 	VARCHAR(20) NOT NULL,
	USER_NAME	 		VARCHAR(10) NOT NULL,
	PRIMARY KEY (USER_ID)
) ENGINE=InnoDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI;
```

[ERD 링크](https://app.diagrams.net/#G182HxZqZ3nAd0lj3V-47dNUabSnfiMBhr)