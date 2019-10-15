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
	
	public String getTimeAgo() {
		
		String d = Duration.between(created.toInstant(), Instant.now()).toString();
		d = d.substring(2, d.lastIndexOf(".")) + "S";
		d = d.replaceFirst("H.*", "시간");
		d = d.replaceFirst("M.*", "분");
		d = d.replaceFirst("S.*", "초");
		d = d + " 전";
		
		if (d.contains("시간")) {
			String e = d.substring(0, d.lastIndexOf("시간"));
			int f = Integer.parseInt(e);
			f = f / 24;
			if (f > 0) {
				d = f + "일 전";
			}
		}
	
		return d;
	}
}






