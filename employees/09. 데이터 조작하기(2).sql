
DML(Data Manipulation Language)
: 검색/등록/삭제/갱신을 위한 데이터베이스 언어


[Member Table] 실습------------------------------------------


[UPDATE] 갱신

    1. 단일컬럼(패스워드) 수정하기

         UPDATE member SET PWD = '2222';
 
         15:02:58	UPDATE member SET PWD = '2222'	
                    2 row(s) affected Rows matched: 2  
                    Changed: 2  Warnings: 0	0.016 sec
        
        * 모든 유저의 패스워드 변경되는 문제
          반드시 WHERE 절이 필요!!!

          UPDATE member
          SET  `PWD` = '1111'
          WHERE `ID` = 'lim02';



    2. 여러컬럼 수정하기

          UPDATE member
          SET  `PWD`    = '5678',
               `NAME`   = '임꺽정',
               `GENDER` = '남'
          WHERE `ID` = 'lim02';



[DELETE] 삭제
    
    1. 레코드 추가

         INSERT INTO lecture.member(
            `ID`, 
            `PWD`
         ) VALUES(
	       'java222', 
            '5555'
         );
    
    
    2. 삭제하기

         DELETE FROM lecture.member
         WHERE `ID` = 'java222';



----------------------------------------------------------------