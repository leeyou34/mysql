업무용 애플리케이션을 만들기 위해서는
기본 DML(데이터조작언어)을 숙지해야 한다.
기본 CRUD 즉, INSERT/SELECT/UPDATE/DELETE를 
다룰 수 있어야 한다.

_________________

업무용 테이블 준비
_________________


회원 테이블
[MEMBER]


멤버가 관리하는 오브젝트(공지사항)
[NOTICE]
CREATE TABLE `NOTICE`(
	ID			INT,
    TITLE		VARCHAR(300),
    WRITER_ID 	VARCHAR(100),
    CONTENT 	TEXT,
    REGDATE 	TIMESTAMP,
    HIT 		INT,
    FILES 		VARCHAR(3000)
);


공지에 추가되는 댓글
[COMMENT]
CREATE TABLE `COMMENT`(
	ID			INT,
    CONTENT 	TEXT,
    REGDATE 	TIMESTAMP,
    WRITER_ID 	VARCHAR(100),
	NOTICE_ID	INT
);


역할 구분자(관리자/학생/선생)
[ROLE]
CREATE TABLE `ROLE`(
	ID			VARCHAR(100),
    DISCRIPTION VARCHAR(1500)
);


회원의 역할 담당 테이블
[MEMBER_ROLE]
CREATE TABLE `MEMBER_ROLE`(
	MEMBER_ID			VARCHAR(100),
    ROLE_ID				VARCHAR(100)
);