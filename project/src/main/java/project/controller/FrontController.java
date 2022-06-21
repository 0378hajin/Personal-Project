package project.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;



	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		String uri = request.getRequestURI();
		
		String pj = request.getContextPath();
		
		String command = uri.substring(pj.length());
		
		String[] subpath = command.split("/");
		String location = subpath[1];

		if (location.equals("main")) {
			
			System.out.println("들어옴");
			MemberController mc = new MemberController();
			mc.doGet(request, response);
			
		} else if (location.equals("board")) {
			
			BoardController bc = new BoardController();
			bc.doGet(request, response);
			
		}
		

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
