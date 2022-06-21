<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("midx") == null) {
	session.setAttribute("saveUrl", request.getRequestURI());
	out.println("<script>alert('로그인 후에 작성할 수 있습니다.'); location.href = '"+request.getContextPath()+"/main/login.do'</script>");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>칼럼 게시판</title>
<script src = "/jQuery/js/jquery-3.6.0.min.js">
</script>
<script>
$(document).ready(function(){
	   var fileTarget = $('.filebox .upload-hidden');

	    fileTarget.on('change', function(){
	        if(window.FileReader){
	            // 파일명 추출
	            var filename = $(this)[0].files[0].name;
	        } 

	        else {
	            // Old IE 파일명 추출
	            var filename = $(this).val().split('/').pop().split('\\').pop();
	        };

	        $(this).siblings('.upload-name').val(filename);
	    });

	    //preview image 
	    var imgTarget = $('.preview-image .upload-hidden');

	    imgTarget.on('change', function(){
	        var parent = $(this).parent();
	        parent.children('.upload-display').remove();

	        if(window.FileReader){
	            //image 파일만
	            if (!$(this)[0].files[0].type.match(/image\//)) return;
	            
	            var reader = new FileReader();
	            reader.onload = function(e){
	                var src = e.target.result;
	                parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>');
	            }
	            reader.readAsDataURL($(this)[0].files[0]);
	        }

	        else {
	            $(this)[0].select();
	            $(this)[0].blur();
	            var imgSrc = document.selection.createRange().text;
	            parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>');

	            var img = $(this).siblings('.upload-display').find('img');
	            img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";        
	        }
	    });
	});
</script>
<script> 
function check() {
	var fm = document.frm;
	
	if (fm.subject.value == "") {
		alert("제목을 입력해주세요.");
		fm.subject.focus();
		return;
	} else if (fm.subject.lenght < 80) {
		alert("제목의 글자수는 80자까지 가능합니다.");
		fm.subject.focus();
		return;
	} else if (fm.content.value == "") {
		alert("본문 내용을 입력해주세요.");
		fm.content.focus();
		return;
	} else if (fm.content.lenght < 3000){
		alert("본문의 글자수는 3000자까지 가능합니다.");
		fm.content.focus();
		return;
	}
	fm.action = "<%=request.getContextPath()%>/board/reviewBoard_writeAction.do";
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
.filebox input[type="file"] {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0;
}

.filebox label {
  display: inline-block;
  padding: .5em .75em;
  color: #999;
  font-size: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #fdfdfd;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  padding: .5em .75em;
  font-size: inherit;
  font-family: inherit;
  line-height: normal;
  vertical-align: middle;
  background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
  margin-bottom: 5px;
}

@media(min-width: 768px) {
  .filebox .upload-display {
    display: inline-block;
    margin-right: 5px;
    margin-bottom: 0;
  }
}

.filebox .upload-thumb-wrap {
  display: inline-block;
  width: 54px;
  padding: 2px;
  vertical-align: middle;
  border: 1px solid #ddd;
  border-radius: 5px;
  background-color: #fff;
}

.filebox .upload-display img {
  display: block;
  max-width: 100%;
  width: 100% \9;
  height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #9E999A;
  border-color: #9E999A;
}
#close {
	background: #738A76;
	width : 10%; 
	height : 50px;	
	font-size : 20px;
	border : 1px solid black;
	
}
#close:active {
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
&nbsp;&nbsp;&nbsp;
<span class = "font2">칼럼</span>
<br>
<div id = "news" style = "width : 73%; height: 800px;">
<form name = "frm" enctype="multipart/form-data">
<table style ="width : 100%; height : 30px;">
<tr>
<td>
<input type = "text" maxlength = "80" placeholder = "제목을 입력해주세요." name = "subject" style ="width : 100%; height : 30px;">
</td>
</tr>
</table>

<br>
<hr>
<br>
<table style = "width : 100%; height : 500px;">
<tr>
<td>
<textarea name = "content" maxlength = "3000" placeholder = "내용을 입력해주세요." style = "width : 100%; height : 500px; resize : none; font-size : 15px;"></textarea>
</td>
</tr>
</table>
<br>
<hr>
<br>
<span style = "font-family : Arial; font-size : 20px;">파일 첨부 :&nbsp; </span>
<span class="filebox bs3-primary preview-image">
              <input class="upload-name" disabled="disabled" style="width: 200px;">

              <label for="input_file" style = "font-family : Arial;">업로드</label> 
              <input type="file" id="input_file" class="upload-hidden" name = "file"> 
            </span>
 
<br>
<br>
<br>
<div style = "text-align : center;">
 <span>
<input type="submit" name = "btn" value="확인" onclick= "check();" id = "close"> 
</span>
&nbsp;
&nbsp;
<span>
<!--취소를 누르면 이전에 있던곳으로 가기 -->
<input type="button" name = "btn2" value="취소" onClick='history.back()' id = "close"> 
</span>
</div>
</form>
</div>

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

</body>
</html>