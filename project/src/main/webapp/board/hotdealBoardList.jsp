<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "project.domain.*" %>
<%
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
PageMaker pm = (PageMaker)request.getAttribute("pm");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>핫딜 게시판</title>
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
.wbtn {	
	position : static;
	float : right;
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
.font {
	text-decoration : none;
	color : black;
	font-family : Arial;
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
.wit {
	width : 700px;
}
#btn {
	background: #738A76;
	width : 6%; 
	height : 33px;	
	font-size : 20px;
	border : 1px solid black;
}
#btn:active {
	background : #627062;
	 
}
.tab2 {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
.tab22 {
    border-bottom: 1px solid #444444;
    padding: 10px;
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
<span class = "font2">핫딜</span>
<br>
<div id = "news" style = "width : 73%; height: 100%;">
<table border = "1" class = "font tab2" style = "width : 100%; height : 78%;" >
<tr style = "text-align : center; background : #627062; color : white;" class = "tab22">
	<th class = "tab22">번호</th>
	<th class = "wit tab22">제목</th>
	<th class = "tab22">작성자</th>
	<th class = "tab22">작성 날짜</th>
</tr>
<%for(BoardVo bv : alist) {%>
<tr class = "tab22">
	<td  class = "tab22" style = "text-align : center;"><%=bv.getBidx() %></td>
	<td class = "tab22" class = "wit tab22">
	<a href = "<%=request.getContextPath()%>/board/hotdealBoard.do?bidx=<%=bv.getBidx()%>"><%=bv.getSubject() %></a>
	</td>
	<td class = "tab22" style = "text-align : center;"><%=bv.getMembernickname() %></td>
	<td class = "tab22" style = "text-align : center;"><%=bv.getWriteday() %></td>
</tr>
<% } %>
</table>
<br>
<input type = "button" name = "btn" value = "글 쓰기" onclick = "location.href = '<%=request.getContextPath()%>/board/hotdealBoard_write.do'" style = "font-size : 17px;" id ="btn" class = "wbtn">
<br>
<table class = "font" style = "width : 100%; text-align : center;">
<tr>
	
	<td>
	<%
	if(pm.isPrev() == true){
		out.println("<a href = '"+request.getContextPath()+"/board/hotdealBoardList.do?page="+(pm.getStartPage()-1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>이전</a>");
	}	
	
	%>
	
	<%
	for(int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
		
		out.println("<a href = '"+request.getContextPath()+"/board/hotdealBoardList.do?page="+i+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>"+i+"</a>");
	}
	
	%>

	<%
	if(pm.isNext() && pm.getEndPage() > 0) {
		out.println("<a href = '"+request.getContextPath()+"/board/hotdealBoardList.do?page="+(pm.getEndPage()+1)+"&keyword="+pm.encoding(pm.getScri().getKeyword())+"&searchType="+pm.getScri().getSearchType()+"'>다음</a>");
	}
	
	%>
	</td>

</tr>

<tr>

<td style = "width : 100%;">
<form name = "frm" id = "searchbar" action = "<%=request.getContextPath()%>/board/hotdealBoardList.do" method = "post">
<input type = "text" name = "keyword">
<input type = "submit" name = "btn" value = "검색" id ="btn">
</form>
</td>

</tr>
</table>

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