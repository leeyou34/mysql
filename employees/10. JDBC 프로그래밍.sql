
1. 쿼리(SQL)실행 도구 즉, DB Client 프로그램의 역할
   
   > 연결/인증
   > 문장실행
   > 결과패치

2. 애플리케이션(서비스)의 역할

   > 고객은 쿼리를 알지도 알 필요도 없다.
   > 고객은 UI를 통해 회원정보의 목록조회/등록/검색 등을 실행한다.
   > 각 실행 단계의 코드를 통해서 쿼리(SQL)문이 작성된다.
   > 작성된 쿼리(SQL)는 데이터베이스 서버로부터 연결/인증,
     문장실행, 결과패치를 한다.    
   > 해당 결과를 UI(고객)에게 전달한다.

   프로그래머는 사용자의 요구에 부응하는 쿼리를 만들어주고 그것을
   실행할 수 있도록 해준다.

   이때 필요한 것은 코드에서 데이터를 수용할 수 있게 해주는 
   라이브러리(DB API)가 필요하게 되는데 서로다른 DBMS에 대해 연결/인증
   쿼리실행, 결과패치 등을 하기 위해서 해당 DBMS의 드라이버와 JDBC를 
   이용한다. 


   ---------
   JDBC API
   (Java Database Connectivity)         
   - Connection  
   - Statement
   - ResultSet
   _________________

             <------>
                      --------
                      JDBC 드라이버
                      Connector/J 8.0.26
                      __________________

                                       <--->
                                            ------------
                                             MySQL DBMS  
                                            ____________


3. MySQL JDBC 드라이버 설정

   > C:\Program Files (x86)\MySQL\Connector J 8.0
     [mysql-connector-java-8.0.26.jar] 파일 확인

   > 이클립스 실행
   > 해당 프로젝트 오른버튼
     [Build Path] -> [Configure Build Path] -> [Libraries]탭 
     [Add External JARs...] 버튼 클릭
     

4. JDBC 프로그래밍 순서

   1) 드라이버 로드하기
      Class.forName("com.mysql.jdbc.Driver");

   2) 연결 생성하기
      Connection conn = DriverManager.getConnection(URL, ID, PW);

   3) 쿼리문장 실행하기
      Statement stmt  = conn.createStatement();
      
   4) 결과집합 사용하기
      ResultSet rs = stmt.executeQuery(sql);

    > 4개의 객체 모두 어떠한 것도 new 연사자로 객체생성한 것이 아니다 !!
        1) ~ 4) 까지 순차적으로 객체가 생성되어야 실행이 가능하다.

    > 서버에서는 전달받은 쿼리를 실행하여 결과집합을 만든다.
        -> BOF(Before of File)
            ------------------
            ------------------
            ----- 레코드 -----
            ------------------      
            ------------------    
        -> EOF(End of File)

    > 클라이언트는 결과집합을 한꺼번에 받는게 아니라 레코드
        단위로 하나씩 받는다.

    > ResultSet 객체가 생성됐다는 것은 결과집합을 받은것이 아니라
        이를 커서(CURSOR)를 통해 이용할 수 있는 상태가 된 것이다.
     
   5) rs.next();
      커서 이동

   6) String title = rs.getString("title");
      해당 레코드로부터 "title" 값을 얻는다.

