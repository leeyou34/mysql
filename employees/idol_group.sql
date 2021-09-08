CREATE TABLE IDOL_GROUP (	
	`COMPANY` 	  VARCHAR(300) NOT NULL, 
	`GROUP_NAME`  VARCHAR(300) NOT NULL, 
	`DEBUT_YEAR`  VARCHAR(4), 
	`DEBUT_ALBUM` VARCHAR(300), 
	`GENDER` 	  VARCHAR(10)
);
 
ALTER TABLE IDOL_GROUP MODIFY GROUP_NAME  VARCHAR(300) NOT NULL COMMENT '그룹명';
ALTER TABLE IDOL_GROUP MODIFY DEBUT_YEAR  VARCHAR(4) 			COMMENT '데뷔년도';
ALTER TABLE IDOL_GROUP MODIFY DEBUT_ALBUM VARCHAR(300) 			COMMENT '데뷔앨범';
ALTER TABLE IDOL_GROUP MODIFY GENDER 	  VARCHAR(10) 			COMMENT '성별';

INSERT INTO IDOL_GROUP VALUES ('빅히트 엔터테인먼트', 'BTS', '2013', '2 COOL 4 SCHOOL', 'boy');
INSERT INTO IDOL_GROUP VALUES ('JYP 엔터테인먼트', '트와이스', '2015', 'THE STORY BEGINS', 'girl');
INSERT INTO IDOL_GROUP VALUES ('YG 엔터테인먼트', '블랙핑크', '2016', 'SQUARE ONE', 'girl');
INSERT INTO IDOL_GROUP VALUES ('판타지오', '아스트로', '2016', 'SPRING UP', 'boy');
INSERT INTO IDOL_GROUP VALUES ('울림 엔터테인먼트', '러블리즈', '2014', 'Girls Invasion', 'girl');
INSERT INTO IDOL_GROUP VALUES ('스타쉽 엔터테인먼트', '우주소녀', '2016', 'Would You Like', 'girl');
INSERT INTO IDOL_GROUP VALUES ('스윙 엔터테인먼트', 'Wanna One', '2017', '1X1=1', 'boy');
INSERT INTO IDOL_GROUP VALUES ('큐브 엔터테인먼트', '(여자)아이들', '2018', 'I am', 'girl');
INSERT INTO IDOL_GROUP VALUES ('SM 엔터테인먼트', '레드벨벳', '2014', '행복', 'girl');
INSERT INTO IDOL_GROUP VALUES ('SM 엔터테인먼트', 'EXO', '2012', '마마', 'boy');
INSERT INTO IDOL_GROUP VALUES ('JYP 엔터테인먼트', '갓세븐', '2014', 'Got it?', 'boy');
INSERT INTO IDOL_GROUP VALUES ('오프더레코드 엔터테인먼트', '아이즈원', '2018', '컬러라이즈', 'girl');
INSERT INTO IDOL_GROUP VALUES ('플랜에이 엔터테인먼트', '에이핑크', '2011', 'Seven Springs of Apink', 'girl');
INSERT INTO IDOL_GROUP VALUES ('큐브 엔터테인먼트', '비투비', '2012', '비밀', 'boy');
INSERT INTO IDOL_GROUP VALUES ('쏘스뮤직', '여자친구', '2015', 'Season of Glass', 'girl');
INSERT INTO IDOL_GROUP VALUES ('YG 엔터테인먼트', '위너', '2014', '2014 S/S', 'boy');
INSERT INTO IDOL_GROUP VALUES ('스타쉽 엔터테인먼트', '몬스타엑스', '2015', 'TRESPASS', 'boy');
INSERT INTO IDOL_GROUP VALUES ('WM 엔터테인먼트', '오마이걸', '2015', 'OH MY GIRL', 'girl');
INSERT INTO IDOL_GROUP VALUES ('DSP미디어', '에이프릴', '2015', 'Dreaming', 'girl');
INSERT INTO IDOL_GROUP VALUES ('젤리피쉬 엔터테인먼트', '구구단', '2016', 'The Little Mermaid', 'girl');
