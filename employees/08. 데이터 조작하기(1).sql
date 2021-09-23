
DML(Data Manipulation Language)
: 검색/등록/삭제/갱신을 위한 데이터베이스 언어


[Member Table] 실습------------------------------------------

[INSERT] 등록

    1. 모든 필드 값을 입력하기

        SELECT * FROM lecture.member;
        INSERT INTO lecture.member 
        VALUES(
            'hong01',
            '1234',
            '홍길동',
            '남',
            '2021-09-03',
            '010-1234-5678',
            '2021-09-03',
            'hong01@gmail.com'
        );
        SELECT * FROM lecture.member;

    2. 원하는 필드만, 원하는 순서대로 입력하기

        INSERT INTO member(ID, PWD) VALUES(
            'lim02',
            '6789'
        );

        필수(입력) 정보 외에는 NULL로 채워짐



[SELECT] 검색
    
    1. 레코드 꺼내 보기

         SELECT * FROM member;
         SELECT `ID`, `NAME`, `PWD` FROM member;
         select id, pwd from member;

      * 예약어, 컬럼명은 대소문자를 가리지 않는다.
      * 값을 비교할 때는 대소문자를 구별한다.
    
    
    2. 별칭(alias) 사용하기

         SELECT ID as USER_ID, NAME, PWD FROM member;
         SELECT ID `USER ID`, NAME, PWD `PASSWORD` FROM member;

      * 빈공백 및 대소문자 그대로 반영하려면 ` ~ ` backtick 이용


----------------------------------------------------------------