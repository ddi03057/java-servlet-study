<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
</head>
<body>
<!-- 
     아이디 input type="text"
     패스워드 input type="password"
     이름 input type="text" 
     전화번호 select - text - text 
     이메일주소 text @ select 
     자기소개 textarea
 -->
 
 <h2>회원가입</h2>
 
 <!--  POST 방식은 URL에 파라미터 값이 노출되지 않는다.  -->
 <!--  mothod="GET", method="POST" -->
 <form method="POST"name="regForm" action="procUserRegist.jsp"
  onsubmit="return sendDataCheckForSubmit();">
 
	 <p>+ 아이디 : <input type="text" name="web_id" value=""></p>
	 <p>+ 패스워드 : <input type="password" name="web_pwd" value="" /></p>
	 <p>+ 이름 : <input type="text" name="web_name" value="" /></p>
	 <p>전화번호 : 
	 			 <select name="web_cel1">
	 			 	<option value="010">010</option>
	 			 	<option value="017">011</option>
	 			 	<option value="017">016</option>
	 			 	<option value="017">017</option>
	 			 	<option value="017">018</option>
	 			 </select>
	 			 - 
	 			 <input type="text" name="web_cel2" value="" />
	 			 - 
	 			 <input type="text" name="web_cel3" value="" />
	 </p>
	 <p>+ 이메일 주소 : 
	 			 <input type="text" name="web_email_id" value="" /> @ 
	 			 <select name="web_email_addr">
	 			   <option value="naver.com">naver.com</option>
	 			   <option value="kakao.com">kakao.com</option>
	 			   <option value="-1">직접입력</option>
	 			 </select>
	 				 
	 </p>
	 <p> 
	   <textarea name="web_introduce"></textarea>
	 </p>
	 
	 <p> 
	   <!-- html4 방식  -->
	   <!-- button은 눌렀을때 서버에 데이터를 전송하지 않습니다. -->
	   <!-- <input type="button" value="버튼">  -->
	   
	   <!-- submit/image 은 눌렀을때 서버에 데이터를 전송합니다. -->
	   <!-- <input type="submit" value="서브밋">  -->
	   <!-- input type="image" = "submit" -->
	   <!-- <input type="image" 
	   	src="https://i.ytimg.com/vi/4f3mux0q7oY/maxresdefault.jpg"  
	    style="width:60px;height:60px;"
	   /> -->
	   
	   <!-- html5 -->
	   <button>회원가입</button><!-- input type=submit -->
	   <!--  <button type="button">눌러줘2</button>--> <!-- input type=button -->
	   
	 </p>
	 
 </form>
 
 <script type="text/javascript">
 //자바스크립트
 //console.log(document.getElementsByName("regForm"));
// console.log(document.regForm);
//alert(document.regForm.web_id.value);

	function sendDataButton(){
		if(sendDataCheckForsubmit()){
			document.regform.submit();
		}
		//document.regForm.submit();
	}
//--input type="submit",button 사용 시
	function sendDataCheckForSubmit(){
		// 아디, 비번, 이름, 이메을은 반드시 받아야 한다
		// 공백 제거용 메서드 : trim()

		if(document.regForm.web_id.value.trim()== ""){
			alert("아이디는 필수 값");
			document.regForm.web_id.focus();
			return false;
		}

		if(document.regForm.web_pwd.value.trim()== ""){
			alert("비밀번호는 필수 값");
			document.regForm.web_pwd.focus();
			return false;
		}
		
		// 비밀번호는 5자 이상이어야만함
		if(document.regForm.web_pwd.value.trim().length<5){
			alert("비밀번호는 5자 이상이어야 함");
			document.regForm.web_pwd.focus();
			return false;
		}
		
		if(document.regForm.web_name.value.trim()== ""){
			alert("이름은 필수 값");
			document.regForm.web_name.focus();
			return false;
		}
		
		if(document.regForm.web_email_id.value.trim()== ""){
			alert("이메일은 필수 값");
			document.regForm.web_name.focus();
			return false;
		}
		
				
		return true;
	}
	
</script>

</body>
</html>