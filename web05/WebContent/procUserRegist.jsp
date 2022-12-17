<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.WebUser, java.util.List" %>
<jsp:useBean id="userController" class="controller.UserController" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 받는부분</title>
</head>
<body>
<%
   //- POST 한글 깨짐현상 처리 ----------------------------------
   request.setCharacterEncoding("UTF-8");
   //-------------------------------------------------------

   String web_id = request.getParameter("web_id"); // 아이디
   String web_pwd = request.getParameter("web_pwd"); // 비밀번호 
   String web_name = request.getParameter("web_name"); // 이름
   
   String web_cel1 = request.getParameter("web_cel1"); // 전화번호1 
   String web_cel2 = request.getParameter("web_cel2"); // 전화번호2
   String web_cel3 = request.getParameter("web_cel3"); // 전화번호3 
   String web_email_id = request.getParameter("web_email_id"); // 이메일아이디 
   String web_email_addr = request.getParameter("web_email_addr"); // 이메일 address 
   
   String web_introduce = request.getParameter("web_introduce"); // 자기소개 
   
   //-- 1. WebUser 객체에 회원 데이터를 저장 
   WebUser user = new WebUser(); 
   user.setWebId(web_id);
   user.setWebPwd(web_pwd); 
   user.setWebName(web_name);
   user.setWebIntroduce(web_introduce);
   
   String web_cel = web_cel1 + "-" + web_cel2 + "-" + web_cel3; // 전화번호 조합 
   String web_email = web_email_id + "@" + web_email_addr; // 이메일 조합 
   
   user.setWebCel(web_cel);
   user.setWebEmail(web_email); 
   
   //-- 2. 메모리에 회원 데이터 저장 
   userController.addUser(user);
   
   //--3. 회원가입 완료페이지(회원가입목록 보기)로 이동
   response.sendRedirect("SuccRegist.jsp");
%>
	 <h1>환영합니다!!</h1>
	 <p>아이디 : <%=user.getWebId() %></p>
	 <p>패스워드 : <%=user.getWebPwd() %></p>
	 <p>이름 : <%=user.getWebName() %></p>
	 <p>전화번호 : <%=user.getWebCel() %>
	 </p>
	 <p> 이메일 주소 : <%=user.getWebEmail() %></p>
	 <p><%=user.getWebIntroduce() %></p>
     
     <h1>가입회원목록</h1>
<%
    List<WebUser> resultList = userController.getUserListAll();
	int number = 1; 	

	// for( int i = 0; i < resultList.size(); i++) { ((WebUser)resultList.get(i)).getWebName()}
	for(WebUser dbUser : resultList) {
%>     
	   <p><%=number++ %> | <%=dbUser.getWebName()%> (<%=dbUser.getWebId() %>)</p>
<%
	} 
%>
     
      
</body>
</html>