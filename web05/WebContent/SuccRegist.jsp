<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="vo.WebUser, java.util.List" %>
<jsp:useBean id="uc" class="controller.UserController"></jsp:useBean>
<%-- 
회원가입 완료 후, 동작하는(들어오는)페이지로서 가입된 회원의 목록 표시
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
	<td>번호</td>
	<td>아이디</td>
	<td>이름</td>
	<td>전화번호</td>
	<td>이메일</td>
	</tr>
	<!-- 헤더 -->
	<!-- 컨텐츠 -->
	<%
	//-- 메모리에서 Repository 참조값 부르기.
	List<WebUser> userList=uc.getUserListAll();
	//-- 향상된 for문 말고, 일반 for문 사용(얼마나 불편한가...)
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
	<!--  //컨텐츠 -->
	</table>
	
</body>
</html>