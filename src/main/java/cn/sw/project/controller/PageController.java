package cn.sw.project.controller;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.HotTitle;
import cn.sw.project.bean.MyArticle;
import cn.sw.project.dao.HotTitleMapper;
import cn.sw.project.service.ArticleService;
import cn.sw.project.service.MyArticleService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class PageController {

    @Autowired
    MyArticleService myArticleService;

    @Autowired
    ArticleService articleService;

    @Autowired
    HotTitleMapper hotTitleMapper;

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
        List<HotTitle> titles = hotTitleMapper.queryHotTitleList(hotParam);

        hotParam.put("start",0);
        hotParam.put("pageSize",5);


        hotTitleMapper.queryHotTitleList(hotParam);
        /*
         * 首页加载热门文章
         */
//        hotParam.put("hot",1);
//        hotParam.put("showIndex",0);
//        List<MyArticle> hotArticle = myArticleService.selectMyArticleList(hotParam);

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

        model.addAttribute("titles",titles);
        model.addAttribute("indexArticle",indexArticle);
        model.addAttribute("otherArticle",articles);


        return "new_index";
    }


    /**
     *用户点击加载更多
     * @return
     */
    @ResponseBody
    @RequestMapping("/loadmore")
    public Map<String,Object> getMoreNews(Integer start){
        /*
        暂时用一个hashmap
         */
        Map<String,Object> params = new HashMap<>();
        params.put("start",start);
        params.put("pageSize",10);
        List<Article> articles = articleService.getArticleList(params);
        params.put("code",200);
        params.put("result",articles);
        return params;
    }

    @RequestMapping("/detail/{id}")
    public String turnArticle(@PathVariable Long id, Model model){
        Article article = articleService.getArticleById(id);
        model.addAttribute("article",article);
        return "article";
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
