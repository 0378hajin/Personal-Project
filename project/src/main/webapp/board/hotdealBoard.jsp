<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.domain.BoardVo" %>
<%@ page import = "java.util.ArrayList" %>
<%
	BoardVo bv = (BoardVo)request.getAttribute("bv");
	ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시스템 감상 게시판</title>
<script> 
function reply1() {
	var fm = document.frm;
	var session = '<%=(String)session.getAttribute("membernickname")%>';
	
	if (session == "null") {
		alert("로그인이 필요합니다.");
		fm.action = "<%=request.getContextPath()%>/main/login.do";
		return;
	} else if (fm.rcontent.value == "") {
		alert("댓글을 입력해주세요.");
		fm.rContent.focus();
		return;
	} else if (fm.rcontent.lenght < 3000){
		alert("글자수는 3000자까지 가능합니다.");
		fm.rcontent.focus();
		return;
	}
	fm.action = "<%=request.getContextPath()%>/board/hotdealBoardReplyAction.do";
	fm.method = "post";
	fm.submit;
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
#menubar{
	background : #627062;
	text-align : center;
}
#menubar ul {
	margin : 0;
	padding : 0;
	width : 600px;
	display : inline;
}
#menubar ul li {
	font-family : Arial;
	display : inline-block;
	list-style-type : none;
	padding : 13px 90px;
}
 #menubar ul li a {
 	text-decoration : none;
 	color : white;
}
#menubar ul li a:hover {
	color : black;
}

#searchbar {	
	position : static;
	text-align : center;
}
input[type = text] {
	width:250px; 
	height:30px; 
	font-size:15px;
	border : 1px solid gray;
}
input[type = button] {
	width : 50px;
	height : 100px;
}

#news {
	display : line-block;
	border : 1px solid #CFC9C1;
	padding : 10px;
	background : #CFC9C1;
	float : left;
	text-align : left;

}

#join {
	background: #738A76;
	width : 300px;
	height : 50px;
	font-size : 20px;
	border : 1px solid black;
	
}

#join:active {
	background : #627062;
	 
}


#log-box {
	display : inline;
	border : 1px solid #CFC9C1;
	padding : 10px;
	background : #CFC9C1;
	float : left;
	text-align : left;
	margin-left : 10px;
	position : absolute;
} 

.font2 {
	text-decoration : none;
	color : black;
	font-size : 35px;
	font-family : Arial;
}
.logfont {
	text-decoration : none;
	color : black;
	font-family : Arial;
}
.line {
	border-bottom : 1px solid gray;
}
hr {
	color : #627062; /*IE*/
	border-color : #627062; /*사파리*/
	background-color : #627062 /*크롬, 모질라 등 기타 브라우저*/ 
}
.writeday {
	width : 20%; 
	font-size : 15px; 
	text-align : right;
	font-family : Arial;

}
.title {
	width : 80%; 
	font-size : 40px;
	font-family :Arial;
}
.writer {
	width : 5%;
	text-align : center;
	font-family :Arial;
}

.reply {
	width : 75%;
	font-family :Arial;
}

.writeday2{
	width : 20%;
	font-family :Arial;
	text-align : right;
}
textarea{
	width: 100%;
    height: 300px;
 
}
.rbtn {
	background : #738A76;
	border : 1px solid black;
	font-size : 17px;
	float : right;
	width : 8%;
	height : 8%;
}
.rbtn:active {
	background : #627062;
}
#info {
	background: #738A76;
	width : 300px;
	height : 50px;
	font-size : 20px;
	border : 1px solid black;
	border-radius : 10px;
	
}
#info:active {
	background : #627062;
	 
}
.hi {
	text-decoration : none;
	color : black;
	font-size : 37px;
	font-family : Arial;
}
.nickname {
	font-size : 30px;
	font-family : Arial;
	text-align : center;
	position : absolute;
	top : 35%;
	left : 29%
}
</style>
</head>
<body bgcolor="#EAE6DA">
<div style = "width :  100%; height : 20%; ">
<table id = "tab">
<tr id = "trd">
<td id = "trd"></td>
<td id = "trd" style = "font-size : 300%"><a href = "<%=request.getContextPath()%>/main/main.do" class = "logfont">쿨엔존</a></td>
<td id = "trd"></td>
</tr>
</table>
</div>

