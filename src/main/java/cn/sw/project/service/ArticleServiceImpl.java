package cn.sw.project.service;

import cn.sw.project.bean.Article;
import cn.sw.project.dao.ArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleMapper articleMapper;

    @Override
    public long addArticle(Article article) {
        articleMapper.add(article);
        return article.getId();
    }

    @Override
    public List<Article> getArticleList(Map<String, Object> params) {
        return articleMapper.queryArticleList(params);
    }
}
