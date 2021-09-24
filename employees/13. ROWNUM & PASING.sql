
-----------------
--[MySQL]에서 Oracle처럼 ROWNUM 을 
--사용하여 번호매기기
_______________________________

> SET 구문을 사용하여 ROWNUM 값을 초기화 후 조회
    ---------------------------------------------
    
    SET @rownum:=0;
    SELECT
    @rownum:=@rownum+1 AS `NUM`, tbl.*
    FROM lecture.idol_member tbl;

    ---------------------------------------------

> WHERE 절에서 초기화
    ---------------------------------------------
    
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
      --WHERE (@rownum:=0)=0; 초기화 하지 않은 경우

    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    WHERE (@rownum:=0)=0;

    ---------------------------------------------

> 페이징(Paging) 처리(행 제한하기)
    ---------------------------------------------

    SET @rownum:=0;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 0, 5;

    SET @rownum:=5;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 5, 5;

    SET @rownum:=10;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 10, 5;

    SET @rownum:=15;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 15, 5;

    SET @rownum:=20;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 20, 5;

    SET @rownum:=25;
    SELECT
        @rownum:=@rownum+1 AS `NUM`, 
        tbl.*
    FROM lecture.idol_member tbl
    limit 25, 5;
    
    ---------------------------------------------