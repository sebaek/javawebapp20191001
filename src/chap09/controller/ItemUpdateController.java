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
import chap09.repository.ItemRepository;

/**
 * Servlet implementation class ItemUpdateController
 */
@WebServlet("/item/update")
@MultipartConfig
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
		ServletContext application = getServletContext();
		Part filePart = request.getPart("file");
		String updateOrRemove = request.getParameter("file-update");
		
		Item originItem = (Item) session.getAttribute("item");
		ItemRepository repo = new ItemRepository();
		repo.setConnection(getServletContext().getAttribute("connection"));
		Item targetItem = new Item();
		targetItem.setId(originItem.getId());
		targetItem.setTitle(request.getParameter("title"));
		targetItem.setBody(request.getParameter("body"));
		targetItem.setUserId(originItem.getUserId());
		
		if (updateOrRemove.equals("remove")) {
			targetItem.setFile("");
			
			String path = application.getRealPath(
					"/image/" + originItem.getId());
			File folder = new File(path);
			File[] files = folder.listFiles();
			if (files != null) {
				for (File file : files) {
					file.delete();
				}
			}
			folder.delete();
			
		} else {
			String fileName = filePart.getSubmittedFileName();
			if (fileName.length() > 0) {
				targetItem.setFile(fileName);
				String filePathStr = application
						.getRealPath("/image/" + originItem.getId());
				File filePath = new File(filePathStr);
				if (!filePath.exists()) {
					filePath.mkdirs();
				}
				filePart.write(filePathStr 
						+ File.separator + fileName);
				
				System.out.println(filePathStr);
			} else {
				targetItem.setFile(originItem.getFile());
			}
		}
		
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

















