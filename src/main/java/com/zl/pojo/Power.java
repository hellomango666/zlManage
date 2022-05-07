package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Power {
	private Integer pId;
	private Integer pNum;
	private String pName;
	private String url;
	
	public Power() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Power(Integer pId, Integer pNum, String pName, String url) {
		super();
		this.pId = pId;
		this.pNum = pNum;
		this.pName = pName;
		this.url = url;
	}

	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}

	public Integer getpNum() {
		return pNum;
	}

	public void setpNum(Integer pNum) {
		this.pNum = pNum;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	

	

}
