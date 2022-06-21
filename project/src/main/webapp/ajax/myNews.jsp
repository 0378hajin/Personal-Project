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

conn = dbconn.getConection();

String sql = "select subject,writeday from news_Board order by writeday asc";

try{
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	JSONArray array = new JSONArray();
	
	while (rs.next()){
		JSONObject obj = new JSONObject();
		obj.put("subject", rs.getString("subject"));
		obj.put("writeday", rs.getString("writeday"));
		
		array.add(obj);
	}
	out.println(array.toJSONString());
} catch (SQLException e){
	e.printStackTrace();
}
%>