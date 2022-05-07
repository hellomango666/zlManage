package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class FenYe2 {
	private Integer page; //当前页
	private Integer pageSize = 3; //每页显示记录
	private Integer rowCount; // 符合要求的记录
	private Integer totalPage; // 总页数
	private Integer startRow; // 开始的记录数
	private Integer endRow; // 结束记录数
	private Query2 query2;
	
	public FenYe2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FenYe2(Integer page, Integer pageSize, Integer rowCount, Integer totalPage, Integer startRow, Integer endRow,
			Query2 query2) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.rowCount = rowCount;
		this.totalPage = totalPage;
		this.startRow = startRow;
		this.endRow = endRow;
		this.query2 = query2;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getRowCount() {
		return rowCount;
	}

	public void setRowCount(Integer rowCount) {
		this.rowCount = rowCount;
	}

	public Integer getTotalPage() {
		if(getRowCount()%getPageSize()==0) {
			totalPage = getRowCount()/getPageSize();
		}else {
			totalPage = getRowCount()/getPageSize()+1;
		}
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getStartRow() {
		startRow = (getPage()-1)*getPageSize();
		return startRow;
	}

	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}

	public Integer getEndRow() {
		endRow = getPage()*getPageSize();
		return endRow;
	}

	public void setEndRow(Integer endRow) {
		this.endRow = endRow;
	}

	public Query2 getQuery2() {
		return query2;
	}

	public void setQuery2(Query2 query2) {
		this.query2 = query2;
	}

	@Override
	public String toString() {
		return "FenYe2 [page=" + page + ", pageSize=" + pageSize + ", rowCount=" + rowCount + ", totalPage=" + totalPage
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", query2=" + query2 + "]";
	}
	
	
	
}
