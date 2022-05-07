package com.zl.pojo;

import java.util.List;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class Role {
	private Integer rId;
	private Integer rNum;
	private String rName;
	private List<Power> powers;
	
	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Role(Integer rId, Integer rNum, String rName, List<Power> powers) {
		super();
		this.rId = rId;
		this.rNum = rNum;
		this.rName = rName;
		this.powers = powers;
	}

	public Integer getrId() {
		return rId;
	}

	public void setrId(Integer rId) {
		this.rId = rId;
	}

	public Integer getrNum() {
		return rNum;
	}

	public void setrNum(Integer rNum) {
		this.rNum = rNum;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public List<Power> getPowers() {
		return powers;
	}

	public void setPowers(List<Power> powers) {
		this.powers = powers;
	}

	@Override
	public String toString() {
		return "Role [rId=" + rId + ", rNum=" + rNum + ", rName=" + rName + ", powers=" + powers + "]";
	}
	
	
	
}
