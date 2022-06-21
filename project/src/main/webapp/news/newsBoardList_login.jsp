<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 게시판</title>
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
 .logfont {
 	text-decoration : none;
	color : black;
	font-size : 37px;
	font-family : Arial;
 } 
 .logfont2 {
 	font-size : 30px;
	font-family : Arial;
	text-align : center;
	position : absolute;
	top : 35%;
	left : 29%
 }
 
 #join {
	background: #738A76;
	width : 300px;
	height : 50px;
	font-size : 20px;
	border : 1px solid black;
	border-radius : 10px;
	
}
#join:active {
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
<div>

</div>

<nav id = "menubar" style = "width : 100%; height : 23%;">
<ul>
<li><a href = "#">뉴스/소식</a></li>
<li><a href = "#">칼럼</a></li>
<li><a href = "#">커뮤니티</a></li>
<li><a href = "#">핫딜</a></li>
</ul>
</nav>
<br>
&nbsp;&nbsp;&nbsp;
<span class = "font2">뉴스/소식</span>
<br>
<div id = "news" style = "width : 73%; height: 790px;">
<table border = "1" class = "font tab2" style = "width : 100%; height : 78%;" >
<tr style = "text-align : center; background : #627062; color : white;" class = "tab22">
	<th class = "tab22">번호</th>
	<th class = "wit tab22">제목</th>
	<th class = "tab22">작성자</th>
	<th class = "tab22">작성 날짜</th>
</tr>

<tr class = "tab22">
	<td  class = "tab22" style = "text-align : center;">108</td>
	<td class = "tab22" class = "wit tab22">2</td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">107</td>
	<td class = "wit tab22">3</td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">106</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">105</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">104</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">103</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">102</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
<tr class = "tab22">
	<td class = "tab22" style = "text-align : center;">100</td>
	<td class = "wit tab22"></td>
	<td class = "tab22" style = "text-align : center;"></td>
	<td class = "tab22" style = "text-align : center;"></td>
</tr>
</table>
<br>
<input type = "button" name = "btn" value = "글 쓰기" onclick = "" style = "font-size : 17px;" id ="btn" class = "wbtn">
<br>
<table class = "font" style = "width : 100%; text-align : center;">
<tr>
	
	<td>1 2 3 4 5 6 7 8 9 10  다음＞</td>

</tr>

<tr>

<td style = "width : 100%;">
<form id = "searchbar" >
<input type = "text" name = "search" value = "">
<input type = "submit" name = "btn" value = "검색" onclick = "" id ="btn">
</form>
</td>

</tr>
</table>

</div>

<div id = "log-box" style = "width : 23%; height : 213px;">
<span class = "logfont">Hi!</span>
<span class = "logfont2">test 님!</span>
<form style = "text-align : center;">
<br><br><br><br><br><br><br>
<input type = "button" name = "myInfo" value = "작성글 보기" id = "join" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "내 정보" id = "join" style = "width : 31%; height : 30px;">
<input type = "button" name = "myInfo" value = "로그아웃" id = "join" style = "width : 31%; height : 30px;">
</form>
</div>

</body>
</html>