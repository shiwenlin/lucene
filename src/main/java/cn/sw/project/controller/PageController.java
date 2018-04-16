package cn.sw.project.controller;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.MyArticle;
import cn.sw.project.service.ArticleService;
import cn.sw.project.service.MyArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PageController {

    @Autowired
    MyArticleService myArticleService;

    @Autowired
    ArticleService articleService;

    /**
     * 首页
     * @param model
     * @return
     */
    @RequestMapping("/")
    public String turnNewIndexPage(Model model){
        /*
        创建查询参数
         */
        Map<String,Object> hotParam = new HashMap<>(16);
        hotParam.put("start",0);
        hotParam.put("pageSize",5);

        /*
         * 首页加载热门文章
         */
        hotParam.put("hot",1);
        hotParam.put("showIndex",0);
        List<MyArticle> hotArticle = myArticleService.selectMyArticleList(hotParam);

        /*
        首页加载轮播图文章
         */
        hotParam.put("hot",0);
        hotParam.put("showIndex",1);
        List<MyArticle> indexArticle = myArticleService.selectMyArticleList(hotParam);

        /*
        首页加载普通文章
         */
        Map<String,Object> params = new HashMap<>();
        params.put("start",0);
        params.put("pageSize",10);
        List<Article> articles = articleService.getArticleList(params);

        model.addAttribute("hotArticle",hotArticle);
        model.addAttribute("indexArticle",indexArticle);
        model.addAttribute("otherArticle",articles);


        return "new_index";
    }


    /**
     * 跳转搜索页面
     * @return
     */
    @GetMapping("/searchPage")
    public String turnSearchPage(){
        return "index";
    }


    /**
     * 跳转联系我页面
     * @return
     */
    @GetMapping("/contactMe")
    public String contactMe(){
        return "contact";
    }

    /**
     * /{id}
     * @PathVariable String id
     * @param
     * @return
     */
    @RequestMapping("/article")
    public String showArticle(){

        return "article";
    }
}
