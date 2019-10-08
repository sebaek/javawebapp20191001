package chap09.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap09.bean.User;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext application = request.getServletContext();
		User user = new User();
		user.setId("jeju");
		user.setPassword("tkaektn");
		user.setNickName("프로도");
		
		User user2 = new User();
		user2.setId("seoul");
		user2.setPassword("xmrquftl");
		user2.setNickName("<script>document.body.style.backgroundColor = 'black';</script>");
		
		List<User> users = new ArrayList<User>();
		users.add(user);
		users.add(user2);
		
		application.setAttribute("users", users);
		
		RequestDispatcher view = request
				.getRequestDispatcher("/WEB-INF/main.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
