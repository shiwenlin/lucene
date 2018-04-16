package cn.sw.project.controller;


import cn.sw.project.bean.Article;
import cn.sw.project.bean.PageIndex;
import cn.sw.project.bean.ResultBean;
import cn.sw.project.lucene.LuceneService;
import cn.sw.project.util.Constants;
import cn.sw.project.util.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SearchController {

    @Autowired
    private LuceneService luceneService;




    @RequestMapping("/search")
    public String search(Model model,String keywords,
                         @RequestParam(defaultValue = "1") Integer currentPage){
        int firstResult=(currentPage-1)* Constants.PAGESIZE;//从第几条开始显示...
        int maxreResult=currentPage*Constants.PAGESIZE;//到第几条结束....


        ResultBean<Article> resultBean=
                luceneService.getResultBean(keywords,firstResult,maxreResult);
        int totalPage=resultBean.getTotal()/Constants.PAGESIZE;
        /**
         *<strong>1</strong><a href="">2</a><a href="s?q=%E4%B8%AD%E5%9B%BD&pn=3&j=0&src=srp_paging">3</a>
         *<a id="snext"  href="s?q=%E4%B8%AD%E5%9B%BD&pn=2&j=0&src=srp_paging">下一页></a>
         *
         */
        System.out.println("------------------------------"+resultBean.getTotal());
        PageIndex pageIndex= PageUtils.getPageCount(currentPage.intValue(),resultBean.getTotal(), 10);
        StringBuffer buffer=new StringBuffer();
        for(int i=pageIndex.getStartPage();i<=pageIndex.getEndPage();i++){
            if(currentPage==i){
                buffer.append("<strong>").append(i).append("</strong>");
            }else{
                buffer.append("<a style='width:65px;' href='search?currentPage=").append(i).append("&keywords=").append(keywords).append("'>")
                        .append(i).append("</a>");
            }
        }
        System.out.println("date=="+buffer.toString());

        model.addAttribute("pagetotal", buffer.toString());
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("resultbean", resultBean);
        /**
         * ${resultBean.total}
         * <c:foreach var item="it"
         * document.add(field)
         * Stringfield  不分词  雾霾的
         * TextField 分词
         *
         * String keywords="雾霾的"
         * Query query=new TermQuery(new Term("title",keywords));
         * QueryParser quereyparse=new MultiQueryParser(version,String fields [] ,anlyzer);
         * Query query=quereyparse.parser(keywords); //standardAnalyzer();雾  霾   的
         *
         */
        //req.getRequestDispatcher("querylist.jsp").forward(req, resp);
        return "querylist";
    }
}
