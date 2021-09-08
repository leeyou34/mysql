1. 모델링(MySQL Model)하여 생성

  - ERD Diagram 생성하기(불러오기)

      > 메인 메뉴(Database)
      > Reverse Engineer...
      > Next -> Next...
      > Select Schemas to Reverse Engineer 항목의
        Select the schemas you want to include: 
        [v]database_modeling 체크
      >  Next -> Next...-> Execute
      체크한 DB의 내용을 가져온다.


  - 개체 생성하기

      [Catalog Tree]
          mydb(그림을 그리기 위한 DB)
          lecture
      
      테이블 생성하기

      > 메뉴의 테이블 아이콘 클릭 후 모눈 화면 클릭
      > 생성된 테이블아이콘 더블클릭 or 마우스오른버튼 Edit
        [Notice] 테이블 생성
        ------------------------------------------------
        ColumnName    Datatype        PK      NN      AI
        ------------------------------------------------
        id            INT             v       v       v
        title         VARCHAR(45)             v
        content       TEXT
        regdate       DATETIME        current_timestamp
        hit           INT                     0
        pub           BIT                   FALSE


  - 테이블 관계 설정하기

        [Comment]] 테이블 생성
        ------------------------------------------------
        ColumnName    Datatype        PK      NN      AI
        ------------------------------------------------
        id            INT             v       v       v
        content       VARCHAR(1000)           v
        regdate       DATETIME        current_timestamp


        [Member]] 테이블 생성
        ------------------------------------------------
        ColumnName    Datatype        PK      NN      AI
        ------------------------------------------------
        id            INT             v       v       v
        name       VARCHAR(45)                v
        pwd        VARCHAR(45)                v
        email      VARCHAR(100)             NULL


        [Role]] 테이블 생성
        ------------------------------------------------
        ColumnName    Datatype        PK      NN      AI
        ------------------------------------------------
        id            INT             v       v       v
        name       VARCHAR(45)                v
    
      
      > 관계 아이콘 클릭 후 해당 테이블을 
          클릭하여 연관관계(relationship)를 설정한다.


      > 메인 메뉴(Database)
      > Foward Engineer... 
      > Next -> Next...          


2. DDL 명령어 사용하여 생성
    
  - SQL의 구분

    DDL(Data Definition Language) ★   
    : CREATE/ALTER/DROP 데이터베이스, 테이블 생성/수정/삭제
      
    DML(Data Manipulation Language) ★★★
    : INSERT/SELECT/UPDATE/DELETE 
      DBMS에게 CRUD 즉, 
      데이터 조작(생성/조회/수정/삭제)을 요청한다.

    DCL(Data Control Language)★
    : GRANT/REVOKE 계정 관리(생성/삭제/권한부여 등)


  - 개념화된 데이터의 정의 : 속성, 컬럼, 필드

    : 프로그래밍에서 데이터를 다룬다는 의미는 정수, 실수, 문자 단위의
      데이터가 아니라 그것들을 조합한 큰 단위의 데이터 즉, 구조화된 
      학생데이터, 주문데이터, 성적데이터... 이다. 이러한 데이터들은
      속성이 업무에 따라 다르다. 따라서 DBMS에게 업무(도메인)따라 
      정의된 데이터 규격을 전달하여 관리(정의/변경/삭제)하도록 요청한다.

      class Member {
          id        String,
          pwd       String,    
          name      String,
          gender    String,
          age       int,
          birthday  String,
          phone     String,
          regdate   Date
      }

        > DBMS 내장 데이터 타입으로 교체

      CREATE TABLE Member(
          ID        VARCHAR(50),
          PWD       VARCHAR(50),
          NAME      VARCHAR(50),
          GENDER    VARCHAR(50),
          AGE       INT,
          BIRTHDAY  VARCHAR(50),
          PHONE     VARCHAR(50),
          REGDATE   DATE  
      );

      주의사항! 
      class Member{}
      CREATE TABLE `Member`();

