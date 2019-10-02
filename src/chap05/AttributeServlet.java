package chap05;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AttributeServlet
 */
@WebServlet("/attr1")
public class AttributeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttributeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();

		Integer i = (Integer) request.getAttribute("count");
		if (i == null) {
			request.setAttribute("count", 1);
		} else {
			request.setAttribute("count", i + 1);
		}
		
		Integer j = (Integer) session.getAttribute("count");
		if (j == null) {
			session.setAttribute("count", 1);
		} else {
			session.setAttribute("count", j + 1);
		}
		
		Integer k = (Integer) application.getAttribute("count");
		if (k == null) {
			application.setAttribute("count", 1);
		} else {
			application.setAttribute("count", k + 1);
		}
		
		RequestDispatcher view = request
				.getRequestDispatcher("/chap05/attribute.jsp");
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
