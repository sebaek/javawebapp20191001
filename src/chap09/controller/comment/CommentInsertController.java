package chap09.controller.comment;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.Comment;
import chap09.bean.Item;
import chap09.bean.User;
import chap09.repository.CommentRepository;

/**
 * Servlet implementation class CommentInsertController
 */
@WebServlet("/comment/insert")
public class CommentInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertController() {
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
		ServletContext application = getServletContext();
		User user = (User) session.getAttribute("user");
		Item item = (Item) session.getAttribute("item");
		
		Comment comment = new Comment();
		comment.setComment(request.getParameter("comment"));
		comment.setItemId(item.getId());
		comment.setUserId(user.getId());
		
		CommentRepository repo = new CommentRepository();
		repo.setConnection(application.getAttribute("connection"));
		if (repo.addComment(comment)) {
			session.removeAttribute("comment");
		} else {
			session.setAttribute("comment", comment);
		}
		response.sendRedirect(request.getContextPath() 
				+ "/item?id=" + item.getId());
	}

}



















