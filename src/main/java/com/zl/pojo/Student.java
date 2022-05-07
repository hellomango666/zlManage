package com.zl.pojo;

import java.util.Date;

import org.springframework.context.annotation.Scope;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
public class Student {
	private Integer eId;
	private Integer eNum;
	private String eName;
	private String epwd;
	private Integer age;
	private String sex;
	private String address;
	private String phone;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date regDate;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date schoolDate;
	private Integer score1;
	private Integer score2;
	private Integer score3;
	private Integer isGo;
	private Classes classes;
	private Dept dept;
	private Role role;
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Student(Integer eId, Integer eNum, String eName, String epwd, Integer age, String sex, String address,
			String phone, Date regDate, Date schoolDate, Integer score1, Integer score2, Integer score3, Integer isGo,
			Classes classes, Dept dept, Role role) {
		super();
		this.eId = eId;
		this.eNum = eNum;
		this.eName = eName;
		this.epwd = epwd;
		this.age = age;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.regDate = regDate;
		this.schoolDate = schoolDate;
		this.score1 = score1;
		this.score2 = score2;
		this.score3 = score3;
		this.isGo = isGo;
		this.classes = classes;
		this.dept = dept;
		this.role = role;
	}

	public Integer geteId() {
		return eId;
	}

	public void seteId(Integer eId) {
		this.eId = eId;
	}

	public Integer geteNum() {
		return eNum;
	}

	public void seteNum(Integer eNum) {
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public Date getSchoolDate() {
		return schoolDate;
	}

	public void setSchoolDate(Date schoolDate) {
		this.schoolDate = schoolDate;
	}

	public Integer getScore1() {
		return score1;
	}

	public void setScore1(Integer score1) {
		this.score1 = score1;
	}

	public Integer getScore2() {
		return score2;
	}

	public void setScore2(Integer score2) {
		this.score2 = score2;
	}

	public Integer getScore3() {
		return score3;
	}

	public void setScore3(Integer score3) {
		this.score3 = score3;
	}

	public Integer getIsGo() {
		return isGo;
	}

	public void setIsGo(Integer isGo) {
		this.isGo = isGo;
	}

	public Classes getClasses() {
		return classes;
	}

	public void setClasses(Classes classes) {
		this.classes = classes;
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
		return "Student [eId=" + eId + ", eNum=" + eNum + ", eName=" + eName + ", epwd=" + epwd + ", age=" + age
				+ ", sex=" + sex + ", address=" + address + ", phone=" + phone + ", regDate=" + regDate
				+ ", schoolDate=" + schoolDate + ", score1=" + score1 + ", score2=" + score2 + ", score3=" + score3
				+ ", isGo=" + isGo + ", classes=" + classes + ", dept=" + dept + ", role=" + role + "]";
	}

	
}
