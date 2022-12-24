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
	//1. mysql 드라이버로딩
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =null;
	
	//2. 연결
	try{
		
		out.println("1. 연결시도<br/>");
		conn = DriverManager.getConnection(
				"jdbc:mysql://43.200.187.8/web06_db?user=root&password=12345"
				//"jdbc:mysql://주소:port/접속데이터베이스명?user=아이디&password=패스워드" //Connection String(연결 문자열)
				);
		
		out.println("2. 로직실행<br/>");
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM web06_user";
		
		//-- ResultSet(결과세트) : 데이터가 엑셀 형태로 메모리에 로딩
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){ // 현재포지션에서 다음 포지션에 값이 있는지 물어보는 것
			out.println(rs.getString(1) + " "); //-- index로 가져오는법:1부터 시작
			out.println(rs.getString("user_name") + " "); //-- column명으로 가져오는법
			out.println(rs.getString(3) + " "); 
			out.println(rs.getString("insertDate") + "<br/>"); 
			out.println("----------------------------------<br/>");
		}
		
		
		//-- 수정
		
		//--userName 컬럼이 2인것
		sql="UPDATE web06_user SET user_name = 'angel' where user_no=2";
		
		//--실행
		int affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>update에 영향받은 row 수: "+ affected_rows);
		//-- 데이터 insert
		sql="INSERT INTO web06_user (user_no,user_name,user_pwd)";
		sql +=" values(4,'lodossw','12121')";
		
		affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>INSERT row 수 : "+affected_rows);
		
		//-- 데이터 삭제
		sql="DELETE FROM web06_user WHERE user_name = 'killer'";
		affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>DELETE row 수 : "+affected_rows);
		stmt.close();
	}catch(Exception ex){
		
		out.println("예외가 발생<br/>");
		out.println(ex.getMessage());
		out.println(ex.getStackTrace().toString());
		
	}finally{ // 해당 메소드는 한 번은 실행됨
		
		out.println("<br/>3. 연결 해제<br/>");
		if(conn !=null) conn.close();
		
	}
%>
</body>
</html>