package cn.sw.project.lucene;



import java.io.IOException;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.ResultBean;
import org.apache.lucene.document.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LuceneServiceImpl implements LuceneService{

	@Autowired
	private LuceneDao dao;
	
	
	public ResultBean<Article> getResultBean(String keywords, int firstResult, int maxResult) {
		try {
			return dao.getdocumentList(keywords,firstResult,maxResult);
		}  catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void deleteIndexById(String Id) {
		dao.deleteIndexById(Id);
	}
	public void updateIndexById(Document document)  {
		try {
			dao.updateIndexById(document);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
