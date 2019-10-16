package chap09.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import chap09.bean.Item;
import chap09.bean.User;
import chap09.repository.ItemRepository;

/**
 * Servlet implementation class ItemInsertController
 */
@WebServlet("/item/insert")
@MultipartConfig
public class ItemInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/iteminsert.jsp")
			.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext application = getServletContext();
		User user = (User) session.getAttribute("user");
		request.setCharacterEncoding("utf-8");
		Part filePart = request.getPart("file");
		String fileName = filePart.getSubmittedFileName();
		String title = request.getParameter("title");
		String body = request.getParameter("body");
		String userId = user.getId();
		
		Item item = new Item();
		item.setTitle(title);
		item.setBody(body);
		item.setUserId(userId);
		item.setFile(fileName);
		
		ItemRepository repo = new ItemRepository();
		repo.setConnection(getServletContext().getAttribute("connection"));
		if (repo.addItem(item)) {
			if (fileName.length() > 0) {
				String filePathStr = application
						.getRealPath("/image/" + item.getId());
				File filePath = new File(filePathStr);
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				filePart.write(filePathStr 
						+ File.separator + fileName);
				
				System.out.println(filePathStr);
			}
			
			response.sendRedirect(request.getContextPath() + "/");
			return;
		} else {
			System.out.println("아이템 입력 중 실패함.");
			request.setAttribute("item", item);
			request.getRequestDispatcher("/WEB-INF/iteminsert.jsp")
				.forward(request, response);
			
		}
		
	}

}





























