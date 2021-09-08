
참고) `back tick`    : 중간에 공백이 있는 개체의 이름을 사용할 때
                       `...` 묶어야 하나의 이름으로 인식한다.

CREATE TABLE `member` 
(
  `ID` varchar(50) DEFAULT NULL,
  `PWD` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
   
  `GENDER` char(6) DEFAULT NULL,     
   --> '남' '여'로 표현 가능 2.수정요청        

  `AGE` tinyint unsigned DEFAULT NULL, 
   --> BIRTHDAY(생년월일)로 계산 가능 3.삭제요청

  `BIRTHDAY` char(10) DEFAULT NULL,
  `PHONE` char(13) DEFAULT NULL,

   <-- `EMAIL` 정보 1.추가요청

  `REGDATE` date DEFAULT NULL
); 


1. ADD(추가)

   [Member Table] 실습------------------------------------------
      ALTER TABLE member ADD `EMAIL` VARCHAR(200);
   ------------------------------------------------------------


2. MODIFY(수정)
   : 테이블 DROP 하고 CREATE ?
     만약 데이터가 기존에 존재하고 있는 경우라면...문제발생!
     컬럼에 해당 데이터(값)를 검증(조치) 후 수정해야 한다.

   [Member Table] 실습------------------------------------------
      ALTER TABLE member MODIFY `GENDER` CHAR(3);
      ALTER TABLE member MODIFY `ID` VARCHAR(100);
      ALTER TABLE member MODIFY `PWD` VARCHAR(100);
      ALTER TABLE member MODIFY `NAME` VARCHAR(100);
   ------------------------------------------------------------
    

3. DROP(삭제)

   [Member Table] 실습------------------------------------------
      ALTER TABLE member DROP COLUMN `AGE`;
   ------------------------------------------------------------