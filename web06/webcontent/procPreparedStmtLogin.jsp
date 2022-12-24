<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


<%
	//1. Class.forName() 드라이버로딩
	Class.forName("com.mysql.cj.jdbc.Driver");


	//2. DB연결
	Connection conn = DriverManager.getConnection("jdbc:mysql://43.200.187.8/web06_db?user=root&password=12345");
	
	//3. sql문 조합
	String user_name = request.getParameter("user_name");
	String user_pwd = request.getParameter("user_pwd");
	
	//4. PrepareStatement 작업
	String sql="SELECT * FROM web06_user WHERE user_name=?";
	PreparedStatement pstmt =conn.prepareStatement(sql);
	pstmt.setString(1,user_name);
	ResultSet rows = pstmt.executeQuery();


	if(rows.next()){ //-- row가 하나라도 있을 때22
		
		do{
			String db_pwd=rows.getString("user_pwd");
			if(db_pwd.equals(user_pwd)){ //-- 비밀번호 동일시
				%>
				<script type="text/javascript">
				alert("로그인 했다")
				location.href="http://daum.net";
				</script>
				<% 
			} else{ //-- 비번 틀릴시
				%>
				<script>
				alert("아이디나 비번 틀림");
				history.back();
				</script>
				<%
			}
			
		}while(rows.next());
	
	}else{ //-- row없음(일치하는 회원 아이디가 없는 경우)
		%>
		<script type="text/javascript">
		alert("'<%=user_name%>'이라는 회원 없습니다");
		history.back();
		</script>
		<%
	}
	
	pstmt.close();//stmt.close는 로직 중간에 넣었지만 이거는 prepared statement닫기 위해 로직끝나는대 실행
	
	//5. db 커넥션끊기
	conn.close();
%>


</body>
</html>