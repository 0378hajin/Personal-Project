<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
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
<strong class = "font">비밀번호 찾기</strong>
<hr>
<table border = "0" style = "margin : auto;">
<tr>
	<td>&nbsp;</td>
</tr>

<tr>
	<td>일치하는 회원정보가 없습니다.</td>
</tr>

<tr>
	<td>&nbsp;</td>
</tr>

</table>

<input type="button" name = "btn2" value="닫기" onclick= "location.href = '<%=request.getContextPath()%>/main/main.do'" id = "close">
</div>
</form>
</body>
</html>