package cn.sw.project.lucene;


import cn.sw.project.bean.Article;
import cn.sw.project.bean.ResultBean;
import org.apache.lucene.document.Document;

/**
 * 搜索
 * @ 作者 zhuwu@itcast.cn
 *
 */
public interface LuceneService {


	/**
	 * 根据关键字搜索....
	 * @param keywords
	 * @return
	 */
	public ResultBean<Article> getResultBean(String keywords, int firstReslut, int maxResult);


	/**
	 * 删除索引根据Id
	 * @param Id
	 */
	public void deleteIndexById(String Id);
	/**
	 * 更新索引，
	 * @param document
	 */
	public void updateIndexById(Document document);
	
	

}
