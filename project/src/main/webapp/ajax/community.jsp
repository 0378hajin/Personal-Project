<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.dbconn.Dbconn"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "org.json.simple.JSONArray" %>
<%@ page import = "org.json.simple.JSONObject" %>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

Dbconn dbconn = new Dbconn();

conn = dbconn.getConection();

String sql = "select bidx,subject from community_board order by writeday desc";

try{
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	JSONArray array = new JSONArray();
	
	while (rs.next()) {
		
		JSONObject obj = new JSONObject();
		obj.put("bidx", rs.getString("bidx"));
		obj.put("subject", rs.getString("subject"));
		
		array.add(obj);
	}
	out.println(array.toJSONString());
} catch(SQLException e) {
	e.printStackTrace();
}


%>
