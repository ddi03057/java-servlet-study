<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="vo.WebUser, java.util.List" %>
<jsp:useBean id="uc" class="controller.UserController"></jsp:useBean>
<%-- 
ȸ������ �Ϸ� ��, �����ϴ�(������)�������μ� ���Ե� ȸ���� ��� ǥ��
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
table, tr, td{
border:1px solid black;
}
</style>
</head>
<body>
	
	<table width="100%;">
	<tr>
	<td>��ȣ</td>
	<td>���̵�</td>
	<td>�̸�</td>
	<td>��ȭ��ȣ</td>
	<td>�̸���</td>
	</tr>
	<!-- ��� -->
	<!-- ������ -->
	<%
	//-- �޸𸮿��� Repository ������ �θ���.
	List<WebUser> userList=uc.getUserListAll();
	//-- ���� for�� ����, �Ϲ� for�� ���(�󸶳� �����Ѱ�...)
	for(int i=0; i<userList.size(); i++){
		WebUser tmpUser=userList.get(i);
	
	%>
	<tr>
	<td><%=++i %></td>
	<td><%=tmpUser.getWebId() %></td>
	<td><%=tmpUser.getWebName() %></td>
	<td><%=tmpUser.getWebCel() %></td>
	<td><%=tmpUser.getWebEmail() %></td>
	</tr>
	<%
	}
	%>
	<!--  //������ -->
	</table>
	
</body>
</html>