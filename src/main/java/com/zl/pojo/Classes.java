package com.zl.pojo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Classes {
	private Integer cId;
	private String cName;
	private Integer eId;
	
	public Classes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Classes(Integer cId, String cName, Integer eId) {
		super();
		this.cId = cId;
		this.cName = cName;
		this.eId = eId;
	}

	public Integer getcId() {
		return cId;
	}

	public void setcId(Integer cId) {
		this.cId = cId;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public Integer geteId() {
		return eId;
	}

	public void seteId(Integer eId) {
		this.eId = eId;
	}

	@Override
	public String toString() {
		return "Classes [cId=" + cId + ", cName=" + cName + ", eId=" + eId + "]";
	}
	
	
	
	

}
