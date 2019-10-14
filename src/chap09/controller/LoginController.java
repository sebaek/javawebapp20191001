package chap09.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.User;
import chap09.repository.UserRepository;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/login.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ServletContext application = request.getServletContext();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		UserRepository repo = new UserRepository();
		repo.setConnection(getServletContext()
				.getAttribute("connection"));
		User user = repo.getUser(id, pw);
		
		if (user != null) {
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/");
			return;
		} else {
			request.setAttribute("loginFailed", "사용자 정보가 없습니다.");
			String viewPath = "/WEB-INF/login.jsp";
			RequestDispatcher view = request.getRequestDispatcher(viewPath);
			view.forward(request, response);
		}


	}

}
