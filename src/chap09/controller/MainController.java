package chap09.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chap09.bean.Item;
import chap09.repository.ItemRepository;

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
		String pageStr = request.getParameter("page");
		pageStr = pageStr == null ? "1" : pageStr;
		int page = Integer.parseInt(pageStr);
		int minPage = page > 2 ? page - 2 : 1;
		int maxPage = minPage + 4;
		
		ItemRepository repo = new ItemRepository();
		repo.setConnection(getServletContext().getAttribute("connection"));
		List<Item> items = repo.list(page);
		
		request.setAttribute("minPage", minPage);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("curPage", page);
		request.setAttribute("items", items);
		
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
