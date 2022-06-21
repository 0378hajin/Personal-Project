<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
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
	text-align : right;
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

#news-info {
	display : line-block;
	border : 1px solid #CFC9C1;
	padding : 10px;
	background : #CFC9C1;
	float : left;
	text-align : left;
	margin-right : 10px;
	margin-bottom : 10px;
}
#community {
	display : line;
	border : 1px solid #CFC9C1;
	padding : 10px;
	background : #CFC9C1;
	float : left;
	text-align : left;
	margin-left : 10px;

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
#hotdeal {
	display : inline;
	border : 1px solid #CFC9C1;
	background : #CFC9C1; 
	padding : 10px;
	float : left;

}
#boast {
	display : line;
	border : 1px solid #CFC9C1;
	padding : 10px;
	background : #CFC9C1;
	float : right;
	text-align : left; 
	position : relative;
	right: 29px; 
	bottom : -245px;
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
.line {
	border-bottom : 1px solid gray;
}
hr {
	color : #627062; /*IE*/
	border-color : #627062; /*사파리*/
	background-color : #627062 /*크롬, 모질라 등 기타 브라우저*/ 
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

<form id = "searchbar">
<input type = "text" name = "search" value = "">
<input type = "submit" name = "btn" value = "검색" onclick = "" id = "btn">
</form>

<br>
<div id = "news-info" style = "width : 34.5%; height : 50%;">
<a href = "" class = "font"><strong>뉴스/소식</strong></a>
<hr>
<table border = "0" style = "width : 100%; height : 450px;">

<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
</table>
</div>

<div id = "community" style = "width : 34.5%; height : 50%;">
<a href = "" class = "font"><strong>커뮤니티</strong></a>
<hr>
<table border = "0" style = "width : 100%; height : 450px;">
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
</table>
</div>

<div id = "log-box" style = "width : 23%; height : 213px;">
<span class = "hi">Hi!</span>
<span class = "nickname">test 님!</span>
<form style = "text-align : center;">
<br><br><br><br><br><br><br>
<input type = "button" name = "myInfo" value = "작성글 보기" id = "info" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "내 정보" id = "info" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "로그아웃" id = "info" style = "width : 31%; height : 30px;">
</form>
</div>

<div id = "boast" style = "width : 23.5%; height : 545px;">
<a href = "" class = "font"><strong>시스템 자랑</strong></a>
<hr>
<br>
<table border = 1 align = "left" style = "width : 46%; border-collapse : collapse; margin-bottom : 30px;">
<tr><td style = "height : 200px;"></td><tr>
</table>
<table border = 1 align = "right" style = "width :46%; border-collapse : collapse; margin-bottom : 30px;">
<tr><td style = "height : 200px;"></td><tr>
</table>

<table border = 1 align = "right" style = "width :46%; border-collapse : collapse;">
<tr><td style = "height : 200px;"></td><tr>
</table>

<table border = 1 style = "width :46%; border-collapse : collapse;">
<tr><td style = "height : 200px;"></td><tr>
</table>
</div>

<div id = "hotdeal" style = "width : 71.5%; height : 250px;">
<a href = "" class = "font"><strong>핫딜</strong></a>
<hr>
<table border = "0" style = "width :100%; height : 200px;">
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
<tr><td class = "line"></td></tr>
</table>
</div>
</body>
</html>