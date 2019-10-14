package chap09.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.User;
import chap09.repository.UserRepository;

/**
 * Servlet implementation class UpdateController
 */
@WebServlet("/update")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		User origin = (User) session.getAttribute("user");
		User target = new User();
		target.setId(origin.getId());
		target.setPassword(request.getParameter("password"));
		target.setNickName(request.getParameter("nick-name"));
		target.setEmail(request.getParameter("email"));
		
		UserRepository repo = new UserRepository();
		if (repo.updateUser(origin, target)) {
			session.setAttribute("user", target);
			response
			.sendRedirect(request.getContextPath() + "/userinfo.jsp");
		} else {
			session.setAttribute("error", "변경되지 않았습니다");
			response
			.sendRedirect(request.getContextPath() + "/userinfo.jsp");
		}
	}

}









