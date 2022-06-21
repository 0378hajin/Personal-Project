<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스/소식 게시판</title>
<script> 
function reply1() {
	var fm = document.frm;
	
	if (fm.replyContent.value == "") {
		alert("댓글을 입력해주세요.");
		fm.replyContent.focus();
		return;
	} else if (fm.replyContent.lenght < 3000){
		alert("글자수는 3000자까지 가능합니다.");
		fm.replyContent.focus();
		return;
	}
	fm.action = "";
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
	border-radius : 10px;
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
<div id = "news" style = "width : 73%; height: 800px;">
<table style = "width : 100%;">
<tr>
<td class = "title"><strong>제목</strong></td>
<td class = "writeday">작성자 : test&nbsp;   |   &nbsp;2022-05-10</td>
</tr>
</table>
<hr>
<table border = "0" style = "width : 100%;">
<tr>
<td style = "font-family : Arial;">내용 들어갈 곳</td>
</tr>
</table>
<hr style = "color : black; border-color : black; background-color : black;">
<span style = "font-family : Arial; font-size : 30px;"><strong>댓글</strong></span>
<hr style = "color : black; border-color : black; background-color : black;">
<table border = "0" style = "width : 100%">
<tr>
<td class = "writer">test 1 : </td>
<td class = "reply">안녕하세요</td>
<td class = "writeday">2022-05-11</td>
</tr>
</table>
<hr>
<table border = "0" style = "width : 100%">
<tr>
<td class = "writer">test 2 : </td>
<td class = "reply">반갑습니다.</td>
<td class = "writeday">2022-05-11</td>
</tr>
</table>
<hr>
<table border = "0" style = "width : 100%">
<tr>
<td class = "writer">test 3 : </td>
<td class = "reply">안뇽하세요~</td>
<td class = "writeday">2022-05-11</td>
</tr>
</table>
<br>
<hr style = "color : black; border-color : black; background-color : black;">
<br>
<span style = "font-family : Arial; font-size : 30px;"><strong>댓글 작성</strong></span>
<form name = "frm">
<textarea style = "font-size : 20px; resize : none;" name = "replyContent" placeholder = "댓글을 입력해주세요."></textarea>
<input type = "submit" name = "reply" value = "댓글 작성" class = "rbtn" onclick = "reply1();">
</form>
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