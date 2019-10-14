package chap09.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap09.bean.User;
import chap09.repository.UserRepository;

/**
 * Servlet implementation class SignupController
 */
@WebServlet("/signup")
public class SignupController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignupController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/signup.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setId(request.getParameter("id"));
		user.setPassword(request.getParameter("password"));
		user.setNickName(request.getParameter("nick-name"));
		user.setEmail(request.getParameter("email"));
		
		UserRepository repo = new UserRepository();
		if (repo.addUser(user)) {
			response.sendRedirect(request.getContextPath() + "/");
			System.out.println("사용자 등록 요청함");
		} else {
			request.setAttribute("user", user);
			request.setAttribute("error", "사용자 등록에 실패하였습니다.");
			request
			.getRequestDispatcher("/WEB-INF/signup.jsp")
			.forward(request, response);
		}
		
	}

}












