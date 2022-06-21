<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.dbconn.Dbconn"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Dbconn dbconn = new Dbconn();
String sql = "select filename from boast_board order by writeday desc";
try{
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	JSONArray array = new JSONArray();
	while (rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("filename", rs.getString("filename"));
		array.add(obj);
	}
	out.println(array.toJSONString());
}catch(SQLException e) {
	e.printStackTrace();
}

%>
