
-----
원하는 컬럼
원하는 레코드만...
__________________


1. 산술연산자(+,-,*,/)
    ---------------------------------------------
    SELECT  2+3;
    SELECT  2+3 SUM;
    SELECT  1 +'3';
    SELECT '2'+'3';
    ---------------------------------------------
 

2. 비교연산자(=, !=, <>, >, >=, <=)
   같지않다(!=, <>)

    아이돌그룹 테이블
    ---------------------------------------------
    > JYP 엔터테인먼트만 조회
        SELECT * FROM idol_group
        WHERE COMPANY = 'JYP 엔터테인먼트';

    > 2015년 이전 데뷔한 그룹만 조회
        SELECT * FROM idol_group
        WHERE DEBUT_YEAR < '2015';
    ---------------------------------------------

    아이돌멤버 테이블
    ---------------------------------------------
    > 본명이 입력되지 않은 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME = '';

    > 본명이 입력된 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME != '';
    ---------------------------------------------


3. 관계연산자(NOT, AND, OR, BETWEEN, IN)

    아이돌그룹 테이블
    ---------------------------------------------
    > 데뷔년도가 2013년부터 2017년까지의 그룹을 조회
      (즉, 연속적인 데이터)

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR >= '2013' AND
              DEBUT_YEAR <= '2017';

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR BETWEEN 2013 AND 2017;  


    > 데뷔년도가 2013, 2015, 2017 년도인 그룹을 조회
      (즉, 비연속적인 데이터)

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR = '2013' OR
              DEBUT_YEAR = '2015' OR
              DEBUT_YEAR = '2017';

        SELECT * FROM idol_group
        WHERE DEBUT_YEAR IN('2013', '2015', '2017'); 

    > 데뷔가 2013, 2015, 2017 년도가 아닌 그룹을 조회
        SELECT * FROM idol_group
        WHERE DEBUT_YEAR NOT IN('2013', '2015', '2017');    
        
    ---------------------------------------------


4. 패턴 비교연산자( LIKE, %, _ )
   WHERE NAME   =  '박%';  (X)
   WHERE NAME LIKE '박%';  (O)
   WHERE MEMBER_NAME LIKE '진_';
   WHERE MEMBER_NAME LIKE '진%';

    아이돌멤버 테이블
    ---------------------------------------------
    
    > 본명이 박씨인 멤버들만 조회
       SELECT * FROM idol_member
       WHERE REAL_NAME LIKE '박%';

    > 본명이 '김ㅇ준'인 멤버 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '김_준';

    > 본명이 '~ 사나'인 멤버 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '%사나';

    > 박씨 성을 제외한 멤버들만 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME NOT LIKE '박%';  

    > 본명에 '나'자가 들어간 멤버를 조회
        SELECT * FROM idol_member
        WHERE REAL_NAME LIKE '%나%';

    ---------------------------------------------


5. 정규식(regex)을 이용한 패턴 연산
   : 검색 패턴 기호를 사용하여 원하는 특정한 패턴을 찾거나 
     변환 및 특정한 패턴에 부합하는지 유효성 검증을 위해 사용

   https://ko.wikipedia.org/
   https://regexr.com/
   https://regexlib.com/
   https://regexone.com/
   http://zvon.org/comp/r/tut-Regexp.html#Pages~Contents


    [Groups and ranges]
    |	또는
    ()	그룹
    []	문자셋, 괄호안의 어떤 문자든
    [^]	부정 문자셋, 괄호안의 어떤 문가 아닐때
    (?:)	찾지만 기억하지는 않음

    
    [Quantifiers]
    ?	없거나 있거나 (zero or one)
    *	없거나 있거나 많거나 (zero or more)
    +	하나 또는 많이 (one or more)
    {n}	n번 반복
    {min,}	최소
    {min,max}	최소, 그리고 최대


    [Boundary-type]
    \b	단어 경계
    \B	단어 경계가 아님
    ^	문장의 시작
    $	문장의 끝


    [Character classes]
    \	특수 문자가 아닌 문자
    .	어떤 글자 (줄바꿈 문자 제외)
    \d	digit 숫자
    \D	digit 숫자 아님
    \w	word 문자
    \W	word 문자 아님
    \s	space 공백
    \S	space 공백 아님

--SAMPLE DATA------------------------------------------------------

동해물과 백두산이 마르고 닳도록

Hi there, Nice to meet you. And Hello there and hi.
I love grey(gray) color not a gry, graay and graaay. grdy
Ya ya YaYaYa Ya

사전
[1] 가
[2] 나
[3] 다

abcdefghijklmnopqrstuvwxyz
ABSCEFGHIJKLMNOPQRSTUVWZYZ
1234567890

.[]{}()\^$|?*+

010-898-0893
010 898 0893
010.898.8933
010-405-3412
02-878-8888
070-4444-1111

/*
* [a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z0-9]+
*/

call1212@narospace.com
call121233@gmail.com
hello@live.co.kr


/*
*(https?:\/\/)?(www.)?youtu.be\/([a-zA-Z0-9-]{11})
*
* (?:https?:\/\/)?(www.)?youtu.be\/([a-zA-Z0-9-]{11})
*/

http://www.youtu.be/-ZClicWm0zM
https://www.youtu.be/-ZClicWm0zM
https://youtu.be/-ZClicWm0zM
youtu.be/-ZClicWm0zM



> 한글 검색 :



> 전화번호 패턴 검색 :
    


> email 패턴 검색 :
    


> 유튜브주소로부터 비디오 ID 추출 :
    


---------------------------------------------------------------

> lecture.member 테이블에서 유효하지 않은 번호(PHONE)만 조회


    
---------------------------------------------------------------


