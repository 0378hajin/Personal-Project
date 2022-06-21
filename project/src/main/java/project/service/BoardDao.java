package project.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import project.dbconn.Dbconn;
import project.domain.BoardVo;
import project.domain.Criteria;
import project.domain.SearchCriteria;

public class BoardDao {
	Connection conn;
	PreparedStatement pstmt;
	
	public BoardDao() {
		Dbconn db = new Dbconn();
		this.conn = db.getConection();
	}
	
	public int insertNewsBoard(String subject, String content, String ip, int midx, String filename) {
		int value = 0;
		
		String sql = "INSERT INTO NEWS_BOARD(subject,content,ip,midx,filename)"
		 		+ "VALUES (?,?,?,?,?)";
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, ip);
			pstmt.setInt(4, midx);
			pstmt.setString(5, filename);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
		
		return value;
	}
	
	public int insertBoastBoard(String subject, String content, String ip, int midx, String filename) {
		int value = 0;
		
		String sql = "INSERT INTO BOAST_BOARD(subject,content,ip,midx,filename)"
		 		+ "VALUES (?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, ip);
			pstmt.setInt(4, midx);
			pstmt.setString(5, filename);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
		
		return value;
	}
	public ArrayList<BoardVo> boastBoardList(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from boast_board where delyn = 'N' order by writeday desc";
		String str = "";
		if (scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		String sql = "select * from member a inner join boast_board b on a.midx = b.midx where b.delyn = 'N'"+str+" order by b.bidx asc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,	"%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("Content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setFilename(rs.getString("filename"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		return alist;
		
	}
	public BoardVo boastBoardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;
		String sql = "select * from boast_board a inner join member b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setFilename(rs.getString("filename"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}
	public int boastBoardTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from boast_board where delyn = 'N' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	
	public int insertBoastBoardReply(String rcontent, String ip, int midx, int bidx) {
		int value = 0;
		
		String sql = "insert into boast_board_reply(rcontent,ip,midx,bidx) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, ip);
			pstmt.setInt(3, midx);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
		
		return value;
	}
	
	public ArrayList<BoardVo>boastBoardReply(int bidx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from boast_board a inner join boast_board_reply b on a.bidx = b.bidx inner join member c on a.midx = c.midx where b.delyn = 'N' and a.bidx = ? order by b.writeday asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setRcontent(rs.getString("rcontent"));
				bv.setRwriteday(rs.getString("rwriteday"));
				alist.add(bv);
			
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
		return alist;
	}
	
	public int insertHotDealBoard(String subject, String content, String ip, String link, String cost, String del_cost, String filename, int midx) {
		int value = 0;
		
		String sql = "INSERT INTO HOTDEAL_BOARD(subject,content,ip,link,cost,del_cost,filename,midx)"
		 		+ "VALUES (?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, ip);
			pstmt.setString(4, link);
			pstmt.setString(5, cost);
			pstmt.setString(6, del_cost);
			pstmt.setString(7, filename);
			pstmt.setInt(8, midx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		
		return value;
	}
	public ArrayList<BoardVo> hotdealBoardList(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from hotdeal_board where delyn = 'N' order by writeday desc";
		
		String str = "";
		if (scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		
		String sql = "select * from member a inner join hotdeal_board b on a.midx = b.midx where b.delyn = 'N'"+str+" order by b.bidx desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				alist.add(bv);
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
				
		return alist;
	}
	
	public BoardVo hotdealBoardSelectone(int bidx){
		BoardVo bv = null;
		ResultSet rs = null;
		String sql = "select * from member a inner join hotdeal_board b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
			bv = new BoardVo();
			bv.setBidx(rs.getInt("bidx"));
			bv.setSubject(rs.getString("subject"));
			bv.setContent(rs.getString("content"));
			bv.setWriteday(rs.getString("writeday"));
			bv.setLink(rs.getString("link"));
			bv.setCost(rs.getString("cost"));
			bv.setDel_cost(rs.getString("del_cost"));
			bv.setMembernickname(rs.getString("membernickname"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return bv;
	}
	public int hotdealBoardTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from hotdeal_board where delyn = 'N' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	
	public int insertHotdealBoardReply(String rcontent, String ip, int midx, int bidx) {
		int value = 0;
		
		String sql = "insert into hotdeal_board_reply(rcontent,ip,midx,bidx) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, ip);
			pstmt.setInt(3, midx);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
		
		return value;
	}
	
	public ArrayList<BoardVo>hotdealBoardReply(int bidx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from hotdeal_board a inner join hotdeal_board_reply b on a.bidx = b.bidx inner join member c on a.midx = c.midx where b.delyn = 'N' and a.bidx = ? order by b.writeday asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setRcontent(rs.getString("rcontent"));
				bv.setRwriteday(rs.getString("rwriteday"));
				alist.add(bv);
			
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
		return alist;
	}
	
	public ArrayList<BoardVo> newsBoardList(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from news_Board where delyn = 'N' order by writeday desc";
		String str = "";
		if(scri.getKeyword() != null) {
		 str = " and subject like ?";
		} else {
			str = "";
		}
		String sql = "select * from member a inner join news_board b on a.midx = b.midx where b.delyn = 'N'"+str+" order by b.bidx desc limit ?,?";

		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			//다음 값이 존재하면 true, 그 행으로 커서가 이동
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setMidx(rs.getInt("midx"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} 
		return alist;
	}
	
	public int newsBoardTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		String str = "and subject like ?";
		String sql = "select count(*) as cnt from news_board where delyn = 'N' "+str+"";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	
	public BoardVo newsboardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from member a inner join news_board b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return bv;
	}
	
	public int insertNewsBoardReply(String rcontent, String ip, int midx, int bidx) {
		int value = 0;
		
		String sql = "insert into news_board_reply(rcontent,ip,midx,bidx) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, ip);
			pstmt.setInt(3, midx);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
		
		return value;
	}
	
	public ArrayList<BoardVo>newsBoardReply(int bidx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from news_board a inner join news_board_reply b on a.bidx = b.bidx inner join member c on a.midx = c.midx where b.delyn = 'N' and a.bidx = ? order by b.writeday asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setRcontent(rs.getString("rcontent"));
				bv.setRwriteday(rs.getString("rwriteday"));
				alist.add(bv);
			
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
		return alist;
	}
	
	public int insertReviewBoard(String subject, String content, String ip, int midx, String filename) {
		int value = 0;
		
		String sql = "INSERT INTO REVIEW_BOARD(subject,content,ip,midx,filename)"
		 		+ "VALUES (?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setString(3, ip);
			pstmt.setInt(4, midx);
			pstmt.setString(5, filename);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
		}
		
		
		return value;
	}

	public BoardVo reviewBoardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;
		String sql = "select * from member a inner join review_board b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setFilename(rs.getString("filename"));
				bv.setMembernickname(rs.getString("membernickname"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bv;
	}
	
	public ArrayList<BoardVo> reviewBoardList(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		String str = "";
		
		if(scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		
		String sql = "select * from member a inner join review_board b on a.midx = b.midx where b.delyn = 'N'"+str+" order by b.bidx desc limit ?,?";
				
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				alist.add(bv);
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
		return alist;
	}
	public int reviewBoardTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from review_board where delyn = 'N' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	
	public int insertReviewBoardReply(String rcontent, String ip, int midx, int bidx) {
		int value = 0;
		
		String sql = "insert into review_board_reply(rcontent,ip,midx,bidx) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, ip);
			pstmt.setInt(3, midx);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
		
		return value;
	}
	
	public ArrayList<BoardVo>reviewBoardReply(int bidx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from review_board a inner join review_board_reply b on a.bidx = b.bidx inner join member c on a.midx = c.midx where b.delyn = 'N' and a.bidx = ? order by b.writeday asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setRcontent(rs.getString("rcontent"));
				bv.setRwriteday(rs.getString("rwriteday"));
				alist.add(bv);
			
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
		return alist;
	}
	
	public ArrayList<BoardVo> communityBoardList (SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from community_Board where delyn = 'N' order by originbidx desc, depth asc";
		
		String str = "";
		if(scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		String sql = "select * from member a inner join community_board b on a.midx = b.midx where b.delyn = 'N'"+str+" order by originbidx desc, depth asc limit ?,?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			// limit은 index여서 0부터 시작해야한다.
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setKind(rs.getString("kind"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setLevel_(rs.getInt("level_"));
				alist.add(bv);
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
		
		
		return alist;
	}
	
	
	public BoardVo communityBoardSelectOne(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;
		String sql = "select * from community_board a inner join member b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setFilename(rs.getString("filename"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setKind(rs.getString("kind"));
				bv.setMembernickname(rs.getString("membernickname"));
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return bv;
	}
	public BoardVo communityBoardSelectOne2(int bidx) {
		BoardVo bv = null;
		ResultSet rs = null;
		String sql = "select * from community_board a inner join member b on a.midx = b.midx where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setSubject(rs.getString("subject"));
				bv.setContent(rs.getString("content"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setFilename(rs.getString("filename"));
				bv.setOriginbidx(rs.getInt("originbidx"));
				bv.setDepth(rs.getInt("depth"));
				bv.setLevel_(rs.getInt("level_"));
				bv.setKind(rs.getString("kind"));
				bv.setMembernickname(rs.getString("membernickname"));
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		return bv;
	}
	public int insertCommunityBoard (String kind, String subject, String content, String ip, int midx, String filename ) {
		int value = 0;
		
		ResultSet rs = null;
		int maxbidx = 0;
		
		String sql1 = "INSERT INTO COMMUNITY_BOARD(kind,subject,content,ip,midx,filename,originbidx,depth,level_)"
		 		+ "VALUES (?,?,?,?,?,?,0,0,0)";
		
		String sql2 = "select max(bidx) as maxbidx from community_board";      
		
		String sql3 = "update community_board set originbidx = ? where bidx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, kind);
			pstmt.setString(2, subject);
			pstmt.setString(3, content);
			pstmt.setString(4, ip);
			pstmt.setInt(5, midx);
			pstmt.setString(6, filename);
			value = pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				maxbidx = rs.getInt("maxbidx");
			}
				
			pstmt = conn.prepareStatement(sql3);
			pstmt.setInt(1, maxbidx);
			pstmt.setInt(2, maxbidx);
			value = pstmt.executeUpdate();		
			
		} catch (SQLException e) {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
			
			e.printStackTrace();
		}
		
		return value;
	}
	public ArrayList<BoardVo> communityBoardAnswer(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		
		String str = "";
		if (scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		
		String sql = "select * from member a inner join community_board b on a.midx = b.midx where b.delyn = 'N' and kind = 'answer' or kind = 'reply' "+str+" order by originbidx desc, depth asc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setKind(rs.getString("kind"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setLevel_(rs.getInt("level_"));
				
				alist.add(bv);
				
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		return alist;
	}

	public ArrayList<BoardVo> communityBoardInfo(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from community_board where delyn = 'N' and kind = 'info' order by originbidx desc";
		
		String str = "";
		if(scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		String sql = "select * from member a inner join community_board b on a.midx = b.midx where b.delyn = 'N' and kind = 'info' "+str+" order by b.writeday desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setKind(rs.getString("kind"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		return alist;
	}
	public ArrayList<BoardVo> communityBoardTalk(SearchCriteria scri){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		ResultSet rs = null;
		//String sql = "select * from community_board where delyn = 'N' and kind = 'talk' order by originbidx desc";
		
		String str = "";
		if(scri.getKeyword() != null) {
			str = "and subject like ?";
		} else {
			str = "";
		}
		
		String sql = "select * from member a inner join community_board b on a.midx = b.midx where b.delyn = 'N' and kind = 'talk' "+str+" order by b.writeday desc limit ?,?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			pstmt.setInt(2, (scri.getPage()-1)*10);
			pstmt.setInt(3, (scri.getPage()*10));
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				BoardVo bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setKind(rs.getString("kind"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				bv.setMembernickname(rs.getString("membernickname"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		return alist;
	}
	
	public int communityBoardTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from community_board where delyn = 'N' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}

	public int communityBoardAnswerTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from community_board where delyn = 'N' and kind = 'answer' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	public int communityBoardInfoTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from community_board where delyn = 'N' and kind = 'info' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	public int communityBoardTalkTotall(SearchCriteria scri) {
		int cnt = 0;
		ResultSet rs = null;
		
		String str = "and subject like ?";
		
		String sql = "select count(*) as cnt from community_board where delyn = 'N' and kind = 'talk' " +str+ "";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%"+scri.getKeyword()+"%");
			rs = pstmt.executeQuery();
			
			if  (rs.next()) {
				cnt = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}
		
		
		return cnt;
	}
	
	public int insertCommunityBoardReply(String rcontent, String ip, int midx, int bidx) {
		int value = 0;
		
		String sql = "insert into community_board_reply(rcontent,ip,midx,bidx) values (?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, rcontent);
			pstmt.setString(2, ip);
			pstmt.setInt(3, midx);
			pstmt.setInt(4, bidx);
			value = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			try {
				conn.close();
				pstmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
		
		return value;
	}
	
	public ArrayList<BoardVo>communityBoardReply(int bidx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from community_board a inner join community_board_reply b on a.bidx = b.bidx inner join member c on a.midx = c.midx where b.delyn = 'N' and a.bidx = ? order by b.rwriteday asc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMembernickname(rs.getString("membernickname"));
				bv.setRcontent(rs.getString("rcontent"));
				bv.setRwriteday(rs.getString("rwriteday"));
				alist.add(bv);
			
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
		return alist;
	}
	
	
	public int replyBoard(BoardVo bv) {
		int value = 0;
		String sql1 = "update community_board set depth = depth + 1 where originbidx = ? and  depth > ?";
		
		String sql2 = "INSERT INTO COMMUNITY_BOARD(originbidx,depth,level_,subject,content,ip,midx,filename,kind)"
		 		+ "VALUES (?,?,?,?,?,?,?,?,?)";
		try {
			//sql1번
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth());
			value = pstmt.executeUpdate();
			//sql2번
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, bv.getOriginbidx());
			pstmt.setInt(2, bv.getDepth()+1);
			pstmt.setInt(3, bv.getLevel_()+1);
			pstmt.setString(4, bv.getSubject());
			pstmt.setString(5, bv.getContent());
			pstmt.setString(6, bv.getIp());
			pstmt.setInt(7, bv.getMidx());
			pstmt.setString(8, bv.getFilename());
			pstmt.setString(9, bv.getKind());
			value = pstmt.executeUpdate();
			
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}finally {
				try {
					pstmt.close();
					conn.close();
				} catch (SQLException e1) {

					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		return value;
	}
	
	public ArrayList<BoardVo> myNewsWrite(int midx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from news_board a inner join member b on a.midx = b.midx where a.midx = ? order by a.writeday desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
			
		
		
		return alist;
	}

	public ArrayList<BoardVo> myReviewWrite(int midx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from review_board a inner join member b on a.midx = b.midx where a.midx = ? order by a.writeday desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
			
		
		return alist;
	}
	
	public ArrayList<BoardVo> myCommunityWrite(int midx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from community_board a inner join member b on a.midx = b.midx where a.midx = ? order by a.writeday desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
			
		
		return alist;
	}
	
	public ArrayList<BoardVo> myHotdealWrite(int midx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from hotdeal_board a inner join member b on a.midx = b.midx where a.midx = ? order by a.writeday desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
			
		
		return alist;
	}
	
	public ArrayList<BoardVo> myBoastWrite(int midx){
		ArrayList<BoardVo> alist = new ArrayList<BoardVo>();
		
		BoardVo bv = null;
		ResultSet rs = null;
		
		String sql = "select * from Boast_board a inner join member b on a.midx = b.midx where a.midx = ? order by a.writeday desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, midx);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bv = new BoardVo();
				bv.setBidx(rs.getInt("bidx"));
				bv.setMidx(rs.getInt("midx"));
				bv.setSubject(rs.getString("subject"));
				bv.setWriteday(rs.getString("writeday"));
				alist.add(bv);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				conn.close();
				rs.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			
		}
			
		
		return alist;
	}
	
	
}
