
★ DOCUMENTATION 활용하기
   https://dev.mysql.com/doc/
   
   [Reference Manual]
   

1. Database Administration Statements
   데이터 베이스 생성/삭제
  
  > 현재 데이터베이스 확인하기
    : show databases;
    
  > 데이터베이스 생성하기
    : create database testdb;
    : create schema   testdb;
    
    데이터베이스 한글 설정
    : create database[schema] testdb default character set utf8;
    
  > 데이터베이스 삭제
    : drop database testdb;

  --------------------------------<실습>-----------------------------------

  > MySQL 8.0 Command Line Client 실행
    Enter password: ******

  > cmd 실행
    mysql -u root -p
    Enter password: ******

    mysql> show databases;
    mysql> use sakila
    mysql> show tables;
    mysql> select * from actor;

  > Workbench 실행
    show databases;
    ctrl + 마우스휠 : 사이즈 조절
    선택 후 [ctrl + Enter] : 쿼리 실행
    use sakila;
    show tables;
    창 옵션(설정/해제)

    CREATE DATABASE LECTURE;
    SHOW DATABASES;  

  --------------------------------------------------------------------------


2. CREATE USER Statement
   사용자(계정) 추가하기
  
    DCL 
    명령어로 사용자(계정) 추가하기
    : CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'password';
                           @ 접속 시 사용할 IP 설정(localhost만 허용)

    : CREATE USER 'jeffrey'@'%' identified by 'password';
                           @ 외부 모든(%) IP 접근 허용

    사용자(계정) 삭제하기
    : DROP USER 'jeffrey'@'localhost';


    비밀번호 변경하기
    : ALTER USER 'jeffrey'@'localhost'
          IDENTIFIED WITH mysql_native_password
                     BY 'password';        

  --------------------------------<실습>-----------------------------------
    
    SHOW DATABASES;
    USE MYSQL;
    SHOW TABLES;
    DESC USER;
    SELECT * FROM USER;

    SELECT current_user();          -- 현재계정
    SHOW GRANTS FOR current_user(); -- 권한정보
    SELECT `Host`, `User`, `plugin`, `authentication_string` from user;

    CREATE USER bitcamp@'%' IDENTIFIED BY 'dkdlxl';

    cmd 실행 접속확인

    ALTER USER 'bitcamp'@'%' 
    IDENTIFIED WITH mysql_native_password 
    BY '1234';

    cmd 실행 접속확인

    flush privileges;

  --------------------------------------------------------------------------



3. GRANT Statement
   데이터베이스 사용 권한 부여하기
  
    모든 권한 부여하기
    
    - 모든 DB의 모든 테이블
      : GRANT ALL ON *.* TO 'jeffrey'@'localhost';
    
    - 특정 DB(db1)의 모든 테이블
      : GRANT ALL ON db1.* TO 'jeffrey'@'localhost';

    일부 권한 부여하기
      : GRANT SELECT, INSERT, UPDATE ON *.* TO 'someuser'@'somehost';
      : GRANT SELECT, INSERT ON mydb.mytbl TO 'someuser'@'somehost';

    권한 제거하기
      : REVOKE ALL ON *.* FROM u1;
      : REVOKE INSERT, UPDATE ON db1.* FROM u1;

    계정 삭제하기
      : DROP USER 'jeffrey'@'localhost';


    권한 변경을 적용
      : flush privileges;


    --------------------------------<실습>-----------------------------------
    
        cmd 실행(bitcamp로 접속)

        SHOW GRANTS FOR bitcamp;
        SHOW DATABASES;

        MySQL Workbench 실행
        Setup New Connection 설정
        권한없음 확인
    
     -- 권한부여
        GRANT ALL ON lecture.* TO 'bitcamp'@'%';

        cmd 실행
        SHOW GRANTS FOR bitcamp;
        SHOW DATABASES;         

     -- Setup Connection
        Workbench 종료 후
        시작화면 MySQL Connections (+) 버튼 클릭
        Connection Name : lectureDB
        Username: bitcamp
        [Test Connection] 클릭
        비번 : 1234 입력
        저장(v)

     -- DB 추가
        CREATE DATABASE `DATABASE_MODELING`;
        GRANT ALL ON database_modeling.* TO 'bitcamp'@'%';    

    --------------------------------------------------------------------------
