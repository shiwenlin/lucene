package cn.sw.project.util;

import java.io.File;
import java.io.IOException;

import cn.sw.project.bean.Article;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;


/**
 * lucene �����࣬���ڻ�ȡ��ȡ���������Ķ���
 * @ ���� zhuwu@itcast.cn
 *
 */
public class LuceneUtil {
	//�������������Ϣ,��ǰ�汾��ʹ�õķִ���
	private static IndexWriterConfig indexWriterConfig;
	//ָ���ִ�...
	private static Analyzer analyzer=new IKAnalyzer();//ʹ�ôʿ�ִ�...
	//������ŵ�Ŀ¼
	private static Directory directory;
	private static File file=new File(cn.sw.project.util.Constants.file);
	static{
		try {
			directory=FSDirectory.open(file);
			indexWriterConfig=new IndexWriterConfig(Version.LUCENE_44,analyzer);
			indexWriterConfig.setOpenMode(OpenMode.CREATE_OR_APPEND);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * ��ȡ�ִ���....
	 * @return
	 */
	public static Analyzer getAnalyzer(){
		
		return analyzer;
	}
	/**
	 * ��ȡ�����������󡣡���
	 * @return
	 */
	public static  IndexWriter getIndexWriter(){
		IndexWriter indexWriter=null;
		try {
			 indexWriter=new IndexWriter(directory,indexWriterConfig);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return indexWriter;
		
	}
	/**
	 * ��ȡ������ȡ���󡣡���
	 * @return
	 * @throws IOException
	 */
	public static IndexSearcher getIndexSearcher(){
		IndexSearcher	indexSearcher=null;
		try {
			IndexReader indexReader = DirectoryReader.open(directory);
			indexSearcher=new IndexSearcher(indexReader);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return indexSearcher;
	}
	/**
	 * �رղ��������Ķ���
	 * @param indexWriter
	 */
	public static void closeIndexWriter(IndexWriter indexWriter) {
		if(indexWriter!=null){
			try {
				indexWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	public static Article doucmentToArticle(Document document){
		Article article=new Article();
		article.setId(Long.valueOf(document.get("Id")));
		article.setAuthor(document.get("author"));
		article.setUrl(document.get("link"));
		article.setContent(document.get("content"));
		article.setTitle(document.get("title"));
		return article;
	}
	

}
