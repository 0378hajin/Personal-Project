<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
<script src = "<%=request.getContextPath() %>/js/jquery-3.6.0.min.js">
</script>
<script> 
function list() {
	var path ='<%=request.getContextPath()%>';
	$.ajax({
		url : "../ajax/news.jsp",
		type : "get",
		success : function(data){
			var newsData = JSON.parse(data.trim());
			var html = "";
			for (var i = 0; i < 7; i++){
				html += "<tr><td class ='line'><a href = '"+path+"/board/newsBoard.do?bidx="+newsData[i].bidx+"'>"+newsData[i].subject+"</a><td></tr>";
			}
			$("#newstab").html(html);

		},
		error : function  (){
			alert("뉴스 데이터를 불러오지 못했습니다.");
		}
	});
	
	$.ajax({
		url : "../ajax/community.jsp",
		type : "get",
		success : function(data) {
			var communityData = JSON.parse(data.trim());
			var html = "";
			for (var i = 0; i < 7; i++){
				html += "<tr><td class = 'line'><a href = '"+path+"/board/communityBoard.do?bidx="+communityData[i].bidx+"'>"+communityData[i].subject+"</a></td></tr>";
			}
			$("#comtab").html(html);
		},
		error : function  (){
			alert("커뮤니티 데이터를 불러오지 못했습니다.");
		}
		
	});
	
	$.ajax({
		url : "../ajax/hotdeal.jsp",
		type : "get",
		success : function(data) {
			var hotdealData = JSON.parse(data.trim());
			var html = "";
			for(var i = 0; i < 4; i++) {
				html += "<tr><td class = 'line'><a href = '"+path+"/board/hotdealBoard.do?bidx="+hotdealData[i].bidx+"'>"+hotdealData[i].subject+"</a></td></tr>";
			}
			$("#hottab").html(html);
		},
		error : function  (){
			alert("핫딜 데이터를 불러오지 못했습니다.");
		}
	});
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
.font {
	text-decoration : none;
	color : black;
	font-size : 37px;
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
</style>
</head>
<body bgcolor="#EAE6DA" onload = "list()">
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

<form id = "searchbar">
<input type = "text" name = "search" value = "">
<input type = "submit" name = "btn" value = "검색" onclick = "" id = "btn">
</form>

<br>
<div id = "news-info" style = "width : 34.5%; height : 50%;">
<a href = "<%=request.getContextPath()%>/board/newsBoardList.do" class = "font"><strong>뉴스/소식</strong></a>
<hr>
<table id = "newstab" border = "0" style = "width : 100%; height : 450px; font-family : Arial;">

</table>
</div>

<div id = "community" style = "width : 34.5%; height : 50%;">
<a href = "<%=request.getContextPath()%>/board/communityBoardList.do" class = "font"><strong>커뮤니티</strong></a>
<hr>
<table id = "comtab" border = "0" style = "width : 100%; height : 450px; font-family : Arial;" >

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


<div id = "hotdeal" style = "width : 72%; height : 100%;">
<a href = "<%=request.getContextPath()%>/board/hotdealBoardList.do" class = "font"><strong>핫딜</strong></a>
<hr>
<table id = "hottab" border = "0" style = "width :100%; height : 200px; font-family : Arial;">


</table>
</div>

</body>
</html>