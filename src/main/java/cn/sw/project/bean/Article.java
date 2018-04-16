package cn.sw.project.bean;

import java.util.Date;

public class Article {
	
	private Integer Id;
	private String url;
	private String title;
	private String content;
	private String author;
	private Date spiderDate;

	public Date getSpiderDate() {
		return spiderDate;
	}

	public void setSpiderDate(Date spiderDate) {
		this.spiderDate = spiderDate;
	}

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
