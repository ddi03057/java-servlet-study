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
	//1. Class.forName() ����̹��ε�
	Class.forName("com.mysql.cj.jdbc.Driver");


	//2. DB����
	Connection conn = DriverManager.getConnection("jdbc:mysql://43.200.187.8/web06_db?user=root&password=12345");
	
	//3. sql�� ����
	String user_name = request.getParameter("user_name");
	String user_pwd = request.getParameter("user_pwd");
	String sql_format = "SELECT * FROM web06_user WHERE user_name = '%s' and user_pwd = '%s";
	
	//sql = "INSERT INTO web06_user (user_name, user_pwd)" + " VALUES ('"+user_name + "','" + user_pwd + "')";
	
	String sql=String.format(sql_format, user_name, user_pwd);
	sql = "SELECT * FROM web06_user WHERE user_name = " + user_name;
	
	//4.���� ����
	Statement stmt=conn.createStatement();
	ResultSet rows=stmt.executeQuery(sql);
	
	if(rows.next()){ //-- row�� �ϳ��� ���� ��22
		
		do{
			String db_pwd=rows.getString("user_pwd");
			if(db_pwd.equals(user_pwd)){ //-- ��й�ȣ ���Ͻ�
				%>
				<script type="text/javascript">
				alert("�α��� �ߴ�")
				location.href="http://daum.net";
				</script>
				<% 
			} else{ //-- ��� Ʋ����
				%>
				<script>
				alert("���̵� ��� Ʋ��");
				history.back();
				</script>
				<%
			}
			
		}while(rows.next());
	
	}else{ //-- row����(��ġ�ϴ� ȸ�� ���̵� ���� ���)
		%>
		<script type="text/javascript">
		alert("'<%=user_name%>'�̶�� ȸ�� �����ϴ�");
		history.back();
		</script>
		<%
	}
	
	
	stmt.close();
	
	//5. db Ŀ�ؼǲ���
	conn.close();
%>


</body>
</html>