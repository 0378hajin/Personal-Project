package project.controller;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import project.domain.BoardVo;
import project.domain.Criteria;
import project.domain.MemberVo;
import project.domain.PageMaker;
import project.domain.SearchCriteria;
import project.service.BoardDao;


@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		// 주소의 풀 경로 추출 
		String uri = request.getRequestURI();
		//프로젝트 이름 추출 
		String pj = request.getContextPath();
		//프로젝트 이름을 뺀 나머지 가상 경로를 추출
		String command = uri.substring(pj.length());
		
		System.out.println("command : " + command );
		
		String uploadPath = "/Users/hs/eclipse-workspace/project/src/main/webapp/";
		String saveFolder = "files";
		String saveFullPath = uploadPath + saveFolder;
		MultipartRequest multi = null;
				
		if (command.equals("/board/newsBoard_write.do")) {
			
			System.out.println("뉴스");
			RequestDispatcher rd = request.getRequestDispatcher("/board/newsBoard_write.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/newsBoard_writeAction.do")) {
			int sizeLimit = 1024*1024*15;
			// 파일 사이즈 15메가로 제한
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
			System.out.println("뉴스 작성");
			String subject =  multi.getParameter("subject");
			String content = multi.getParameter("content");

			String ip = InetAddress.getLocalHost().getHostAddress();
			Enumeration files = multi.getFileNames();
			//Enumeration 열거자
			//열거자에 저장된 파일는 객체를 생성;
			String file = (String) files.nextElement();
			//담긴 객체 파일의 이름을 얻는다. 
			String fileName = multi.getFilesystemName(file);
			// 파일이름을 뽑아낼 수 있는 메서드
			String originalFileName = multi.getOriginalFileName(file);
			//파일 원래 이름을 알아낼 수 있는 메서드
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertNewsBoard(subject, content, ip, midx, fileName);
			System.out.println(value);
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/newsBoardList.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/board/newsBoard_write.do");
			}
			
		} else if (command.equals("/board/boastBoard_write.do")) {
			
			System.out.println("시스템 감상");
			RequestDispatcher rd = request.getRequestDispatcher("/board/boastBoard_write.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/boastBoard_writeAction.do")) {
			int sizeLimit = 1024*1024*15;
			// 파일 사이즈 15메가로 제한
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
			System.out.println("감상 작성");
			String subject =  multi.getParameter("subject");
			String content = multi.getParameter("content");
			String ip = InetAddress.getLocalHost().getHostAddress();
			Enumeration files = multi.getFileNames();
			//Enumeration 열거자
			//열거자에 저장된 파일는 객체를 생성;
			String file = (String) files.nextElement();
			//담긴 객체 파일의 이름을 얻는다. 
			String fileName = multi.getFilesystemName(file);
			// 파일이름을 뽑아낼 수 있는 메서드
			String originalFileName = multi.getOriginalFileName(file);
			//파일 원래 이름을 알아낼 수 있는 메서드
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertBoastBoard(subject, content, ip, midx, fileName);
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/boastBoardList.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/board/boastBoard_write.do");
			}
		
		} else if (command.equals("/board/communityBoard_write.do")) {
			
			System.out.println("커뮤니티");
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoard_write.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoard_reply.do")) {
			System.out.println("커뮤니티 답변");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.communityBoardSelectOne(bidx_);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoard_reply.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoard_replyAction.do")) {
			System.out.println("커뮤니티 답변 액션");
			int sizeLimit = 1024*1024*15;
			multi = new MultipartRequest(request, saveFullPath, sizeLimit,"UTF-8", new DefaultFileRenamePolicy());
			
			String bidx = multi.getParameter("bidx");
			String originbidx = multi.getParameter("originbidx");
			String depth = multi.getParameter("depth");
			String level_ = multi.getParameter("level_");
			String subject = multi.getParameter("subject");
			String content = multi.getParameter("content");
			String kind = multi.getParameter("kind");
			
			Enumeration files = multi.getFileNames();
			
			String file = (String)files.nextElement();
			
			String fileName = multi.getFilesystemName(file);
			
			String originFileName = multi.getOriginalFileName(file);
			String ip = InetAddress.getLocalHost().getHostAddress();

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			//위에 값을 담는다. 
			BoardVo bv = new BoardVo();
			bv.setBidx(Integer.parseInt(bidx));
			bv.setOriginbidx(Integer.parseInt(originbidx));
			bv.setDepth(Integer.parseInt(depth));
			bv.setLevel_(Integer.parseInt(level_));
			bv.setSubject(subject);
			bv.setContent(content);
			bv.setIp(ip);
			bv.setFilename(fileName);
			bv.setMidx(midx);
			bv.setKind(kind);
			
			BoardDao db = new BoardDao();
			int value = db.replyBoard(bv);
			System.out.println(value);
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/communityBoardList.do");
			}else {
				response.sendRedirect(request.getContextPath() + "/board/communityBoard.do?bidx="+bidx);
			}
		} else if (command.equals("/board/hotdealBoard_write.do")) {
			
			System.out.println("핫딜");
			RequestDispatcher rd = request.getRequestDispatcher("/board/hotdealBoard_write.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/hotdealBoard_writeAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			// 파일 사이즈 15메가로 제한
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
			System.out.println("핫딜 작성");
			String subject =  multi.getParameter("subject");
			String content = multi.getParameter("content");
			String link = multi.getParameter("link");
			String cost = multi.getParameter("cost");
			String del_cost = multi.getParameter("del_cost");
			String ip = InetAddress.getLocalHost().getHostAddress();
			Enumeration files = multi.getFileNames();
			//Enumeration 열거자
			//열거자에 저장된 파일는 객체를 생성;
			String file = (String) files.nextElement();
			//담긴 객체 파일의 이름을 얻는다. 
			String fileName = multi.getFilesystemName(file);
			// 파일이름을 뽑아낼 수 있는 메서드
			String originalFileName = multi.getOriginalFileName(file);
			//파일 원래 이름을 알아낼 수 있는 메서드
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertHotDealBoard(subject, content, ip, link, cost, del_cost, fileName, midx);
			System.out.println(value);
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/hotdealBoardList.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/board/hotdealBoard_write.do");
			}
		} else if (command.equals("/board/reviewBoard_write.do")) {
			
			System.out.println("리뷰");
			RequestDispatcher rd = request.getRequestDispatcher("/board/reviewBoard_write.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/reviewBoard_writeAction.do")) {
			int sizeLimit = 1024*1024*15;
			// 파일 사이즈 15메가로 제한
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
			System.out.println("리뷰 작성");
			String subject =  multi.getParameter("subject");
			String content = multi.getParameter("content");
			String ip = InetAddress.getLocalHost().getHostAddress();
			Enumeration files = multi.getFileNames();
			//Enumeration 열거자
			//열거자에 저장된 파일는 객체를 생성;
			String file = (String) files.nextElement();
			//담긴 객체 파일의 이름을 얻는다. 
			String fileName = multi.getFilesystemName(file);
			// 파일이름을 뽑아낼 수 있는 메서드
			String originalFileName = multi.getOriginalFileName(file);
			//파일 원래 이름을 알아낼 수 있는 메서드
			
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertReviewBoard(subject, content, ip, midx, fileName);
			
			if(value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/reviewBoardList.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/board/reviewBoard_write.dohotdealBoardList");
			}
		
		} else if (command.equals("/board/newsBoardList.do")) {
			
			System.out.println("뉴스 게시판");
			String page = request.getParameter("page");
			if (page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			System.out.println(keyword);
			if (keyword == null) keyword = "";
			
			//페이지 하단에 번호를 만들기 위한 객체 생성
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			
			BoardDao bd = new BoardDao();
			
			int cnt = bd.newsBoardTotall(scri);
			 
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.newsBoardList(scri);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/newsBoardList.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoardList.do")) {
			
			System.out.println("커뮤니티 게시판");
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			System.out.println(keyword);
			BoardDao bd = new BoardDao();
			int cnt = bd.communityBoardTotall(scri);
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.communityBoardList(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoardList.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoardList_answer.do")) {
		
			System.out.println("커뮤니티 게시판 질문");
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.communityBoardAnswerTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.communityBoardAnswer(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoardList_answer.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoardList_info.do")) {
			
			System.out.println("커뮤니티 게시판 정보");
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.communityBoardInfoTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.communityBoardInfo(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoardList_info.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoardList_talk.do")) {
			
			System.out.println("커뮤니티 게시판 잡담");
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.communityBoardTalkTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.communityBoardTalk(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoardList_talk.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/communityBoard_writeAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			// 파일 사이즈 15메가로 제한
			multi = new MultipartRequest(request, saveFullPath, sizeLimit, "utf-8",new DefaultFileRenamePolicy());
			System.out.println("커뮤니티 작성");
			String subject =  multi.getParameter("subject");
			String content = multi.getParameter("content");
			String kind = multi.getParameter("kind");
			String ip = InetAddress.getLocalHost().getHostAddress();
			Enumeration files = multi.getFileNames();
			//Enumeration 열거자
			//열거자에 저장된 파일는 객체를 생성;
			String file = (String) files.nextElement();
			//담긴 객체 파일의 이름을 얻는다. 
			String fileName = multi.getFilesystemName(file);
			// 파일이름을 뽑아낼 수 있는 메서드
			String originalFileName = multi.getOriginalFileName(file);
			//파일 원래 이름을 알아낼 수 있는 메서드
			
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			int value = bd.insertCommunityBoard(kind, subject, content, ip, midx, fileName);

			if(value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/communityBoardList.do");
			} else {
				response.sendRedirect(request.getContextPath() + "/board/communityBoard_write.do");
			}
		} else if (command.equals("/board/communityBoard_answer.do")) {
			System.out.println("질문 게시판");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.communityBoardSelectOne2(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.communityBoardReply(bidx_);

			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoard_answer.jsp");
			rd.forward(request, response);
		
		} else if (command.equals("/board/communityBoard_answerReplyAction.do")) {
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertCommunityBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/communityBoard_answer.do?bidx=" +bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/communityBoardList_answer.do");
			}
			
		} else if (command.equals("/board/hotdealBoardList.do")) {
			
			System.out.println("핫딜 게시판");

			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.hotdealBoardTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.hotdealBoardList(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/hotdealBoardList.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/boastBoardList.do")) {
			
			System.out.println("시스템 감상 게시판");
			
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.boastBoardTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.boastBoardList(scri);
			request.setAttribute("alist", alist);
			RequestDispatcher rd = request.getRequestDispatcher("/board/boastBoardList.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/reviewBoardList.do")) {
			
			System.out.println("리뷰 게시판");
			
			String page = request.getParameter("page");
			if(page == null) {
				page = "1";
			}
			int pagex = Integer.parseInt(page);
			
			String keyword = request.getParameter("keyword");
			if(keyword == null) keyword = "";
	
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			scri.setKeyword(keyword);
			
			BoardDao bd = new BoardDao();
			int cnt = bd.reviewBoardTotall(scri);
			System.out.println("cnt : " + cnt); 
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<BoardVo> alist = bd.reviewBoardList(scri);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/reviewBoardList.jsp");
			rd.forward(request, response);
			
		} else if (command.equals("/board/newsBoard.do")) {
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.newsboardSelectOne(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.newsBoardReply(bidx_);
			
			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/newsBoard.jsp");
			rd.forward(request, response);
		}else if (command.equals("/board/newsBoardReplyAction.do")) {
			
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertNewsBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/newsBoard.do?bidx=" +bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/newsBoardList.do");
			}
		} else if (command.equals("/board/hotdealBoard.do")) {
			System.out.println("내용보기");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.hotdealBoardSelectone(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.hotdealBoardReply(bidx_);

			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/hotdealBoard.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/hotdealBoardReplyAction.do")) {
			
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertHotdealBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/hotdealBoard.do?bidx=" + bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/hotdealBoardList.do");
			}
			
		} else if (command.equals("/board/boastBoard.do")) {
			System.out.println("내용 보기");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.boastBoardSelectOne(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.boastBoardReply(bidx_);

			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/boastBoard.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/boastBoardReplyAction.do")) {
			
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertBoastBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/boastBoard.do?bidx=" + bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/boastBoardList.do");
			}
		} else if (command.equals("/board/communityBoard.do")) {
			System.out.println("커뮤니티 내용보기");
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.communityBoardSelectOne(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.communityBoardReply(bidx_);

			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/communityBoard.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/communityBoardReplyAction.do")) {
			
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertCommunityBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/communityBoard.do?bidx=" + bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/communityBoardList.do");
			}
		} else if (command.equals("/board/reviewBoard.do")) {
			System.out.println("칼럼 내용보기");
			
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);
			BoardDao bd = new BoardDao();
			BoardVo bv = bd.reviewBoardSelectOne(bidx_);
			ArrayList<BoardVo> alist = (ArrayList<BoardVo>) bd.reviewBoardReply(bidx_);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			request.setAttribute("bv", bv);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/reviewBoard.jsp");
			rd.forward(request, response);
		}else if (command.equals("/board/reviewBoardReplyAction.do")) {
			
			System.out.println("댓글달기");
			String rcontent = request.getParameter("rcontent");
			String ip = InetAddress.getLocalHost().getHostAddress();
			String bidx = request.getParameter("bidx");
			int bidx_ = Integer.parseInt(bidx);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			System.out.println("rcontent : " + rcontent);
			System.out.println("ip : " + ip);
			System.out.println("bidx : " + bidx_);
			System.out.println("midx : " + midx);
			
			BoardDao bd = new BoardDao();
			int value = bd.insertReviewBoardReply(rcontent, ip, midx, bidx_); 
			
			if (value == 1) {
				response.sendRedirect(request.getContextPath() + "/board/reviewBoard.do?bidx=" +bidx);
			} else {
				response.sendRedirect(request.getContextPath() + "/board/reviewBoardList.do");
			}
		} else if (command.equals("/board/myNewsWrite.do")) {

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			System.out.println("midx : " + midx);
			ArrayList<BoardVo> alist = bd.myNewsWrite(midx);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/myNewsWrite.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/myReviewWrite.do")) {

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			System.out.println("midx : " + midx);
			ArrayList<BoardVo> alist = bd.myReviewWrite(midx);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/myReviewWrite.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/myCommunityWrite.do")) {

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			System.out.println("midx : " + midx);
			ArrayList<BoardVo> alist = bd.myCommunityWrite(midx);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/myCommunityWrite.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/myHotdealWrite.do")) {

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			System.out.println("midx : " + midx);
			ArrayList<BoardVo> alist = bd.myHotdealWrite(midx);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/myHotdealWrite.jsp");
			rd.forward(request, response);
		} else if (command.equals("/board/myBoastWrite.do")) {

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDao bd = new BoardDao();
			System.out.println("midx : " + midx);
			ArrayList<BoardVo> alist = bd.myBoastWrite(midx);
			System.out.println("alist : " + alist);
			request.setAttribute("alist", alist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/myBoastWrite.jsp");
			rd.forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
