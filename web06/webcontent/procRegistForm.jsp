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
	String sql_format = "INSERT INTO web06_user (user_name, user_pwd)" + " VALUES ('%s','%s')";
	
	//sql = "INSERT INTO web06_user (user_name, user_pwd)" + " VALUES ('"+user_name + "','" + user_pwd + "')";
	
	String sql=String.format(sql_format, user_name,user_pwd);
	
	//4.쿼리 실행
	Statement stmt=conn.createStatement();
	int affected_rows=stmt.executeUpdate(sql);
	stmt.close();
	
	//5. db 커넥션끊기
	conn.close();
%>
<script type="text/javascript">
	alert('저장 완료');
	location.href='registForm.jsp';
</script>

</body>
</html>