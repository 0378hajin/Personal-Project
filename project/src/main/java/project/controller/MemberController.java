package project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.domain.MemberVo;
import project.service.MemberDao;


@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
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
		
		
		if (command.equals("/main/joinAction.do")) {
			System.out.println("들어옴");
			String memberId = request.getParameter("id");
			String memberPwd = request.getParameter("password");
			String memberNickname = request.getParameter("nickname");
			String memberMail = request.getParameter("email");
			String memberIP = InetAddress.getLocalHost().getHostAddress();
			
			MemberDao md = new MemberDao();
			int value = md.insertMember(memberId, memberPwd, memberNickname, memberMail, memberIP);
			PrintWriter out = response.getWriter();
			
			if (value == 1) {
				out.println("<script>alert('회원가입에 성공하였습니다.'); location.href = '"+request.getContextPath()+"/main/main.jsp'</script>");
			} else {
				out.println("<script>alert('다시 작성해주세요.'); location.href = '"+request.getContextPath()+"/main/join.jsp'</script>");
			}
		} else if (command.equals("/main/join.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/join.jsp");
			
			//forward 방식
			rd.forward(request, response);
		} else if (command.equals("/main/login.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/login.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/loginAction.do")) {
			
			String memberId = request.getParameter("memberid");
			String memberPwd = request.getParameter("memberpwd");
			
			
			MemberDao md = new MemberDao();
			MemberVo mv = md.login(memberId, memberPwd);
			
			HttpSession session = request.getSession();
			PrintWriter out = response.getWriter();

			if (mv != null) {
				session.setAttribute("midx", mv.getMidx());
				session.setAttribute("memberid", mv.getMemberId());
				session.setAttribute("membernickname", mv.getMemberNickname());
				session.setAttribute("writeday", mv.getWriteday());
				session.setAttribute("membermail", mv.getMemberMail());
				response.sendRedirect(request.getContextPath() + "/main/main.do");
				
			} else {
				
				out.println("<script>alert('로그인에 실패하였습니다. 아이디와 비밀번호를 확인해주세요.'); location.href = '"+request.getContextPath()+"/main/login.do'</script>");
				//response.sendRedirect(request.getContextPath() + "/main/login.do");

				
			}
			
		} else if (command.equals("/main/logout.do")) {
			HttpSession session = request.getSession();
			session.invalidate();
			
			response.sendRedirect(request.getContextPath() + "/main/main.do");
		} else if (command.equals("/main/idSearch.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/idSearch.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/idSearchAction.do")) {
			
			String membernickname = request.getParameter("membernickname");
			String membermail = request.getParameter("membermail");
			
			System.out.println("membernickname : " + membernickname);
			System.out.println("membermail : " + membermail);
			
			MemberDao md = new MemberDao();
			MemberVo mv = md.idSearch(membernickname, membermail);
			request.setAttribute("mv", mv);
			
			if(mv == null) {
				
				RequestDispatcher rd = request.getRequestDispatcher("/main/idSearch3.jsp");
				rd.forward(request, response);
				
			} else {
				
				RequestDispatcher rd = request.getRequestDispatcher("/main/idSearch2.jsp");
				rd.forward(request, response);
			
			}			
		} else if (command.equals("/main/idSearch2.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/idSearch2.jsp");
			rd.forward(request, response);
		} else if (command.equals("/maind/idSearch3.do")) {

			RequestDispatcher rd = request.getRequestDispatcher("/main/idSearch3.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/passwordSearch.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/passwordSearch.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/passwordSearchAction.do")) {
			
			String memberid = request.getParameter("memberid");
			String membermail = request.getParameter("membermail");
			
			MemberDao md = new MemberDao();
			MemberVo mv = md.pwdSearch(memberid, membermail);
			request.setAttribute("mv", mv);
			
			if(mv == null) {
				
				RequestDispatcher rd = request.getRequestDispatcher("/main/passwordSearch2.jsp");
				rd.forward(request, response);
				
			} else {
				
				RequestDispatcher rd = request.getRequestDispatcher("/main/passwordChange.jsp");
				rd.forward(request, response);
			
			}		
			
		} else if (command.equals("/main/passwordChange.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/passwordChange.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/passwordChangeAction.do")) {
			
			String midx = request.getParameter("midx");
			System.out.println("midx : " + midx);
			int midx_ = Integer.parseInt(midx);
			System.out.println("midx_ : " + midx_);
			String memberpwd = request.getParameter("memberpwd");
			
			MemberDao md = new MemberDao();
			int value = md.pwdChange(memberpwd, midx_);
			System.out.println("value : " + value);
			
			if (value == 1) {
				
				RequestDispatcher rd = request.getRequestDispatcher("/main/passwordChangeOk.jsp");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/main/passwordChangeFail.jsp");
				rd.forward(request, response);
			}
			
		} else if (command.equals("/main/passwordChangeOk.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/passwordChangeOk.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/main.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/main.jsp");
			rd.forward(request, response);
		}  else if (command.equals("/main/main2.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/main2.jsp");
			rd.forward(request, response);
		} else if (command.equals("/main/myInfo.do")) {
			HttpSession session = request.getSession();
			
			session.getAttribute("midx");
			session.getAttribute("memberid");
			session.getAttribute("membernickname");
			session.getAttribute("writeday");
			session.getAttribute("memberMail");
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/myInfo.jsp");
			rd.forward(request, response);
		} 
			
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
