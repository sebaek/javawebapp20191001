package chap09.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
				+ "FROM users "
				+ "WHERE id=? "
				+ "AND password=?";
		ResultSet rs = null;
		
		try (
				PreparedStatement stmt = con.prepareStatement(sql);
				
				
				) {
			stmt.setString(1, id);
			stmt.setString(2, pw);
			
			rs = stmt.executeQuery();
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
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return null;
	}

	public boolean addUser(User user) {
		
//		String sql = "INSERT INTO users (id, password, nickname, email) "
//				+ "VALUES ("
//				+ "'" + user.getId() + "', "
//				+ "'" + user.getPassword() + "', "
//				+ "'" + user.getNickName() + "', "
//				+ "'" + user.getEmail() + "') ";
		String sql = "INSERT INTO users (id, password, nickname, email) "
				+ "VALUES (?, ?, ?, ?)";
		
		System.out.println(sql);
		
		try (
//				Statement stmt = con.createStatement();
				PreparedStatement stmt = con.prepareStatement(sql); 
				) {
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getNickName());
			stmt.setString(4, user.getEmail());
			
			int count = stmt.executeUpdate();
			
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
				+ "WHERE id=? AND password=? ";
		System.out.println(sql);
		
		try (
				PreparedStatement stmt = con.prepareStatement(sql);
				) {
			stmt.setString(1, user.getId());
			stmt.setString(2, user.getPassword());
			
			int count = stmt.executeUpdate();
			
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
				+ "id=?, "
				+ "password=?, "
				+ "nickname=?, "
				+ "email=? "
				+ "WHERE id=? AND "
				+ "password=?";
		
		System.out.println(sql);
		
		try (
				PreparedStatement stmt = con.prepareStatement(sql);
				) {
			stmt.setString(1, target.getId());
			stmt.setString(2, target.getPassword());
			stmt.setString(3, target.getNickName());
			stmt.setString(4, target.getEmail());
			
			stmt.setString(5, origin.getId());
			stmt.setString(6, origin.getPassword());
			
			int count = stmt.executeUpdate();
			
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
