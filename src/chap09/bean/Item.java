package chap09.bean;

import java.time.Duration;
import java.time.Instant;
import java.util.Date;

public class Item {
	private int id;
	private String title;
	private String body;
	private String userId;
	private Date created;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}
	
//	public String getTimeAgo() {
//		return Duration.between(created.toInstant(), Instant.now()).toString();
//	}
}






