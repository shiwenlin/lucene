package cn.sw.project.service;

import cn.sw.project.bean.MyArticle;
import cn.sw.project.dao.MyArticleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class MyArticleServiceImpl implements MyArticleService{

    @Autowired
    MyArticleMapper myArticleMapper;


    @Override
    public List<MyArticle> selectMyArticleList(Map<String, Object> param) {
        return  myArticleMapper.queryMyArticleList(param);
    }
}
