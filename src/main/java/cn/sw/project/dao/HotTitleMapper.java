package cn.sw.project.dao;


import cn.sw.project.bean.HotTitle;
import cn.sw.project.bean.HotWord;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface HotTitleMapper {

    @SelectProvider(type = HotTitleMapper.HotTitleBuilder.class, method = "queryHotWordByParams")
    List<HotTitle> queryHotTitleList(Map<String, Object> params);


    @Insert("insert into hot_title (title,create_time,url) " +
            "values (#{title},#{createTime},#{url})")
    @Options(useGeneratedKeys = true, keyProperty = "id")
    public int add(HotTitle hotWord);

//    @Update("update hot_word set num = #{num} where keyword = #{keyword}")
//    void update(@Param("num") Integer num,@Param("keyword") String keyword);



    class HotTitleBuilder{
        public String queryHotWordByParams(final Map<String, Object> params){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from hot_title where 1=1 ");

            if(params.get("title")!=null){
                sql.append(" and title = ").append("'").append(params.get("title")).append("'");
            }

            sql.append("order by id desc limit 0,10");



            System.out.println("查询sql=="+sql.toString());
            return sql.toString();
        }

    }
}
