package chap09.controller.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.Item;
import chap09.bean.User;
import chap09.repository.CommentRepository;

/**
 * Servlet implementation class CommentDeleteController
 */
@WebServlet("/comment/delete")
public class CommentDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Item item = (Item) session.getAttribute("item");
		int commentId = Integer.parseInt(request.getParameter("id"));
		CommentRepository repo = new CommentRepository();
		repo.setConnection(getServletContext()
				.getAttribute("connection"));
		repo.removeComment(commentId, user.getId());
		
		response.sendRedirect(request.getContextPath() 
				+ "/item?id=" + item.getId());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
