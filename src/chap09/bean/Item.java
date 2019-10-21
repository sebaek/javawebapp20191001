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
	private String file;
	private String nickName;
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	public String getNickName() {
		return nickName;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
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
		LocalDateTime old = LocalDateTime.ofInstant(created.toInstant(), ZoneOffset.UTC);
		LocalDateTime now = LocalDateTime.now(ZoneOffset.UTC);

		long years = ChronoUnit.YEARS.between(old, now);
		long months = ChronoUnit.MONTHS.between(old, now);
		long weeks = ChronoUnit.WEEKS.between(old, now);
		long days = ChronoUnit.DAYS.between(old, now);
		long hours = ChronoUnit.HOURS.between(old, now);
		long minutes = ChronoUnit.MINUTES.between(old, now);
		long seconds = ChronoUnit.SECONDS.between(old, now);
		
		if (years > 0) return years + "년 전";
		if (months > 0) return months + "개월 전";
		if (weeks > 0) return weeks + "주 전";
		if (days > 0) return days + "일 전";
		if (hours > 0) return hours + "시간 전";
		if (minutes > 0) return minutes + "분 전";
		if (seconds > 0) return seconds + "초 전";
		return "방금 전";
	}
}






