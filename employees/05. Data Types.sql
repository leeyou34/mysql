
1. 문자(character) 형식
    'nEWlec' 홑따옴표
    'A'
    '148'

    CHAR(n)     : 고정길이(n: 1 ~ 255)
    VARCHAR(n)  : 가변길이(길이가 들쭉날쭉 n: 1 ~ 65,535)
    TINYTEXT    : 255
    TEXT        : 65,535
    MEDIUMTEXT  : 16,777,215
    LONGTEXT    : 4GB

    [Member Table] 실습------------------------------------------
     
     010-1234-5678 13자리 고정길이
     PHONE      CHAR(13)   

     2000-01-01    10자리 고정길이
     BIRTHDAY   CHAR(10)

     남성/여성
     GENDER     CHAR(2) : X   2byte를 의미
     : SELECT LENGTH('ab');   2byte
     : SELECT LENGTH('남성'); 6byte
     GENDER     CHAR(6);
     
     ------------------------------------------------------------


2. 숫자(Numeric) 형식
    38
    3.85
    3.85F
    137

    BIT(n)     : 1 ~ 64bit 표현(b'0000')
    TINYINT    : 1 byte  정수 저장
    BOOL
    BOOLEAN    : 1 byte  0 은 flase로, 그 외 true
    SMALLINT   : 2 byte
    INT
    INTEGER    : 4 byte
    BIGINT     : 8 byte
    FLOAT      : 4 byte 소수점 포함  7자리
    DOUBLE     : 8 byte 소수점 포함 15자리
    DECIMAL(5,2) : 00.00 소수점 포함한 자리수

    [Member Table] 실습------------------------------------------
     AGE    TINYINT     UNSIGNED
     ------------------------------------------------------------

3. 날짜와 시간 형식 
    Date 형식
        '2021-09-25'

    TIMESTAMP 형식(시분초 추가)
        '2021-09-25 10.38.29.00000'


4. LOB(Large Object) 형식
    사진, 동영상, 문서 파일 등의 대용량 데이터 저장
    TINYBLOB     : 255
    BLOB         : 65,535
    MEDIUMBLOB   : 16,777,215
    LONGBLOB     : 4GB
