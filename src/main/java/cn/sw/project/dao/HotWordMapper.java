package cn.sw.project.dao;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.HotWord;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;


@Mapper
@Component
public interface HotWordMapper {


    @SelectProvider(type = HotWordMapper.HotWordSqlBuilder.class, method = "queryHotWordByParams")
    List<HotWord> queryHotWordsList(Map<String, Object> params);


    @Insert("insert into hot_word (keyword,num) " +
            "values (#{keyword},#{num})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int add(HotWord hotWord);

    @Update("update hot_word set num = #{num} where keyword = #{keyword}")
    void update(@Param("num") Integer num,@Param("keyword") String keyword);



    class HotWordSqlBuilder{
        public String queryHotWordByParams(final Map<String, Object> params){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from hot_word where 1=1");

            if(params.get("keyword")!=null){
                sql.append(" and keyword = ").append("'").append(params.get("keyword")).append("'");
            }


            System.out.println("查询sql=="+sql.toString());
            return sql.toString();
        }

    }
}
