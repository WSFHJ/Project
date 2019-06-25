package com.gec.model;

import java.util.List;

import com.gec.utils.iTrace;

public class Page <T> {
	public static int recOfPage = 3;   //每页显示的记录数
	public static final int btnOfPage = 5;   //每页显示的按钮数
	
	private int totalRecs;     //总记录数
	private int start;         //开始页
	private int end;	       //结束页
	private int totalPage;     //总页数

	private int curPage = 1;   //当前页码
	private String keyWord;    //搜索关键字

	private List<T> list;
	
	//参数: _totalRecs 总记录数, _page 当前页
	public void setParameters(int _totalRecs, int _page){
		this.totalRecs = _totalRecs;
		this.curPage = _page;
		calurator();   //{ps} 计算一下参数
	}

	//功能: 计算分页用到的相关参数。
	// 如: totalPage、 start、 end 等。
	public void calurator(){
		//{ps} 计算总页数
		//     公式: totalPage = Math.ceil( 总记录数 / (每页记录数*1.0) );
		totalPage = (int)Math.ceil( this.totalRecs / (recOfPage*1.0) );
		//{ps} 计算当前页分段
		//int curSegment = Math.ceil(当前页码 / (每页按钮数*1.0));
		int curSegment = (int)Math.ceil(curPage/(btnOfPage*1.0));
		//{ps} 开始位 :
		if (start<=0) {
			start = 1;
		}else{
			start = (curSegment-1)*btnOfPage +1;
		}
		
		//{ps} 结束位: 
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
	
	//{ps} 上一页计算
	public int getPrevPage(){
		return curPage <= 1 ? 1 : curPage-1;
	}
	//{ps} 下一页计算
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
