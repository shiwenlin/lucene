package cn.sw.project.bean;

import java.util.List;

public class ResultBean<T> {
	private int total;//�ܼ�¼��
	private List<T> result;//�����
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getResult() {
		return result;
	}
	public void setResult(List<T> result) {
		this.result = result;
	}

}
