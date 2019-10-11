package chap09.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import chap09.bean.User;

public class UserRepository {

	public User getUser(String id, String pw) {
		String url = "jdbc:mysql://localhost/w3schools?"
				+ "user=root&password=admin&&serverTimezone=UTC";
		String sql = "SELECT id, password, nickname "
				+ "FROM USERS "
				+ "WHERE id='" + id + "' "
				+ "AND password='" + pw + "'";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try (Connection con = DriverManager.getConnection(url);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				
				) {
			
			if (rs.next()) {
				User user = new User();
				String rsid = rs.getString(1);
				String rspw = rs.getString(2);
				String rsnick = rs.getString(3);
				
				user.setId(rsid);
				user.setPassword(rspw);
				user.setNickName(rsnick);
				
				return user;
			} else {
				return null;
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return null;
	}
	
}
