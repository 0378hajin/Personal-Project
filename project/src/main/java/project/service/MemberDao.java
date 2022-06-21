package project.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.dbconn.Dbconn;
import project.domain.MemberVo;

public class MemberDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	
	public MemberDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConection();
				
	}

		public int insertMember(String memberId, String memberPwd, String memberNickname, String memberMail, String memberIP){
			int value = 0; 
			
			
			String sql = "insert into member(MEMBERID,MEMBERPWD,MEMBERNICKNAME,MEMBERMAIL,MEMBERIP)"
					+"values(?,?,?,?,?)";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				pstmt.setString(3, memberNickname);
				pstmt.setString(4, memberMail);
				pstmt.setString(5, memberIP);
				
				value = pstmt.executeUpdate();
				
			} catch(Exception e) {
				
				e.printStackTrace();
				
			}
			System.out.println(value);
			return value;
		}

		public ArrayList<MemberVo> memberSelectAll() {
			ArrayList<MemberVo> alist = new ArrayList<MemberVo>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from member where delyn = 'N' order by midx desc";
			
			try{
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while (rs.next()){
					MemberVo mv = new MemberVo();
					mv.setMidx(rs.getInt("midx"));
					mv.setMemberId(rs.getString("memberId"));
					mv.setMemberPwd(rs.getString("memberPwd"));
					mv.setMemberNickname(rs.getString("memberNickname"));
					mv.setMemberMail(rs.getString("memberMail"));
					mv.setMemberIP(rs.getString("memberIP"));
					alist.add(mv);
				}
			} catch (Exception e){
				e.printStackTrace();
			} finally {
				try{
				rs.close();
				pstmt.close();
				conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			return alist;
		}
		
		public MemberVo login(String memberId, String memberPwd) {
			ResultSet rs = null;
			MemberVo mv = null;
			
			String sql = "select * from member where delyn = 'N' and memberid = ? and memberpwd = ?";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberId);
				pstmt.setString(2, memberPwd);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					mv = new MemberVo();
					mv.setMidx(rs.getInt("midx"));
					mv.setMemberId(rs.getString("memberId"));
					mv.setMemberNickname(rs.getString("memberNickname"));
					mv.setWriteday(rs.getString("writeday"));
					mv.setMemberMail(rs.getString("memberMail"));
				}
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			return mv;
		}
		
		public MemberVo idSearch(String membernickname, String membermail) {
			ResultSet rs = null;
			MemberVo mv = null;
			
			String sql = "select * from member where delyn = 'N' and membernickname = ? and membermail = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, membernickname);
				pstmt.setString(2, membermail);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					mv = new MemberVo();
					mv.setMidx(rs.getInt("midx"));
					mv.setMemberId(rs.getString("memberid"));
					
					
				}
			} catch (SQLException e) {

				e.printStackTrace();
			} finally {
				try {
					conn.close();
					rs.close();
					pstmt.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
			
			return mv;
		}
		
		public MemberVo pwdSearch(String memberid, String membermail) {
			ResultSet rs = null;
			MemberVo mv = null;
			
			String sql = "select * from member where delyn = 'N' and memberid = ? and membermail = ? ";
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberid);
				pstmt.setString(2, membermail);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					mv = new MemberVo();
					mv.setMidx(rs.getInt("midx"));
					mv.setMemberPwd(rs.getString("memberpwd"));
				}
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				try {
					conn.close();
					pstmt.close();
					rs.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
				
				
			}
					
			return mv;
			
		}
		
		public int pwdChange(String memberpwd, int midx) {
			int value = 0;
			
			String sql = "update member set memberpwd = ? where midx = ? "; 
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, memberpwd);
				pstmt.setInt(2, midx);
				value = pstmt.executeUpdate();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			return value;
		}
		
}