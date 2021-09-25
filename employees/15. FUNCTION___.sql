
--------------
함수()의 필요성

테이블 데이터는 구조적인 틀안에 격자형으로 표현된다.
이 구조에서는 ROW만 또는 COLUMN만 필터링 가능하다.

이름은 몇 자인가? 
성은 제외하고 이름만 어떻게 되는가?
이름에 빈 공백을 제거하고 출력하려면?
.... ?
________________________________________________





1. 문자열 함수

   ■ SUBSTR('문자열', 시작위치, 길이)
        ----------------------------------------------------
   
        SELECT  substr('HELLO', 1, 3);
        SELECT  substr('HELLO', 3);

        SELECT  substr(GROUP_NAME, 2) 
        FROM idol_member;
        ---------------------------------------------------

    > 모든 아이돌멤버의 이름과 출생 월만 조회하시오
        ---------------------------------------------------
        1. select REAL_NAME, BIRTHDAY from idol_member
            where REAL_NAME != '';

        2. select Real_name, substr(Birthday, 5, 2) from idol_member
            where Real_name != '';

        3. select substr(REAL_name,1,4) Real_Name, substr(BIRTHDAY, 5,2) from idol_member
           where real_name!='';
        ---------------------------------------------------

    > 아이돌그룹 중 'JYP'로 시작하는 모든 그룹정보를 출력하시오
        ----------------------------------------------------
        1. select * from idol_group
           where COMPANY like 'JYP%';

        2. select * from idol_group
           where COMPANY REGEXP '[JYP]';

        3. select *, substr(company,1) COMPANY from lecture.idol_group
           where company like 'JYP%';

        ----------------------------------------------------

    > 모든 아이돌멤버의 나이를 출력하시오
        ----------------------------------------------------
        select *, 2021-(substr(BIRTHDAY,1,4))age from idol_member
        where Real_NAME !='';

        ----------------------------------------------------    

   ■ CONCAT()    문자열 이어주기
     CONCAT_WS() 구분자와 함께 문자열 이어주기
        ----------------------------------------------------
        SELECT CONCAT('My', 'S', 'QL', ' JAVA211');
        SELECT CONCAT('A', "B", "CDE", 'F');
        SELECT CONCAT('A', "B", NULL, 'F');
        SELECT CONCAT_WS('-','2021','01','20');
        ----------------------------------------------------

    > 모든 아이돌그룹에 대하여 'BTS♥boys'의 형식과 같이 출력하시오
        ----------------------------------------------------
        select *, concat('BTS', '♥boys')Print from idol_member
        where group_name !='';

        ----------------------------------------------------

   ■ TRIM() 문자열 공백제거 함수
       ----------------------------------------------------
        SELECT      '         Hello                     '  result1;
        SELECT trim('         Hello                     ') result2;
       ----------------------------------------------------

   ■ LOWER() / UPPER()
       ----------------------------------------------------
        SELECT lower('HELLO');
        SELECT upper('WOrlD');
       ----------------------------------------------------   

   ■ REPLACE('문자열', '찾는 문자열', '대치할 문자열')
       ----------------------------------------------------
        SELECT replace('HELLO WORLD', 'HELLO', 'HI~') AS RESULT;
       ----------------------------------------------------      

    > 아이돌 그룹에서 회사명 '~ 엔터테인먼트'를 '~ ENTERTAINMENT'로
      출력하시오
       ----------------------------------------------------
        select *, replace(COMPANY, '엔터테인먼트', 'ENTERTAINMENT') COMPANY from idol_group;

       ----------------------------------------------------

   ■ 문자열 패딩 함수() LPAD()/RPAD()
       ----------------------------------------------------
        SELECT lpad('12345', 10, '0') AS RESULT;
        SELECT rpad('12345', 10, '0') AS RESULT;
        SELECT LPAD('AB',4,'CD') AS RESULT;
        SELECT RPAD('AB',4,'CD') AS RESULT;
       ----------------------------------------------------   

   ■ INSTR(문자열, 검색문자열) 위치 반환
        ----------------------------------------------------
         SELECT INSTR('foobarbar', 'bar');
         SELECT INSTR('xbar', 'foobar');   
        ----------------------------------------------------   



