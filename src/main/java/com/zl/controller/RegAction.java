package com.zl.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.Session;
import com.zl.pojo.Classes;
import com.zl.pojo.Emp;
import com.zl.pojo.Role;
import com.zl.pojo.Student;
import com.zl.service.ClassService;
import com.zl.service.EmpService;
import com.zl.service.RoleService;
import com.zl.service.StudentService;

@Controller
@RequestMapping("/reg")
public class RegAction {
	@Autowired
	private EmpService es;
	@Autowired
	private StudentService ss;
	@Autowired
	private ClassService cs;
	@Autowired
	private RoleService rs;
	
	@RequestMapping("/doReg.do")
	@ResponseBody
	public Integer doReg(String name) {
		int a=0;
		int num1 = ss.findName(name);
		int num2 = es.findName(name);
		if(num1==1 || num2==1) {
			a=1;
		}
		return a;
	}
	
		
	@RequestMapping("/regstu.do")
	@ResponseBody
	public Integer regstu(Student stu) {
		Date now = new Date();
		stu.setRegDate(now);
		int num = ss.insertStu(stu);
		return num;
	}
	//http://localhost:8080/zlManage/login.jsp
	@RequestMapping("/regemp.do")
	@ResponseBody
	public Integer regemp(Emp emp) {
		Date now = new Date();
		emp.setRegDate(now);
		int num = es.insertEmp(emp);
		return num;
	}
	
	@RequestMapping("/findClass.do")
	@ResponseBody
	public Map<String,Object> findClass() {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Classes> cla = cs.findClasses();
		map.put("cla",cla);
		return map;
	}
	
	@RequestMapping("/findRoles.do")
	@ResponseBody
	public Map<String,Object> findRoles() {
		Map<String,Object> map = new HashMap<String,Object>();
		List<Role> list = new ArrayList<Role>();
		List<Role> roles = rs.findRoles();		
		for(Role r:roles) {
			if(r.getrId()!=100 && r.getrId()!=103) {
				list.add(r);
			}
		}
		map.put("list",list);		
		return map;
	}
	
	@RequestMapping("/stulog.do")
	@ResponseBody
   public Integer log(Student stu,HttpSession session) {
		int flag=0;
		stu = ss.stuLog(stu);
		if(stu!=null) {
			if(stu.getIsGo()==null || stu.getIsGo()==0) {
				flag=2;
			}else if(stu.getIsGo()==1) {
				flag=1;
				session.setAttribute("loginUser", stu);
			}
		}
		return flag;	   
   }
	
	@RequestMapping("/emplog.do")
	@ResponseBody
   public Integer emplog(Emp emp,HttpSession session) {
		int flag=0;
		emp=es.empLog(emp);
		if(emp!=null) {
			if(emp.getIsGo()==null || emp.getIsGo()==0) {
				flag=2;
			}else if(emp.getIsGo()==1) {
				flag=1;
				session.setAttribute("loginUser", emp);
			}
		}
		System.out.println("flag=="+flag);
		return flag;	   
   }
	
}
