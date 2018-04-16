package cn.sw.project.bean;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NewInfo {

    private Set<String> imgSrc = new HashSet<>();

    private String title;

    private String author;

    private String keywords;

    private String url;

    /**
     * 区分新闻类型  true:三图新闻  false:1图新闻
     */
    private Boolean newType;


    public Set<String> getImgSrc() {
        return imgSrc;
    }

    public void setImgSrc(Set<String> imgSrc) {
        this.imgSrc = imgSrc;
    }

    public Boolean getNewType() {
        return newType;
    }

    public void setNewType(Boolean newType) {
        this.newType = newType;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }
}
