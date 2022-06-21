<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "project.domain.*" %>
<%
ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성글 보기</title>

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
.wit {
	width : 700px;
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
#hover:hover{
	background :#627062;
}
.sellist {
	text-decoration : none;
	color : white;
}

</style>
</head>
<body bgcolor="#EAE6DA">
<form name = "frm" action = "" method = ""> 
<div style = "width :  100%; height : 20%; ">
<table id = "tab">
<tr id = "trd">
<td id = "trd"></td>
<td id = "trd" style = "font-size : 300%"><a href = "<%=request.getContextPath()%>/main/main.do" class = "logfont">쿨엔존</a></td>
<td id = "trd"></td>
</tr>
</table>
</div>

<br>
&nbsp;&nbsp;&nbsp;
<span class = "font2">작성글</span>
<br>
<div id = "news" style = "width : 73%; height: 100%;">
<table border = "1" style = "width : 100%; height : 7%; font-size : 20px; border-collapse : collapse;" class = "font">
<tr style = "text-align : center; background : #738A76; color : white;">
<th id = "hover"><a class = "sellist" href= "<%=request.getContextPath()%>/board/myNewsWrite.do">뉴스/소식</a></th>
<th id = "hover"><a class = "sellist" href= "<%=request.getContextPath()%>/board/myReviewWrite.do">칼럼</a></th>
<th id = "hover"><a class = "sellist" href= "<%=request.getContextPath()%>/board/myCommunityWrite.do">커뮤니티</a></th>
<th id = "hover"><a class = "sellist" href= "<%=request.getContextPath()%>/board/myHotdealWrite.do">핫딜</a></th>
<th id = "hover"><a class = "sellist" href= "<%=request.getContextPath()%>/board/myBoastWrite.do">시스템 감상</a></th>
</tr>
</table>
<br>
<table id = "writetab" border = "1" class = "font tab2" style = "width : 100%; height : 78%;" >
<tr style = "text-align : center; background : #627062; color : white;" class = "tab22">
	<th class = "tab22">분류</th>
	<th class = "wit tab22">제목</th>
	<th class = "tab22">작성 날짜</th>
</tr>
<%for(BoardVo bv : alist) {%>
<tr>
	<td>시스템 감상</td>
	<td><a href = "<%=request.getContextPath()%>/board/boastBoard.do?bidx=<%=bv.getBidx()%>"><%=bv.getSubject() %></a></td>
	<td><%=bv.getWriteday() %></td>
</tr>
<% } %>
</table>
</div>

</form>

</body>
</html>