package chap09.bean;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.temporal.ChronoUnit;
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
	
	public String getTimeAgoChrono() {
		LocalDateTime old = LocalDateTime.ofInstant(created.toInstant(), ZoneOffset.UTC);
		LocalDateTime now = LocalDateTime.now(ZoneOffset.UTC);
		System.out.println(old);
		System.out.println(now);
		long years = ChronoUnit.YEARS.between(old, now);
		long months = ChronoUnit.YEARS.between(old, now);
		long weeks = ChronoUnit.YEARS.between(old, now);
		long days = ChronoUnit.YEARS.between(old, now);
		long hours = ChronoUnit.YEARS.between(old, now);
		long minutes = ChronoUnit.YEARS.between(old, now);
		long seconds = ChronoUnit.YEARS.between(old, now);
		
		if (years > 0) return years + "년 전";
		if (months > 0) return years + "개월 전";
		if (weeks > 0) return years + "주 전";
		if (days > 0) return years + "일 전";
		if (hours > 0) return years + "시간 전";
		if (minutes > 0) return years + "분 전";
		if (seconds > 0) return years + "초 전";
		return seconds + "";
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






