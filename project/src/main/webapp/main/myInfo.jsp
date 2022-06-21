<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
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
</style>
</head>
<body bgcolor="#EAE6DA">
<div style = "width :  100%; height : 20%; ">
<table id = "tab">
<tr id = "trd">
<td id = "trd"></td>
<td id = "trd" style = "font-size : 300%">쿨엔존</td>
<td id = "trd"></td>
</tr>
</table>
<hr>
</div>
<div class  = "info" style = "text-align : center;">
<strong class = "font">내정보</strong>
<hr>
<%if(session.getAttribute("midx") != null ) { %>
<table border = "0" style = "margin : auto;">
<tr>
<td>&nbsp;</td>
<td id = "td"></td>
</tr>
<tr>
	<td>아이디 : </td>
	<td id = "td"><%=session.getAttribute("memberid") %></td>	
</tr>
<tr>
<td>&nbsp;</td>
<td id = "td"></td>
</tr>
<tr>
	<td>닉네임 : </td>
	<td id = "td"><%=session.getAttribute("membernickname") %></td>	
</tr>
<tr>
<td>&nbsp;</td>
<td id = "td"></td>
</tr>
<tr>
	<td>가입 날짜 : </td>
	<td id = "td"><%=session.getAttribute("writeday") %></td>	
</tr>
<tr>
<td>&nbsp;</td>
<td id = "td"></td>
</tr>
<tr>
	<td>이메일 : </td>
	<td id = "td"><%=session.getAttribute("membermail") %></td>	
</tr>
<tr>
<td>&nbsp;</td>
<td id = "td"></td>
</tr>
</table>
<%} %>
<input type='BUTTON' value="닫기" onClick='history.back()' id = "close"> 
</div>

</body>
</html>