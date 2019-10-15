package chap09.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.Item;
import chap09.bean.User;
import chap09.repository.ItemRepository;

/**
 * Servlet implementation class ItemDeleteController
 */
@WebServlet("/item/delete")
public class ItemDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Item item = (Item) session.getAttribute("item");
		User user = (User) session.getAttribute("user");
		if (user != null && item.getUserId().equals(user.getId())) {
			ItemRepository repo = new ItemRepository();
			repo.setConnection(getServletContext()
					.getAttribute("connection"));
			repo.removeItem(item);
			response.sendRedirect(request.getContextPath() + "/");
			
		} else {
			response.sendRedirect(request.getContextPath() + "/");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}




