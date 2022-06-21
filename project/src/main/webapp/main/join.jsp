<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
function check() {
	var fm = document.frm;
	
	if(fm.id.value == ""){
		alert("아이디를 입력해주세요.");
		fm.id.focus();
		return;
	} else if (fm.password.value == "") {
		alert("비밀번호를 입력해주세요.");
		fm.password.focus();
		return;
	} else if (fm.passwordconfirm.value == "") {
		alert("비밀번호 확인을 입력해주세요.")
		fm.passwordconfirm.focus();
		return;
	} else if (fm.password.value != fm.passwordconfirm.value){
		alert("비밀번호가 일치하지 않습니다.")
		fm.password.focus();
		return;
	} else if (fm.nickname.value == "") {
		alert("닉네임을 입력해주세요.")
		fm.nickname.focus();
		return;
	} else if (fm.email.value == "") {
		alert("이메일을 입력해주세요.")
		fm.email.focus();
		return;
	}
	
	fm.action = "<%=request.getContextPath()%>/main/joinAction.do";
	fm.method = "post";
	fm.submit();
}
</script>
<style>
#tab {
	width : 100%;
	height : 50px;
}
#trd {
	height : 70px;
	text-align : center;
	font-family : Arial;	
}

.font {
	text-decoration : none;
	color : black;
	font-size : 37px;
	font-family : Arial;
	text-align : center;
}
tr {
	text-decoration : none;
	color : black;
	font-size : 15px;
	font-family : Arial;
	text-align : center;
}
td {
	text-align : left;
}
#td {
	width : 300px;
}
#close:active {
	background : #627062;
	 
}
.line {
	border-bottom : 1px solid gray;
}
hr {
	color : #627062; /*IE*/
	border-color : #627062; /*사파리*/
	background-color : #627062 /*크롬, 모질라 등 기타 브라우저*/ 
}
.info {
	display : inline-block;
 	border : 1px solid #CFC9C1;
	background : #CFC9C1; 
	width : 50%;
	height: auto;
	position : absolute;
	left : 25%;
}
#close {
	background: #738A76;
	width : 10%; 
	height : 50px;	
	font-size : 20px;
	border : 1px solid black;
	
}
input[type=text],input[type=password],input[type=email]{
	width : 350px;
	height : 27px;
	font-size : 15px;
}
</style>
</head>
<body bgcolor="#EAE6DA">
<form name = "frm" action = "./memberJoin.jsp" method = "post">
<div style = "width :  100%; height : 20%; ">
<table id = "tab">
<tr id = "trd">
<td id = "trd"></td>
<td id = "trd" style = "font-size : 230%">쿨엔존</td>
<td id = "trd"></td>
</tr>
</table>
<hr>
</div>
<div class  = "info" style = "text-align : center;">
<strong class = "font">회원가입</strong>
<hr>
<table border = "0" style = "margin : auto;">
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>아이디</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td id = "td"><input type = "text" name = "id" value = "" style = "border-radius : 10px; border : 1px solid gray"></td>	
</tr>


<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>비밀번호</td>
</tr>

<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td id = "td"><input type = "password" name = "password" value = "" style = "border-radius : 10px; border : 1px solid gray"></td>	
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
<tr>
	<td>비밀번호 확인</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td id = "td"><input type = "password" name = "passwordconfirm" value = "" style = "border-radius : 10px; border : 1px solid gray"></td>	
</tr>

<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>닉네임</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td id = "td"><input type = "text" name = "nickname" value = "" style = "border-radius : 10px; border : 1px solid gray"></td>	
</tr>

<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>이메일 (아이디, 비밀번호 찾기에 활용됩니다.)</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td id = "td"><input type = "email" name = "email" value = "" style = "border-radius : 10px; border : 1px solid gray"></td>	
</tr>

<tr>
	<td>&nbsp;</td>
</tr>
</table>
<input type="button" name = "btn" value= "가입하기" onclick= "check();" id = "close" style = "width : 35%; height : 50px;"> 
</div>
</form>
</body>
</html>