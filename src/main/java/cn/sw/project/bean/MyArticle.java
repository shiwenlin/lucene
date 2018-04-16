package cn.sw.project.bean;

import cn.sw.project.util.Common;


import java.util.Date;

public class MyArticle {

    private Integer id;
    private String title;
    private String content;
    private String showPic;
    private boolean hot;
    private boolean showIndex;
    private String createTime;
    private String showPic2;

    public String getShowPic2() {
        return showPic2;
    }

    public void setShowPic2(String showPic2) {
        this.showPic2 = showPic2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getShowPic() {
        return showPic;
    }

    public void setShowPic(String showPic) {
        this.showPic = showPic;
    }

    public boolean isHot() {
        return hot;
    }

    public void setHot(boolean hot) {
        this.hot = hot;
    }

    public boolean isShowIndex() {
        return showIndex;
    }

    public void setShowIndex(boolean showIndex) {
        this.showIndex = showIndex;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = Common.sdf.format(createTime);
    }
}