2. 숫자함수

        ----------------------------------------------------

         SELECT ABS(-35);
         SELECT SIGN(-10); SELECT SIGN(0); SELECT SIGN(10);
         SELECT ROUND(3.141592); SELECT ROUND(3141.592);
         SELECT ROUND(3.141592, 2); 
         SELECT ROUND(3.141592, 4);   
         SELECT MOD(17, 5);
         SELECT POWER(2, 2);
         SELECT POWER(2, 8);
         SELECT SQRT(25);
         SELECT SQRT(5);

        ----------------------------------------------------


3. 날짜함수

        ----------------------------------------------------

         SELECT sysdate();              2021-09-08 19:15:00
         SELECT curdate();              2021-09-08
         SELECT current_date();         2021-09-08
         SELECT curtime();              19:17:23
         SELECT current_time();         19:16:09
         SELECT current_timestamp();    2021-09-08 19:16:22

         SELECT date_format(NOW(), '%Y년 %m월 %d일 %H시 %i분 %S초');
            %i	Minutes, numeric (00..59)
            %j	Day of year (001..366)
            %k	Hour (0..23)
            %l	Hour (1..12)
            %M	Month name (January..December)
            %m	Month, numeric (00..12)
            %p	AM or PM
            %r	Time, 12-hour (hh:mm:ss followed by AM or PM)
            %S	Seconds (00..59)
            %s	Seconds (00..59)
            %T	Time, 24-hour (hh:mm:ss)
            %U	Week (00..53), where Sunday is the first day of the week; WEEK() mode 0
            %u	Week (00..53), where Monday is the first day of the week; WEEK() mode 1
            %V	Week (01..53), where Sunday is the first day of the week; WEEK() mode 2; used with %X
            %v	Week (01..53), where Monday is the first day of the week; WEEK() mode 3; used with %x
            %W	Weekday name (Sunday..Saturday)
            %w	Day of the week (0=Sunday..6=Saturday)
            %X	Year for the week where Sunday is the first day of the week, numeric, four digits; used with %V
            %x	Year for the week, where Monday is the first day of the week, numeric, four digits; used with %v
            %Y	Year, numeric, four digits
            %y	Year, numeric (two digits)
            %%	A literal % character
            %x	x, for any “x” not listed above

         SELECT YEAR(sysdate());
         SELECT MONTH(sysdate());
         SELECT DAY(sysdate()); 
         SELECT HOUR(sysdate());
         SELECT MINUTE(sysdate()); 
         SELECT SECOND(sysdate()); 

        ----------------------------------------------------
    
    > 아이돌멤버 중에서 생일이 지나지 않은 멤버를 모두 출력하시오
        ----------------------------------------------------
        select *, BIRTHDAY
        from idol_member
        where real_name !='';


        ----------------------------------------------------



4. 변환함수(CAST/CONVERT)
   : INSERT, UPDATE 로 컬럼에 값을 넣어야 하는 경우 설정한 데이터 타입으로 형변환 

        ----------------------------------------------------

         SELECT CAST(NOW() AS SIGNED);
         SELECT CAST(NOW() AS YEAR);
         SELECT CAST(NOW() AS DATE);
         SELECT CAST(NOW() AS TIME);
         SELECT CAST('20210915' AS DATE);

         SELECT CONVERT(NOW(), SIGNED);
         SELECT CONVERT(NOW(), DATE);
         SELECT CONVERT('20210915', SIGNED);

         SELECT CAST('12.34' AS UNSIGNED INTEGER);
         SELECT CAST(1234 AS CHAR(10));

         BINARY
         CHAR
         INTEGER
         DECIMAL
         DATE
         DATETIME
         SIGNED
         UNSIGNED

         SELECT BINARY 'A'='B';
         SELECT BINARY 'A'='A'; 

         SELECT CONVERT('A', BINARY);
         SELECT CONV(3, 10, 2);
         SELECT CONV(11, 10, 16);
         

         SELECT FORMAT(123456789, 0);
         SELECT FORMAT(123456789, 2);

        ----------------------------------------------------   


5. NULL 관련 함수
   : 컬럼 값이 NULL 인지 아닌지 확인 필요

        ----------------------------------------------------
         SELECT NULL + 3;
        ----------------------------------------------------

    > 멤버테이블에서 전화번호(PHONE)가 NULL 인 레코드를 추출하시오 
        ----------------------------------------------------
         SELECT * FROM MEMBER
         WHERE PHONE IS NULL;
        ----------------------------------------------------   
    
    > 멤버테이블에서 전화번호(PHONE)가 NULL 이면 '9999-99-99'로 출력하시오 
        ----------------------------------------------------




        ----------------------------------------------------


