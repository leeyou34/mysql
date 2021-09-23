
-------
트랜잭션 처리를 위한
commit/rollback
https://ko.wikipedia.org/wiki/ACID




트랜잭션이란 ? 

: 업무의 실행단위 / 논리적인 명령단위 / 개념상의 실행단위



[업무적인 단위]               [물리적인 명령어 단위]
---------------------------------------------------
                             다른세션이 건드리지 못하도록...
                             LOCK                       
                               1. UPDATE : A--
 계좌이체(A->B)      =>        
                               2. UPDATE : B++
                             UNLOCK  
                             COMMIT
---------------------------------------------------
                             LOCK
                               1. INSERT : 글생성 
 이벤트 게시글 등록   =>
                               2. UPDATE : 포인트++
                             UNLOCK
                             COMMIT  
---------------------------------------------------

1, 2의 실행이 모두 성공적으로 한 번에 실행되어야 한다.
한쪽만 실행되어서는 안된다.
ALL or NOTHING !
전부 실행되던지 아니면 모두 취소하던지


--[트랜잭션] 실습 1. SET AUTOCOMMIT = 0 -----------------------------


    실습환경: MySQL cmd Client 콘솔창 2개(SESSION1,2)를 열어 실행

    [CMD1] root계정 접속 -- 세션1
    [CMD2] root계정 접속 -- 세션2


    01.  [CMD1] root계정 / [CMD2] root계정
        -- 1(TRUE) 임을 확인 즉, 트랜잭션 처리 미적용 확인
           mysql> USE LECTURE;
           mysql> SELECT @@AUTOCOMMIT; 
            +--------------+
            | @@AUTOCOMMIT |
            +--------------+
            |            1 |
            +--------------+ 
        

    02.  [CMD1] root계정
        -- 테스트 할 테이블 생성
           mysql> CREATE TABLE `TB`(
                -> `ID` VARCHAR(20) NOT NULL PRIMARY KEY,
                -> `PW` VARCHAR(20) NOT NULL,
                -> `NAME` VARCHAR(20)
                -> );
        -- 테이블 컬럼 확인        
           mysql> DESC TB;
            +-------+-------------+------+-----+---------+-------+
            | Field | Type        | Null | Key | Default | Extra |
            +-------+-------------+------+-----+---------+-------+
            | ID    | varchar(20) | NO   | PRI | NULL    |       |
            | PW    | varchar(20) | NO   |     | NULL    |       |
            | NAME  | varchar(20) | YES  |     | NULL    |       |
            +-------+-------------+------+-----+---------+-------+


    03.  [CMD1] root계정
        -- 레코드 삽입(생성)
            mysql> INSERT INTO `TB`
                -> VALUES('01', '111', 'ONE');
            
        -- 조회(확인)
            mysql> SELECT * FROM `TB`;
            +----+-----+------+
            | ID | PW  | NAME |
            +----+-----+------+
            | 01 | 111 | ONE  |
            +----+-----+------+


    04. `[CMD2] root계정`
        -- 세션2에서 세션1의 INSERT 적용 여부 확인
            mysql> USE LECTURE;
            Database changed
            mysql> SELECT * FROM `TB`;
            +----+-----+------+
            | ID | PW  | NAME |
            +----+-----+------+
            | 01 | 111 | ONE  |
            +----+-----+------+


    05.  [CMD1] root계정
        -- 트랜잭션 처리를 위한 설정
            mysql> SET AUTOCOMMIT = 0;

        -- 레코드 추가(생성)
            mysql> INSERT INTO `TB`
                -> VALUES('02', '222', 'TWO');            
        
        -- 조회(확인)
            mysql> SELECT * FROM `TB`;
            +----+-----+------+
            | ID | PW  | NAME |
            +----+-----+------+
            | 01 | 111 | ONE  |
            | 02 | 222 | TWO  |
            +----+-----+------+        
            

    06. `[CMD2] root계정`
        -- 세션2에서 세션1의 추가 INSERT 적용 여부 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+------+
            | ID | PW  | NAME |
            +----+-----+------+
            | 01 | 111 | ONE  |
            +----+-----+------+      
        -- 세션1의 실행은 임시저장소(UNDO)에 보관, 디스크는 변경되지 않음


    07.  [CMD1] root계정
        -- 실행 결과 확인 후 커밋
            mysql> COMMIT;           


    08. `[CMD2] root계정`
        -- 세션2에서 세션1의 커밋 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+------+
            | ID | PW  | NAME |
            +----+-----+------+
            | 01 | 111 | ONE  |
            | 02 | 222 | TWO  |
            +----+-----+------+


    09.  [CMD1] root계정
        -- 트랜잭션 처리 안함
            mysql> SET AUTOCOMMIT = 1;

    
    10.  [CMD1] root계정
        -- 레코드 추가 및 확인
            mysql> INSERT INTO `TB`
                -> VALUES('03', '333', 'THREE');

            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            +----+-----+-------+      


    11. `[CMD2] root계정`
        -- 세션2에서 세션1의 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            +----+-----+-------+
        -- 세션1의 '커밋'명령없이 자동 반영됨



