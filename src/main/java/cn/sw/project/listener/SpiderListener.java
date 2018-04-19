package cn.sw.project.listener;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.HotTitle;
import cn.sw.project.bean.HotWord;
import cn.sw.project.bean.NewInfo;
import cn.sw.project.dao.HotTitleMapper;
import cn.sw.project.lucene.LuceneDao;
import cn.sw.project.service.ArticleService;
import cn.sw.project.service.HotWordService;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.*;

@WebListener
public class SpiderListener implements ServletContextListener {

    @Autowired
    private LuceneDao luceneDao;

    @Autowired
    ArticleService articleService;

    @Autowired
    HotWordService hotWordService;

    @Autowired
    HotTitleMapper hotTitleMapper;



    /**
     *
     * String html = "<p>An <a href='http://example.com/'><b>example</b></a> link.</p>";
     Document doc = Jsoup.parse(html);//解析HTML字符串返回一个Document实现
     Element link = doc.select("a").first();//查找第一个a元素

     String text = doc.body().text(); // "An example link"//取得字符串中的文本
     String linkHref = link.attr("href"); // "http://example.com/"//取得链接地址
     String linkText = link.text(); // "example""//取得链接地址中的文本

     String linkOuterH = link.outerHtml();
     // "<a href="http://example.com"><b>example</b></a>"
     String linkInnerH = link.html(); // "<b>example</b>"//取得链接内的html内容
     *
     *
     * @param servletContextEvent
     */

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent)  {
        /*
        从数据库查询出所有关键词 封装进map中
         */
        Map<String,Integer> keyword = new HashMap<>();
        Map<String,Object> p = new HashMap<>();
        List<HotWord> words = hotWordService.getHotWrods(p);
        for (HotWord word: words) {
            String w = word.getKeyword();
            if (keyword.containsKey(w)){
                int count = keyword.get(w);
                count++;
                keyword.put(w,count);
            }else{
                keyword.put(word.getKeyword(),word.getNum());
            }
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try{

            //in = getConnect("http://society.qq.com/");

            Map<String,NewInfo> resultMap = this.getNewsInfo("http://society.qq.com/");
            Set<String> urlSet = resultMap.keySet();


            int ios=1;
            for (String url:urlSet) {

                StringBuilder sb = new StringBuilder();
                StringBuilder contentBuilder = new StringBuilder();
                if (url.length()<8){ continue; }


                String day = url.substring(url.lastIndexOf("/")+1,url.lastIndexOf("/")+9);
                String urlNames ="https://new.qq.com/omn/"+day+url.substring(url.lastIndexOf("/"));//我要从哪里抓取数据...
                Document doc = Jsoup.connect(urlNames)
                        .header("Accept-Encoding", "gzip, deflate")
                        .userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0")
                        .maxBodySize(0)
                        .timeout(600000)
                        .get();


                //获得段落element
                Elements content = doc.getElementsByClass("one-p");


                if (content!=null&&content.size()!=0){
                    //段落处理  内容保存
                    contentBuilder.append(content.toString());
                    for (Element element:content){
                        String s = element.text();
                        sb.append(s);
                    }
                }else{
                    //待处理轮播图  先不处理
                    continue;
                }

                NewInfo info = resultMap.get(url);
                Map<String, Object> params = new HashMap<>();
                params.put("url",urlNames);
                List<Article> articles = articleService.getArticleList(params);
                if (articles!=null&&articles.size()>0){
                    continue;
                }


                Article article = new Article();
                article.setTitle(info.getTitle());
                article.setUrl(urlNames);
                article.setContent(contentBuilder.toString());
                article.setAuthor(info.getAuthor());
                article.setSpiderDate(new Date());
                if (info.getNewType()){
                    article.setNewType(1);
                    article.setImgSrc(info.getImgSrc().toArray()[0].toString());
                }else {
                    article.setNewType(0);
                    Object[] arr = info.getImgSrc().toArray();
                    article.setImgSrc(arr[0].toString());
                    article.setImgSrc2(arr[1].toString());
                    article.setImgSrc3(arr[2].toString());
                }

                String[] keywords = info.getKeywords().split(";");
                for (String k :keywords){
                    if (keyword.containsKey(k)){
                        int count = keyword.get(k);
                        count++;
                        keyword.put(k,count);
                    }else{
                        keyword.put(k,1);
                    }
                }

                article.setKeywords(info.getKeywords());



                long articleId = articleService.addArticle(article);


                //保存索引
                org.apache.lucene.document.Document document=new org.apache.lucene.document.Document();
                document.add(new StringField("Id",articleId+"", Field.Store.YES));
                document.add(new TextField("title",info.getTitle(), Field.Store.YES));
                document.add(new TextField("content",sb.toString().substring(0,100),Field.Store.YES));
                document.add(new StringField("author",info.getAuthor(),Field.Store.YES));
                document.add(new StringField("link",urlNames,Field.Store.YES));
                document.add(new StringField("date",sdf.format(new Date()),Field.Store.YES));


                System.out.println("-------------------------------------------------");
                System.out.println("新闻标题："+info.getTitle());
                System.out.println("新闻作者："+info.getAuthor());
                System.out.println("新闻关键词："+info.getKeywords());
                System.out.println("新闻内容："+contentBuilder.toString());
                System.out.println("新闻路径："+urlNames);



                //按行读取并打印
                luceneDao.addIndex(document);

            }


            Set<Map.Entry<String,Integer>> entries = keyword.entrySet();
            Iterator<Map.Entry<String,Integer>>  it = entries.iterator();
            while (it.hasNext()){
                Map.Entry<String,Integer> result = it.next();
                String key = result.getKey();
                Integer values = result.getValue();
                Map<String,Object> param = new HashMap<>();
                param.put("keyword",key);
                List<HotWord> h = hotWordService.getHotWrods(param);
                if (h!=null&&h.size()>0){
                    //更新
                    hotWordService.updateHotWord(values,key);
                }else{
                    //插入
                    HotWord hotWord = new HotWord();
                    hotWord.setNum(values);
                    hotWord.setKeyword(key);
                    hotWordService.addHotWord(hotWord);
                }

            }


        }catch (Exception e){
            e.printStackTrace();
            System.out.println(e.getMessage());

        }


    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }


    /**
     *  无用功能
     * @param url
     * @return
     * @throws Exception
     */
    private BufferedReader getConnect(String url)throws Exception{
        BufferedReader in ;
        String urlName =url;//我要从哪里抓取数据...
        URL U = new URL(urlName);
        //java.net 网络包下面的类..
        URLConnection connection = U.openConnection();
        connection.connect();

        in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
        return in;
    }


    private void saveHot(Document docs){
        Elements elements = docs.getElementsByClass("current");
        Element element = elements.get(1);
        List<Node> nodes = element.childNodes();
        Map<String,Object> param = new HashMap<>();
        for (Node node:  nodes) {
            if (node instanceof Element){
                String hotTitle = ((Element) node).getElementsByTag("a").text();
                String url = ((Element) node).getElementsByTag("a").attr("href");

                param.put("title",hotTitle);
                List<HotTitle> titles = hotTitleMapper.queryHotTitleList(param);
                if (titles==null || titles.size()==0){
                    HotTitle hotTitle1 = new HotTitle();
                    hotTitle1.setTitle(hotTitle);
                    hotTitle1.setCreateTime(new Date());
                    hotTitle1.setUrl(url);
                    hotTitleMapper.add(hotTitle1);
                }
            }
        }
    }

    /**
     * 给定腾信新闻的专题URL  然后连接，读取基本信息，保存至hashmap中
     * @param connectUrl 专题URL
     * @return 新闻基本信息结果
     * @throws Exception 连接异常
     */
    private  Map<String,NewInfo> getNewsInfo(String connectUrl) throws  Exception{
        Document docs = Jsoup.connect(connectUrl)
                .header("Accept-Encoding", "gzip, deflate")
                .userAgent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:23.0) Gecko/20100101 Firefox/23.0")
                .maxBodySize(0)
                .timeout(600000)
                .get();

        saveHot(docs);

        Elements onePicNews = docs.getElementsByClass("Q-tpList");
        Elements threePicNews = docs.getElementsByClass("Q-pList");

        Map<String,NewInfo> resultMap = new HashMap<>(onePicNews.size()+threePicNews.size());

        for (Element oneNew:onePicNews) {
            NewInfo newInfo = saveNewAsInfo(oneNew,"picto");
            newInfo.setNewType(true);
            resultMap.put(newInfo.getUrl(),newInfo);
        }

        for (Element oneNew:threePicNews) {
            NewInfo newInfo = saveNewAsInfo(oneNew,"pic");
            if (newInfo==null){
                continue;
            }
            newInfo.setNewType(false);
            if (newInfo==null){ continue; }
            resultMap.put(newInfo.getUrl(),newInfo);
        }

        return resultMap;
    }


    /**
     * 封装的一个读取html的 功能
     * @param oneNew  一条新闻对应的div
     * @param imgClass 因为腾讯新闻的新闻有一张图跟三张图的区别，并且class也有区别
     * @return 包装新闻基本信息的包装类
     */
    private NewInfo saveNewAsInfo(Element oneNew,String imgClass){
        NewInfo newInfo = new NewInfo();
        //照片element
        Elements picElements = oneNew.getElementsByClass(imgClass);
        String imgSrc ;

        if (imgClass.equals("pic")){
            if (picElements.size()==0){
                return null;
            }
            for (Element pic: picElements) {
                imgSrc = pic.getElementsByTag("img").attr("src");
                if ("".equals(imgSrc)){
                    imgSrc = pic.getElementsByTag("img").attr("_src");
                }
                newInfo.getImgSrc().add(imgSrc);
            }
           // Element pic = picElements.get(0);

        }else{

            Element pic = picElements.get(0);
            imgSrc = pic.attr("_src");
            if ("".equals(imgSrc)){
                imgSrc = pic.attr("src");
            }
            newInfo.getImgSrc().add(imgSrc);
        }


        //标题element
        Elements titleElements = oneNew.getElementsByClass("linkto");
        Element titleElement = titleElements.get(0);
        String title = titleElement.text();
        String url = titleElement.attr("href");
        newInfo.setTitle(title);
        newInfo.setUrl(url);

        //信息element
        Elements infoElemets = oneNew.getElementsByClass("info");
        Element infoElement = infoElemets.get(0);

        String author = infoElement.getElementsByClass("from").text();
        String keywords = infoElement.getElementsByClass("keywords").get(0).text();



        newInfo.setKeywords(keywords);
        newInfo.setAuthor(author);
        return newInfo;
    }
}
