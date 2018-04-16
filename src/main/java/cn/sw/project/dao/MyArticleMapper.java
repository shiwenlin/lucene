package cn.sw.project.dao;


import cn.sw.project.bean.Article;
import cn.sw.project.bean.MyArticle;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface MyArticleMapper {



    @SelectProvider(type = MyArticleMapper.MyArticleSqlBuilder.class, method = "queryMyArticleByParams")
    @Results(id = "result", value = {
            @Result(column = "id", property = "id", javaType = Integer.class),
            @Result(property = "showIndex", column = "show_index", javaType = Boolean.class),
            @Result(property = "showPic", column = "show_pic", javaType = String.class),
            @Result(property = "showPic2", column = "show_pic2", javaType = String.class)
    })
    List<MyArticle> queryMyArticleList(Map<String, Object> params);





    class MyArticleSqlBuilder{
        public String queryMyArticleByParams(final Map<String, Object> params){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from my_article where 1=1");

            if(params.get("showIndex")!=null){
                sql.append(" and show_index = ").append(params.get("showIndex"));
            }
            if(params.get("showIndex")!=null){
                sql.append(" and hot = ").append(params.get("hot"));
            }

            sql.append(" order by createtime desc ");

            /*
            添加分页逻辑  传入相应参数才会分页查询
             */
            if (params.get("start")!=null){
                sql.append("limit ").append(params.get("start"));
            }
            if (params.get("pageSize")!=null){
                sql.append(",").append(params.get("pageSize"));
            }

            System.out.println("查询sql=="+sql.toString());
            return sql.toString();
        }

    }
}
