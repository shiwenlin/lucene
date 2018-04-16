package cn.sw.project.service;


import cn.sw.project.bean.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {
    long addArticle(Article article);

    List<Article> getArticleList(Map<String, Object> params);
}
