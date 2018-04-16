package cn.sw.project.service;


import cn.sw.project.bean.Article;

import java.util.List;
import java.util.Map;

public interface ArticleService {
    int addArticle(Article article);

    List<Article> getArticleList(Map<String, Object> params);
}
