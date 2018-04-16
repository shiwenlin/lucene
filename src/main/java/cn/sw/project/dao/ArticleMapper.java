package cn.sw.project.dao;


import cn.sw.project.bean.Article;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.StatementType;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface ArticleMapper {

    @Insert("insert into articles (title,content,author,url,spider_date) values (#{title},#{content},#{author},#{url},#{spiderDate})")
    @Options(useGeneratedKeys = true, keyProperty = "Id")
    public int add(Article article);


    @Select("select * from articles where id = #{id}")
    @Results(id = "a", value = {
            @Result(column = "id", property = "id", javaType = Long.class),
            @Result(property = "author", column = "author", javaType = String.class),
            @Result(property = "title", column = "title", javaType = String.class)
    })
    Article queryArticleById(@Param("id") Long id);



    @DeleteProvider(type = ArticleSqlBuilder.class, method = "deleteByids")
    int deleteByIds(@Param("ids") String[] ids);


    @SelectProvider(type = ArticleSqlBuilder.class, method = "queryArticleByParams")
    List<Article> queryArticleList(Map<String, Object> params);




    class ArticleSqlBuilder{
        public String queryArticleByParams(final Map<String, Object> params){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from articles where 1=1");

            if(!StringUtils.isBlank((String)params.get("author"))){
                sql.append(" and author like '%").append((String)params.get("author")).append("%'");
            }
            if(!StringUtils.isBlank((String)params.get("title"))){
                sql.append(" and title like '%").append((String)params.get("title")).append("%'");
            }
            if(!StringUtils.isBlank((String)params.get("url"))){
                sql.append(" and url = '").append((String)params.get("url")).append("' ");
            }
            System.out.println("查询sql=="+sql.toString());
            return sql.toString();
        }


        //删除的方法
        public String deleteByids(@Param("ids") final String[] ids){
            StringBuffer sql =new StringBuffer();
            sql.append("DELETE FROM articles WHERE id in(");
            for (int i=0;i<ids.length;i++){
                if(i==ids.length-1){
                    sql.append(ids[i]);
                }else{
                    sql.append(ids[i]).append(",");
                }
            }
            sql.append(")");
            return sql.toString();
        }
    }
}
