package com.zl.pojo;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class Query {
	private String qName;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date qsDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date qeDate;
	private Integer eId;
	
	
	public Query() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Query(String qName, Date qsDate, Date qeDate, Integer eId) {
		super();
		this.qName = qName;
		this.qsDate = qsDate;
		this.qeDate = qeDate;
		this.eId = eId;
	}


	public String getqName() {
		return qName;
	}


	public void setqName(String qName) {
		this.qName = qName;
	}


	public Date getQsDate() {
		return qsDate;
	}


	public void setQsDate(Date qsDate) {
		this.qsDate = qsDate;
	}


	public Date getQeDate() {
		return qeDate;
	}


	public void setQeDate(Date qeDate) {
		this.qeDate = qeDate;
	}


	public Integer geteId() {
		return eId;
	}


	public void seteId(Integer eId) {
		this.eId = eId;
	}


	@Override
	public String toString() {
		return "Query [qName=" + qName + ", qsDate=" + qsDate + ", qeDate=" + qeDate + ", eId=" + eId + "]";
	}
	
	
}
