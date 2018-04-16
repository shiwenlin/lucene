package cn.sw.project.lucene;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import cn.sw.project.bean.Article;
import cn.sw.project.bean.ResultBean;
import cn.sw.project.util.LuceneUtil;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.util.Version;


import org.springframework.stereotype.Repository;

/**
 * ���ڲ�������
 * @ ���� zhuwu@itcast.cn
 *
 */

@Repository
public class LuceneDao {
	
	private static IndexWriter indexWriter;
	private static IndexSearcher indexSearcher;
	/**
	 * �������
	 * @param document
	 */
	public static void addIndex(Document document){
		
		try {
			indexWriter= LuceneUtil.getIndexWriter();
			indexWriter.addDocument(document);
			indexWriter.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
		}
	}

	/**
	 * ɾ������
	 * @param Id
	 */
	public void deleteIndexById(String Id){
		//term����������С��λ������ʾ�ĵ���һ�����term����������ɣ�����ʾ�Ĵ����������������ֵ�field��
		Term term=new Term("Id",Id);
		try {
			indexWriter=LuceneUtil.getIndexWriter();//��ȡ���������Ķ���
			indexWriter.deleteDocuments(term);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		LuceneUtil.closeIndexWriter(indexWriter);//�رղ������󡣡���
		
	}
	/**
	 * �޸�����
	 * @param document
	 * @throws IOException 
	 */
	public void updateIndexById(Document document) throws IOException{
		Term term=new Term("Id",document.get("Id"));
		indexWriter=LuceneUtil.getIndexWriter();
		indexWriter.updateDocument(term, document);
		LuceneUtil.closeIndexWriter(indexWriter);
	}
	/**
	 * ��������
	 * @return
	 * @throws IOException 
	 */
	public Document findDocumentById(String Id) throws IOException{
		indexSearcher=LuceneUtil.getIndexSearcher();
		Query query=new TermQuery(new Term("Id",Id));
		TopDocs docs=indexSearcher.search(query, 1);
		ScoreDoc [] scoreDocs=docs.scoreDocs;
		Document document=null;
		for (int i = 0; i < scoreDocs.length; i++) {
			ScoreDoc scoreDoc = scoreDocs[i];
			int id=scoreDoc.doc;
			document=indexSearcher.doc(id);
		}
		return document;
	}



	/**
	 * ���ݹؼ���������ҳ������
	 * @param keywords
	 * @param firstResult
	 * @param maxResult
	 * @return
	 * @throws ParseException
	 * @throws IOException
	 */
	public ResultBean<Article> getdocumentList(String keywords, int firstResult, int maxResult) throws Exception{
		indexSearcher=LuceneUtil.getIndexSearcher();//��ȡ��������
		String [] fileds=new String []{"title","content","link","author"};//���ݶ���ֶν�������..
		//������������ѯ��,��ƴ��ѯ����....
		QueryParser parser=new MultiFieldQueryParser(Version.LUCENE_44,fileds,LuceneUtil.getAnalyzer());
		//�����ַ����õ�query ����....
		Query query=parser.parse(keywords);
		 //��ȡ���������
		ResultBean<Article> resultBean=new ResultBean<Article>();
	     TopDocs hits= indexSearcher.search(query,firstResult+maxResult);
	     resultBean.setTotal(hits.totalHits);
		 ScoreDoc [] scoreDocs=hits.scoreDocs;
		 Article article=null;
		 List<Article> list=new ArrayList<Article>();
		 Formatter formatter = new SimpleHTMLFormatter("<font color='red'>","</font>");
		 /**
		  * 
		  * int firstReslut 
		  * 
		  * int maxResult
		  * 
		  * 0,10
		  * 10,10
		  * 20,10
		  * 
		  * 
		  * 
		  */
		 
		 
		/**
		 * Scorer
		 *   * Query:ָ����ѯ����
		 *   * String field:ָ�����ĸ��ֶ��Ͻ��и�����content��ʾ�����ݵ��ֶ��Ͻ��и���
		 */
		 Scorer scorer = new QueryScorer(query,"title");
		 Highlighter highlighter = new Highlighter(formatter,scorer);
		 int endResult=Math.min(scoreDocs.length, firstResult+maxResult);
		/**
		 * ���ø���Ч��
		 * new SimpleFragmenter():ָ�����ɵ��ı��󷵻�ժҪ�Ĵ�С��Ĭ��ǰ100������
		 *      ���Դ���һ��int���͵Ĳ���������ָ��ժҪ�Ĵ�С
		 */
		int fragmenter = 200; 
		highlighter.setTextFragmenter(new SimpleFragmenter(fragmenter));
	     for(int i=firstResult;i<endResult;i++){
				//��ȡ���ݵĵ÷�
				System.out.println("�÷֣�"+scoreDocs[i].score);
				//��ȡ�������ж�Ӧ�����ݱ�ţ�Ψһ�ı�ţ�
				int doc = scoreDocs[i].doc;
				System.out.println("docid="+doc);
				//ʹ���������Ψһ��Ż�ȡ��Ӧ������Document
				Document document = indexSearcher.doc(doc);
				
				/****************************************************/
				/**
				 * ��ȡ�������ֵ
				 *   * ����1���ִ���
				 *   * ����2��String����ָ�����ĸ��ֶ������ɸ���Ч��
				 *   * ����3��String�������ĸ��ֶε�ֵ���ؽ��и���
				 *   
				 * * ����ֵ��
				 *    text�����ظ�������ı���һ��ֻ����һ���ı�
				 *       * ����и�����ֵ���ڣ�text��ֵ�ͷ��ظ������ֵ
				 *       * ���û�и�����ֵ���ڣ�text��ֵ�ͷ���null
				 */
				
				String content =highlighter.getBestFragment(LuceneUtil.getAnalyzer(), "content", document.get("content"));//ֻ�ܸ���ĳһ���ֶ�....
				String title=highlighter.getBestFragment(LuceneUtil.getAnalyzer(), "title", document.get("title"));//ֻ�ܸ���ĳһ���ֶ�....
				if(title == null){
					title = document.get("title");
					if(title!=null && title.length()>fragmenter){
						title = title.substring(0, fragmenter);
					}
				}
				if(content==null){
					content = document.get("content");
					if(content!=null && content.length()>fragmenter){
						content = content.substring(0, fragmenter);
					}
				}
				//���������ֵ��ֵ��content�ֶ�
//				document.get("content").setValue(text);
				/****************************************************/
				//��Documentת����Article����Article����ֵ
				article = new Article();
				article.setContent(content);
				article.setTitle(title);
				String link=document.get("link");
				article.setUrl(link);
				list.add(article);
	    	  }
	    resultBean.setResult(list);
		return resultBean;
	}
	
	
	public static void main(String[] args) throws Exception {
		ResultBean<Article> rs=new LuceneDao().getdocumentList("�й�", 10, 21);
		for(Article a:rs.getResult()){
			System.out.println(a.getContent());
			System.out.println(a.getTitle());
		}
		
	}
}
