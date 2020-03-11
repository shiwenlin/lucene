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
 * lucene 工具类，用于获取获取操作索引的对象。
 * @ 作者 
 *
 */
public class LuceneUtil {
	//索引库的配置信息,当前版本，使用的分词器
	private static IndexWriterConfig indexWriterConfig;
	//指定分词...
	private static Analyzer analyzer=new IKAnalyzer();//使用词库分词...
	//索引存放的目录
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
	 * 获取分词器....
	 * @return
	 */
	public static Analyzer getAnalyzer(){
		
		return analyzer;
	}
	/**
	 * 获取索引操作对象。。。
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
	 * 获取索引读取对象。。。
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
	 * 关闭操作索引的对象
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
