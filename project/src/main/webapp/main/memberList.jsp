<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "project.*" %>
<%@page import = "project.domain.*" %>
<%@page import = "java.util.*" %>

<%

ArrayList<MemberVo> alist = (ArrayList<MemberVo>)request.getAttribute("alist"); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<style>
table,td,tr {
	border  : 1px solid gray;
	border-collapse : collapse;
	font-family : Arial;
	width : 700px;
	text-align : center;

}
span {
	font-size : 30px;
	font-family : Arial;
	
}

</style>
</head>
<body bgcolor="#EAE6DA">
<span>쿨엔존 회원 목록</span>
<hr>
<table border = "1" style = "border-collapse : collapse;">
<tr>
<td>회원번호</td>
<td>아이디</td>
<td>비밀번호</td>
<td>닉네임</td>
<td>이메일</td>
<td>ip주소</td>
</tr>
<%for(MemberVo mv : alist) {%>
<tr>
<td><%=mv.getMidx() %></td>
<td><%=mv.getMemberId() %></td>
<td><%=mv.getMemberPwd() %></td>
<td><%=mv.getMemberNickname() %></td>
<td><%=mv.getMemberMail() %></td>
<td><%=mv.getMemberIP() %></td>
</tr>
<% } %>

</table>

</body>
</html>