<nav id = "menubar" style = "width : 100%; height : 23%;">
<ul>
<li><a href = "<%=request.getContextPath()%>/board/newsBoardList.do">뉴스/소식</a></li>
<li><a href = "<%=request.getContextPath()%>/board/reviewBoardList.do">칼럼</a></li>
<li><a href = "<%=request.getContextPath()%>/board/communityBoardList.do">커뮤니티</a></li>
<li><a href = "<%=request.getContextPath()%>/board/hotdealBoardList.do">핫딜</a></li>
<li><a href = "<%=request.getContextPath()%>/board/boastBoardList.do">시스템 감상</a></ul>
</nav>
<br>
&nbsp;&nbsp;&nbsp;
<span class = "font2">시스템 감상</span>
<br>
<div id = "news" style = "width : 73%; height: 100%;">
<table style = "width : 100%;">
<tr>
<td class = "title"><strong><%=bv.getSubject() %></strong></td>
<td class = "writeday">작성자 : <%=bv.getMembernickname() %>&nbsp;   |   &nbsp;<%=bv.getWriteday() %></td>
</tr>
</table>
<hr>
<table style = "width : 100%;">
<tr>
<td></td>
<td style = "font-family : Arial; text-align : right;">판매 사이트 링크 : <%=bv.getLink() %></td>
</tr>

<tr>
<td></td>
<td style = "font-family : Arial; text-align : right;">가격 : <%=bv.getCost() %>&nbsp;   |   &nbsp; 배송비 : <%=bv.getDel_cost() %></td>
</tr>

</table>
<hr>
<table border = "0" style = "width : 100%;">
<tr>
<td style = "font-family : Arial;"><%=bv.getContent() %></td>
</tr>
</table>
<hr style = "color : black; border-color : black; background-color : black;">
<span style = "font-family : Arial; font-size : 30px;"><strong>댓글</strong></span>
<hr style = "color : black; border-color : black; background-color : black;">
<%for (BoardVo bv1 : alist){ %>
<table border = "0" style = "width : 100%">
<tr>
<td class = "writer"><%=bv1.getMembernickname() %> : </td>
<td class = "reply"><%=bv1.getRcontent() %></td>
<td class = "writeday"><%=bv1.getRwriteday() %></td>
</tr>
</table>
<hr>
<%} %>

<br>
<span style = "font-family : Arial; font-size : 30px;"><strong>댓글 작성</strong></span>
<form name = "frm">
<textarea style = "font-size : 20px; resize : none;" name = "rcontent" placeholder = "댓글을 입력해주세요."></textarea>
<input type = "submit" name = "reply" value = "댓글 작성" class = "rbtn" onclick = "reply1();">
<input type = "hidden" name = "bidx" value = <%=bv.getBidx() %>>
</form>
</div>

<% if (session.getAttribute("midx") != null){  %>
<div id = "log-box" style = "width : 23%; height : 213px;">
<span class = "hi">환영합니다!</span>
<span class = "nickname"><%=session.getAttribute("membernickname") %> 님!</span>
<form style = "text-align : center;">
<br><br><br><br><br><br><br>
<input type = "button" name = "myInfo" value = "작성글 보기" id = "info" onclick = "location.href = '<%=request.getContextPath() %>/board/myNewsWrite.do'" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "내 정보" id = "info" onclick = "location.href = '<%=request.getContextPath()%>/main/myInfo.do'" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "로그아웃" id = "info" onclick = "location.href = '<%=request.getContextPath()%>/main/logout.do'" style = "width : 31%; height : 30px;">
</form>
</div>

<%} else { %>


<div id = "log-box" style = "width : 23%; height : 213px;">
<form>
<input type = "button" name = "login" value = "로그인" onclick = "location.href = '<%=request.getContextPath()%>/main/login.do'" id = "join" style = "width : 100%; height : 50px;">
<br>
<br>
<input type = "button" name = "join" value = "회원가입" onclick = "location.href = '<%=request.getContextPath()%>/main/join.do'" id = "join" style = "width : 100%; height : 50px;">
<br>
<br>
<br>
<a class = "logfont" href = "<%=request.getContextPath()%>/main/idSearch.do">아이디</a> * <a  class = "logfont" href = "<%=request.getContextPath()%>/main/passwordSearch.do">비밀번호 찾기</a> 
</form>
</div>

<% } %>

</body>
</html>