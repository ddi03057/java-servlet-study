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
	//1. mysql ����̹��ε�
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn =null;
	
	//2. ����
	try{
		
		out.println("1. ����õ�<br/>");
		conn = DriverManager.getConnection(
				"jdbc:mysql://43.200.187.8/web06_db?user=root&password=12345"
				//"jdbc:mysql://�ּ�:port/���ӵ����ͺ��̽���?user=���̵�&password=�н�����" //Connection String(���� ���ڿ�)
				);
		
		out.println("2. ��������<br/>");
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT * FROM web06_user";
		
		//-- ResultSet(�����Ʈ) : �����Ͱ� ���� ���·� �޸𸮿� �ε�
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){ // ���������ǿ��� ���� �����ǿ� ���� �ִ��� ����� ��
			out.println(rs.getString(1) + " "); //-- index�� �������¹�:1���� ����
			out.println(rs.getString("user_name") + " "); //-- column������ �������¹�
			out.println(rs.getString(3) + " "); 
			out.println(rs.getString("insertDate") + "<br/>"); 
			out.println("----------------------------------<br/>");
		}
		
		
		//-- ����
		
		//--userName �÷��� 2�ΰ�
		sql="UPDATE web06_user SET user_name = 'angel' where user_no=2";
		
		//--����
		int affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>update�� ������� row ��: "+ affected_rows);
		//-- ������ insert
		sql="INSERT INTO web06_user (user_no,user_name,user_pwd)";
		sql +=" values(4,'lodossw','12121')";
		
		affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>INSERT row �� : "+affected_rows);
		
		//-- ������ ����
		sql="DELETE FROM web06_user WHERE user_name = 'killer'";
		affected_rows=stmt.executeUpdate(sql);
		out.println("<br/>DELETE row �� : "+affected_rows);
		stmt.close();
	}catch(Exception ex){
		
		out.println("���ܰ� �߻�<br/>");
		out.println(ex.getMessage());
		out.println(ex.getStackTrace().toString());
		
	}finally{ // �ش� �޼ҵ�� �� ���� �����
		
		out.println("<br/>3. ���� ����<br/>");
		if(conn !=null) conn.close();
		
	}
%>
</body>
</html>