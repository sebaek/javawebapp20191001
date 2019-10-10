package chap09.listener;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import chap09.bean.User;

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
		// TODO Auto-generated method stub
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext application = sce.getServletContext();
		User user = new User();
		user.setId("jeju");
		user.setPassword("tkaektn");
		user.setNickName("프로도");

		User user2 = new User();
		user2.setId("seoul");
		user2.setPassword("xmrquftl");
		user2.setNickName("시청");

		List<User> users = new ArrayList<User>();
		users.add(user);
		users.add(user2);

		application.setAttribute("users", users);
	}

}
