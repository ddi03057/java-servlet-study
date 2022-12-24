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
	String sql_format = "SELECT * FROM web06_user WHERE user_name = '%s' and user_pwd = '%s";
	
	//sql = "INSERT INTO web06_user (user_name, user_pwd)" + " VALUES ('"+user_name + "','" + user_pwd + "')";
	
	String sql=String.format(sql_format, user_name, user_pwd);
	sql = "SELECT * FROM web06_user WHERE user_name = " + user_name;
	
	//4.쿼리 실행
	Statement stmt=conn.createStatement();
	ResultSet rows=stmt.executeQuery(sql);
	
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
	
	
	stmt.close();
	
	//5. db 커넥션끊기
	conn.close();
%>


</body>
</html>