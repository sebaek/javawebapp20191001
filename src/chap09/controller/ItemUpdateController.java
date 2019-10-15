package chap09.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chap09.bean.Item;
import chap09.repository.ItemRepository;

/**
 * Servlet implementation class ItemUpdateController
 */
@WebServlet("/item/update")
public class ItemUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/itemupdate.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		Item originItem = (Item) session.getAttribute("item");
		ItemRepository repo = new ItemRepository();
		repo.setConnection(getServletContext().getAttribute("connection"));
		Item targetItem = new Item();
		targetItem.setId(originItem.getId());
		targetItem.setTitle(request.getParameter("title"));
		targetItem.setBody(request.getParameter("body"));
		targetItem.setUserId(originItem.getUserId());
		
		if (repo.updateItem(targetItem)) {
			response.sendRedirect(request.getContextPath() + "/");
			return;
		} else {
			request.setAttribute("item", targetItem);
			request.getRequestDispatcher("/WEB-INF/itemupdate.jsp")
			.forward(request, response);
		}
	}

}

















