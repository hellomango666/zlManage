package main.java.com.zl.dao;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class Emp {
	private Integer eId;
	private String eNum;
	private String eName;
	private String epwd;
	private Integer age;
	private String sex;
	private String phone;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date hireDate;
	private Integer sal;
	private Integer isGo;
	private Dept dept;
	private Role role;
	
	public Emp() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Emp(Integer eId, String eNum, String eName, String epwd, Integer age, String sex, String phone, Date regDate,
			Date hireDate, Integer sal, Integer isGo, Dept dept, Role role) {
		super();
		this.eId = eId;
		this.eNum = eNum;
		this.eName = eName;
		this.epwd = epwd;
		this.age = age;
		this.sex = sex;
		this.phone = phone;
		this.regDate = regDate;
		this.hireDate = hireDate;
		this.sal = sal;
		this.isGo = isGo;
		this.dept = dept;
		this.role = role;
	}

	public Integer geteId() {
		return eId;
	}

	public void seteId(Integer eId) {
		this.eId = eId;
	}

	public String geteNum() {
		return eNum;
	}

	public void seteNum(String eNum) {
		this.eNum = eNum;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getEpwd() {
		return epwd;
	}

	public void setEpwd(String epwd) {
		this.epwd = epwd;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getHireDate() {
		return hireDate;
	}

	public void setHireDate(Date hireDate) {
		this.hireDate = hireDate;
	}

	public Integer getSal() {
		return sal;
	}

	public void setSal(Integer sal) {
		this.sal = sal;
	}

	public Integer getIsGo() {
		return isGo;
	}

	public void setIsGo(Integer isGo) {
		this.isGo = isGo;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "Emp [eId=" + eId + ", eNum=" + eNum + ", eName=" + eName + ", epwd=" + epwd + ", age=" + age + ", sex="
				+ sex + ", phone=" + phone + ", regDate=" + regDate + ", hireDate=" + hireDate + ", sal=" + sal
				+ ", isGo=" + isGo + ", dept=" + dept + ", role=" + role + "]";
	}
	
	
	
	
	

}
