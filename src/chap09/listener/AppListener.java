package chap09.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class AppListener
 *
 */
@WebListener
public class AppListener implements ServletContextListener {

	/**
	 * Default constructor.
	 */
	public AppListener() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		Connection con = 
		 (Connection) sce.getServletContext().getAttribute("connection");
		try {
			if (con != null) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		String jdbcDriverString = application.getInitParameter("jdbcDriver");
		String dburl = application.getInitParameter("dburl");
		String dbuser = application.getInitParameter("dbuser");
		String dbpw = application.getInitParameter("dbpw");
		
		
		try {
			Class.forName(jdbcDriverString);
//			String url = "jdbc:mysql://localhost/w3schools?"
//					+ "user=root&password=admin&serverTimezone=UTC";
			
			String url = dburl + "?user=" + dbuser + "&password=" + dbpw + "&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url);
			
			sce.getServletContext()
				.setAttribute("connection", con);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}

}


















