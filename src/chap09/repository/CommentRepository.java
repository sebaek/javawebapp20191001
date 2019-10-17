package chap09.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
	
	
}




