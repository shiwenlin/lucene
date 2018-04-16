package cn.sw.project.util;

import cn.sw.project.bean.Article;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;


/**
 * ����ת���ĵ����������������ʱ�Ĺ����ࡣ
 * @ ���� zhuwu@itcast.cn
 *
 */
public class ToolUtils {
	/**
	 * �����¶���ת�����ĵ����󡣡���
	 * @param article
	 * @return
	 */
	public static Document articleToDocument(Article article){
		Document document=new Document();
		document.add(new TextField("title",article.getTitle(),Store.YES));
		document.add(new TextField("content",article.getContent(),Store.YES));
		document.add(new StringField("link",article.getUrl(),Store.YES));
		document.add(new StringField("author",article.getAuthor(),Store.YES));
		return document;
	}
	/**
	 * ���ĵ�����ת��������
	 * @param document
	 * @return
	 */
	public static Article documentToArticle(Document document){
		Article article=new Article();
		article.setId(Integer.valueOf(document.get("Id")));
		article.setAuthor(document.get("author"));
		article.setContent(document.get("content"));
		article.setUrl(document.get("link"));
		article.setTitle(document.get("title"));
		return article;
	}

}
