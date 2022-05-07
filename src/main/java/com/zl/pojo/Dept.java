package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Dept {
	private Integer dId;
	private String dNum;
	private String dName;
	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Dept(Integer dId, String dNum, String dName) {
		super();
		this.dId = dId;
		this.dNum = dNum;
		this.dName = dName;
	}
	public Integer getdId() {
		return dId;
	}
	public void setdId(Integer dId) {
		this.dId = dId;
	}
	public String getdNum() {
		return dNum;
	}
	public void setdNum(String dNum) {
		this.dNum = dNum;
	}
	public String getdName() {
		return dName;
	}
	public void setdName(String dName) {
		this.dName = dName;
	}
	
	
	
	

}