--[트랜잭션] 실습 2. START TRANSACTION ---------------------------------

   
    01.  [CMD1] root계정 
        -- 1(TRUE) 임을 확인 즉, 트랜잭션 처리 미적용 확인
           mysql> SELECT @@AUTOCOMMIT; 
            +--------------+
            | @@AUTOCOMMIT |
            +--------------+
            |            1 |
            +--------------+ 

        
    02.  [CMD1] root계정 
        -- 트랜잭션 적용을 위한 설정
            mysql> START TRANSACTION;            
        -- 레코드 추가(생성)
            mysql> INSERT INTO `TB`
                -> VALUES('04', '444', 'FOUR');
        -- 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            | 04 | 444 | FOUR  |
            +----+-----+-------+        


    03. `[CMD2] root계정`
        -- 세션2에서 세션1의 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            +----+-----+-------+
        -- ID 04 번 추가 되어 있지 않음 

    04.  [CMD1] root계정
        -- 실행 결과 확인 후 커밋
            mysql> COMMIT;    


    05. `[CMD2] root계정`
        -- 세션2에서 세션1의 커밋 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            | 04 | 444 | FOUR  |
            +----+-----+-------+


    06.  [CMD1] root계정
        -- 트랜잭션 적용 후 레코드 삭제
            mysql> START TRANSACTION;
            mysql> DELETE FROM `TB`
                -> WHERE `ID`='04';
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            +----+-----+-------+

    07. `[CMD2] root계정`
        -- 세션2에서 세션1의 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            | 04 | 444 | FOUR  |
            +----+-----+-------+
        -- ID 04 번 삭제 되어 있지 않음 


    08.  [CMD1] root계정
        -- 커밋 명령
            mysql> COMMIT;    


    09. `[CMD2] root계정`
        -- 세션2에서 세션1의 커밋 실행 결과 확인
            mysql> SELECT * FROM `TB`;
            +----+-----+-------+
            | ID | PW  | NAME  |
            +----+-----+-------+
            | 01 | 111 | ONE   |
            | 02 | 222 | TWO   |
            | 03 | 333 | THREE |
            +----+-----+-------+




--[트랜잭션] 실습3. 트랜잭션 이해를 위한 계좌이체 연습 -------------------------
        
         -- 계좌 테이블 생성
            CREATE TABLE `ACCOUNT`(
                `ACCNUM` CHAR(5) NOT NULL,
                `NAME` VARCHAR(50) NOT NULL,
                `BALANCE` BIGINT UNSIGNED DEFAULT 0,
                `UPDATE` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE NOW(),
                PRIMARY KEY (`ACCNUM`)
            );

         -- 통장 개설
            INSERT INTO `ACCOUNT`(
                `ACCNUM`, `NAME`
            )VALUES(
                '01-11', '고결'
            ); 
            INSERT INTO `ACCOUNT`(
                `ACCNUM`, `NAME`
            )VALUES(
                '01-12', '허원준'
            );

         -- 입금
            UPDATE `ACCOUNT`
            SET `BALANCE` = 10000
            WHERE `ACCNUM` = '01-11'; 

            UPDATE `ACCOUNT`
            SET `BALANCE` = 10000
            WHERE `ACCNUM` = '01-12'; 

         -- 계좌이체
            UPDATE `ACCOUNT`
            SET `BALANCE` = `BALANCE` - 5000
            WHERE `ACCNUM` = '01-11';

            UPDATE `ACCOUNT`
            SET `BALANCE` = `BALANCE` + 5000
            WHERE `ACCNUM` = '01-12';

            COMMIT;
            ROLLBACK;
            SELECT * FROM ACCOUNT;       


----------------------------------------------------------------