package com.gec.model;

import java.util.List;

import com.gec.utils.iTrace;

public class Page <T> {
	public static int recOfPage = 3;   //ÿҳ��ʾ�ļ�¼��
	public static final int btnOfPage = 5;   //ÿҳ��ʾ�İ�ť��
	
	private int totalRecs;     //�ܼ�¼��
	private int start;         //��ʼҳ
	private int end;	       //����ҳ
	private int totalPage;     //��ҳ��

	private int curPage = 1;   //��ǰҳ��
	private String keyWord;    //�����ؼ���

	private List<T> list;
	
	//����: _totalRecs �ܼ�¼��, _page ��ǰҳ
	public void setParameters(int _totalRecs, int _page){
		this.totalRecs = _totalRecs;
		this.curPage = _page;
		calurator();   //{ps} ����һ�²���
	}

	//����: �����ҳ�õ�����ز�����
	// ��: totalPage�� start�� end �ȡ�
	public void calurator(){
		//{ps} ������ҳ��
		//     ��ʽ: totalPage = Math.ceil( �ܼ�¼�� / (ÿҳ��¼��*1.0) );
		totalPage = (int)Math.ceil( this.totalRecs / (recOfPage*1.0) );
		//{ps} ���㵱ǰҳ�ֶ�
		//int curSegment = Math.ceil(��ǰҳ�� / (ÿҳ��ť��*1.0));
		int curSegment = (int)Math.ceil(curPage/(btnOfPage*1.0));
		//{ps} ��ʼλ :
		if (start<=0) {
			start = 1;
		}else{
			start = (curSegment-1)*btnOfPage +1;
		}
		
		//{ps} ����λ: 
		end = start + (btnOfPage-1);
		
		iTrace.print( "start = "+ start );
		iTrace.print( "end = "+ end );
		iTrace.print( "curSegment = "+ curSegment );
		iTrace.print( "totalPage = "+ totalPage );
		iTrace.print( "totalRecs = "+ totalRecs );
	}

	public int getTotalRecs() {
		return totalRecs;
	}
	
	//{ps} ��һҳ����
	public int getPrevPage(){
		return curPage <= 1 ? 1 : curPage-1;
	}
	//{ps} ��һҳ����
	public int getNextPage(){
		return curPage >= totalPage ? totalPage : curPage+1;
	}
	
	public int getStart() { return start; }
	public int getEnd() { return end; }
	public int getTotalPage() { return totalPage; }
	public int getCurPage() { return curPage; }
	public String getKeyWord() {
		return keyWord;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
}
