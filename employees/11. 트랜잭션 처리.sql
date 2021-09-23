
-------
트랜잭션 처리를 위한
commit/rollback
_______________________



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


[Member Table] 실습------------------------------------------


    [BITCAMP1] 계정

        1. 
            SELECT @@autocommit;

        2. C:\ProgramData\MySQL\MySQL Server 8.0
           my.ini(my.cnf) 파일 수정
           
           [mysqld]
           autocommit=0
           
           서버 재시작(윈도우 서비스 MySQL80 다시시작)

            SELECT @@autocommit;
            SET AUTOCOMMIT = FALSE;

        3. MySQL Workbench 상단 메뉴
           Edit -> Preferences -> 좌측 리스트 SQL Editor 항목
           SQL Execution -> General 항목
           [] New connections use auto commit mode 를 체크해제한다.

           MySQL Workbench 재접속

           SELECT @@autocommit;


        4. 레코드 추가
            INSERT INTO member(
                `ID`, `PWD`
            ) VALUES(
                'lee07', '7777'
            );

            SELECT * FROM lecture.member;
            lee07 추가 확인

        6. 상단메뉴 아이콘 Reconnect to DBMS 클릭 후
           조회하면 lee07이 추가되기 전 상태이다. 
           즉, INSERT 결과는 임시 저장소에 저장되어 있다가
           커밋/롤백 완료를 해야 적용된다.
           
        7. 다시 4. 레코드 추가 실행
           실행결과를 확인(SELECT)하고 이상이 없으면 다른 사용자도 참조 할
           수 있도록 COMMIT 실행
            
            COMMIT;

        9. 4. 레코드 추가(ID = 'test', PWD = '8888')
           test 추가 결과 확인
           ROLLBACK;

        10.결과확인  

        11.UPDATE 실행 

            UPDATE member
            SET  ID = 'han08',
                PWD = '8888'
            WHERE ID = 'lee07';    

            SELECT * FROM lecture.member;

        13.COMMIT 실행 및 결과확인


    [BITCAMP2] 계정
        
        5. 레코드 추가 결과확인
           SELECT * FROM lecture.member;
           lee07 추가되지 않음

           상단메뉴 아이콘 Reconnect to DBMS 클릭 후
           조회하여도 추가되지 않은 상태

        8. 상단메뉴 아이콘 Reconnect to DBMS 클릭 후
           조회하여 결과(lee07추가)를 확인
        
        12.UPDATE 실행

            UPDATE member
            SET  ID = 'park08',
                PWD = '8888'
            WHERE ID = 'lee07'; 

            에러발생! LOCK 상태이므로... 
            14:54:27 Error Code: 2013. 
            Lost connection to MySQL server during query

        
----------------------------------------------------------------