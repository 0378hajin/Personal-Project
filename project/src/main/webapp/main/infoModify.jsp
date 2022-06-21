<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<script>
function check() {
	var fm = document.frm
	
	if(fm.nickname.value == ""){
		alert("바꾸실 닉네임을 입력해주세요.");
		fm.nickname.focus();
		return;
	} else if (fm.email.value == "") {
		alert("바꾸실 이메일을 입력해주세요.");
		fm.email.focus();
		return;
	}
	
	fm.action = "";
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
	font-size : 37px;
	font-family : Arial;
	text-align : center;
}
#td {
	width : 300px;
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
#close:active {
	background : #627062;
	 
}
input[type=text],input[type=email]{
	width : 280px;
	height : 48px;
	font-size : 25px;
}
</style>
</head>
<body bgcolor="#EAE6DA">
<form name = "frm" action = "" method = "post">
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
<strong class = "font">내정보</strong>
<hr>
<table border = "0" style = "margin : auto;">
<tr>
	<td>&nbsp;</td>
	<td id = "td"></td>
</tr>

<tr>
	<td>아이디 : </td>
	<td id = "td">test</td>	
</tr>

<tr>
	<td>&nbsp;</td>
	<td id = "td"></td>
</tr>

<tr>
	<td>닉네임 : </td>
	<td id = "td"><input type = "text" name = "nickname" value = ""></td>	
</tr>

<tr>
	<td>&nbsp;</td>
	<td id = "td"></td>
</tr>

<tr>
	<td>가입 날짜 : </td>
	<td id = "td">2022-05-17</td>	
</tr>

<tr>
	<td>&nbsp;</td>
	<td id = "td"></td>
</tr>

<tr>
	<td>이메일 : </td>
	<td id = "td"><input type = "email" name = "email" value = ""></td>	
</tr>

<tr>
	<td>&nbsp;</td>
	<td id = "td"></td>
</tr>

</table>
<input type="button" name = "btn" value="확인" onclick= "check();" id = "close"> 
&nbsp;
&nbsp;
<input type="button" name = "btn2" value="닫기" onclick= "window.close();" id = "close"> 
</div>
</form>
</body>
</html>