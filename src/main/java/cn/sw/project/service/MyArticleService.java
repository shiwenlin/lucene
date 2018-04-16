package cn.sw.project.service;

import cn.sw.project.bean.MyArticle;

import java.util.List;
import java.util.Map;

public interface MyArticleService {

    public List<MyArticle> selectMyArticleList(Map<String,Object> param);
}
