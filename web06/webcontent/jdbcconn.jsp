<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="jdbcexam.JDBCConnect" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	JDBCConnect jdbc = new JDBCConnect();
	Connection conn = jdbc.getConnection();
%>

</body>
</html>