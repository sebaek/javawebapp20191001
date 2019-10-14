package chap09.repository;

import java.sql.Connection;
import java.sql.ResultSet;
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
		String sql = "SELECT id, title, body, user_id, created "
				+ "FROM items ORDER BY id DESC";
		List<Item> list = new ArrayList<>();
		
		try (
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
		) {
			
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
	
	
}






