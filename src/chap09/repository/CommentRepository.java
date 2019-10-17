package chap09.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import chap09.bean.Comment;

public class CommentRepository {
	private Connection con;
	
	public void setConnection(Object con) {
		this.con = (Connection) con;
	}

	public boolean addComment(Comment comment) {
		String sql = "INSERT INTO comments "
				+ "(comment, item_id, user_id) "
				+ "VALUES (?, ?, ?)";
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, comment.getComment());
			pstmt.setInt(2, comment.getItemId());
			pstmt.setString(3, comment.getUserId());
			
			int count = pstmt.executeUpdate();
			if (count == 1) {
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return false;
	}

	public List<Comment> list(int itemId) {
		List<Comment> list = new ArrayList<>();
		String sql = "SELECT id, comment, item_id, user_id, created "
				+ "FROM comments "
				+ "WHERE item_id=? "
				+ "ORDER BY id DESC";
		ResultSet rs = null;
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, itemId);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Comment c = new Comment();
				c.setId(rs.getInt(1));
				c.setComment(rs.getString(2));
				c.setItemId(rs.getInt(3));
				c.setUserId(rs.getString(4));
				c.setCreated(rs.getTimestamp(5));
				
				list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return list;
	}

	public void removeComment(int commentId, String userId) {
		String sql = "DELETE FROM comments "
				+ "WHERE id=? AND user_id=? ";
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, commentId);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateComment(Comment comment) {
		String sql = "UPDATE comments "
				+ "SET comment=? "
				+ "WHERE id=? AND user_id=?";
		
		try (PreparedStatement pstmt = con.prepareStatement(sql)) {
			
			pstmt.setString(1, comment.getComment());
			pstmt.setInt(2, comment.getId());
			pstmt.setString(3, comment.getUserId());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}












