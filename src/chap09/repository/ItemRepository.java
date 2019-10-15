package chap09.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import chap09.bean.Item;

public class ItemRepository {
	private Connection con;

	public void setConnection(Object con) {
		this.con = (Connection) con;
	}

	public List<Item> list() {
		String sql = "SELECT id, title, body, user_id, created " + "FROM items ORDER BY id DESC";
		List<Item> list = new ArrayList<>();

		try (Statement stmt = con.createStatement(); ResultSet rs = stmt.executeQuery(sql);) {

			while (rs.next()) {
				Item item = new Item();
				item.setId(rs.getInt(1));
				item.setTitle(rs.getString(2));
				item.setBody(rs.getString(3));
				item.setUserId(rs.getString(4));
				item.setCreated(rs.getTimestamp(5));

				list.add(item);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Item getItem(int id) {
		Item item = null;
		ResultSet rs = null;
		String sql = "SELECT id, title, body, created, user_id " + "FROM items " + "WHERE id=?";

		try (PreparedStatement pstmt = con.prepareStatement(sql);) {
			pstmt.setInt(1, id);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {

				item = new Item();
				item.setId(id);
				item.setTitle(rs.getString(2));
				item.setBody(rs.getString(3));
				item.setCreated(rs.getTimestamp(4));
				item.setUserId(rs.getString(5));

			}
			return item;
		} catch (Exception e) {
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

		return item;
	}

	public boolean addItem(Item item) {
		String sql = "INSERT INTO items (title, body, user_id) "
				+ "VALUES (?, ?, ?)";
		
		try (
			PreparedStatement pstmt
				= con.prepareStatement(sql);
				) {
			pstmt.setString(1, item.getTitle());
			pstmt.setString(2, item.getBody());
			pstmt.setString(3, item.getUserId());
			
			int count = pstmt.executeUpdate();
			
			if (count == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	public boolean updateItem(Item item) {
		String sql = "UPDATE items "
				+ "SET title=?, body=? "
				+ "WHERE id=?";
		
		try (
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setString(1, item.getTitle());
			pstmt.setString(2, item.getBody());
			pstmt.setInt(3, item.getId());
			
			int count = pstmt.executeUpdate();
			
			if (count == 1) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return false;
	}

	public void removeItem(Item item) {

		String sql = "DELETE FROM items "
				+ "WHERE id=?";
		try (
			PreparedStatement pstmt = con.prepareStatement(sql);
		) {
			pstmt.setInt(1, item.getId());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	

	
}







