package chap09.repository;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import chap09.bean.User;

public class UserRepository {
	private Connection con;
	
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	public void setConnection(Object con) {
		this.con = (Connection) con;
	}

	public User getUser(String id, String pw) {
		
		String sql = "SELECT id, password, nickname, email "
				+ "FROM USERS "
				+ "WHERE id='" + id + "' "
				+ "AND password='" + pw + "'";
		
		try (
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				
				
				) {
			
			if (rs.next()) {
				User user = new User();
				String rsid = rs.getString(1);
				String rspw = rs.getString(2);
				String rsnick = rs.getString(3);
				String rsemail = rs.getString(4);
				
				user.setId(rsid);
				user.setPassword(rspw);
				user.setNickName(rsnick);
				user.setEmail(rsemail);
				
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

	public boolean addUser(User user) {
		
		String sql = "INSERT INTO users (id, password, nickname, email) "
				+ "VALUES ("
				+ "'" + user.getId() + "', "
				+ "'" + user.getPassword() + "', "
				+ "'" + user.getNickName() + "', "
				+ "'" + user.getEmail() + "') ";
		
		try (
				Statement stmt = con.createStatement();
				) {
			int count = stmt.executeUpdate(sql);
			
			if (count == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return false;
	}

	public boolean removeUser(User user) {
		String sql = "DELETE FROM users "
				+ "WHERE "
				+ "id='" + user.getId() + "' AND "
				+ "password='" + user.getPassword() + "'";
		System.out.println(sql);
		
		try (
				Statement stmt = con.createStatement();
				) {
			int count = stmt.executeUpdate(sql);
			
			if (count == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return false;
	}

	public boolean updateUser(User origin, User target) {
		
		String sql = "UPDATE users "
				+ "SET "
				+ "id='" + target.getId() + "', "
				+ "password='" + target.getPassword() + "', "
				+ "nickname='" + target.getNickName() + "', "
				+ "email='" + target.getEmail() + "' "
				+ "WHERE id='" + origin.getId() + "' AND "
				+ "password='" + origin.getPassword() + "'";
		
		System.out.println(sql);
		
		try (
				Statement stmt = con.createStatement();
				) {
			int count = stmt.executeUpdate(sql);
			
			if (count == 1) {
				return true;
			} else {
				return false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return false;
	}
	
}
