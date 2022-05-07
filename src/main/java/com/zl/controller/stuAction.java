package com.zl.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zl.pojo.Classes;
import com.zl.pojo.Emp;
import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query;
import com.zl.pojo.Student;
import com.zl.service.ClassService;
import com.zl.service.EmpService;
import com.zl.service.RoleService;
import com.zl.service.StudentService;

@Controller
@RequestMapping("/stu")
public class stuAction {
	@Autowired
	private EmpService es;
	@Autowired
	private StudentService ss;
	@Autowired
	private ClassService cs;
	@Autowired
	private RoleService rs;
	
	//http://localhost:8080/zlManage/login.jsp
	@RequestMapping("/upStu.do")
	@ResponseBody
	public Integer upStu(Student stu) {		
		int num = ss.updateStu(stu);
		return num;
	}
	//员工修改
	@RequestMapping("/upEmp.do")
	@ResponseBody
	public Integer upEmp(Emp emp) {
		int num = es.updateEmp(emp);
		return num;
	}
	
	//查看班级学生
	@RequestMapping("/findByClass.do")
	@ResponseBody
	public ModelAndView findByClass(FenYe fy) {
		ModelAndView mv = new ModelAndView();
		List<Student> stus = ss.queryStuByFy(fy);
		mv.addObject("stus",stus);
		mv.addObject("eId",fy.getQuery().geteId());
		mv.setViewName("class");
		return mv;
	}
	
	//修改学生信息
	@RequestMapping("/upScore.do")
	@ResponseBody
	public Integer upScore(Student stu) {
		System.out.println("stu888=="+stu);
		int num = ss.upScore(stu);
		System.out.println("num=="+num);
		return num ;
	}
	
	//查找学生个人信息
	@RequestMapping("/findStuById.do")
	@ResponseBody
	public ModelAndView findStuById(Integer eId,Integer rId) {
		ModelAndView mv = new ModelAndView();
		if(rId==100) {
			Student stu = ss.queryAllStu(eId);
			mv.addObject("user",stu);
		}else {
			Emp emp = es.findEmp(eId);
			mv.addObject("user",emp);
		}
		mv.setViewName("per");
		return mv;
	}
	//查看个人资料
	
	
	//审核通过
	@RequestMapping("/isGo.do")
	@ResponseBody
	public Integer isGo(Integer eId,Integer g) {
		int num  = ss.go(g, eId);
		return num;
	}
	
	@RequestMapping("/notGo.do")
	@ResponseBody
	public Integer notGo(Integer eId,Integer g) {
		int num = ss.go(g, eId);
		System.out.println("审核=="+num);
		return num;
	}
	//根据部门查找
	
	@RequestMapping("/findStuByDept.do")
	@ResponseBody
	public ModelAndView findStuByDept(FenYe2 fy) {
		ModelAndView mv = new ModelAndView();	
		List<Student> stus = ss.queryStuByDpt(fy);
		List<Classes> clas = cs.findClasses();
		mv.addObject("stus",stus);
		mv.addObject("dId",fy.getQuery2().getdId());
		mv.addObject("clas",clas);
		mv.setViewName("deptstu");
		return mv;
	}
	//删除学生
	@RequestMapping("/delStu.do")
	public String delStu(Integer eId,HttpSession session){
		Emp emp = (Emp) session.getAttribute("loginUser");
		int did = emp.getDept().getdId();
		int num = ss.delStu(eId);
		System.out.println("删除=="+111);
		return "forward:findStuByDept.do?query2.dId="+did;
	}
	
	//查看班级学生
		@RequestMapping("/findByClass2.do")
		@ResponseBody
		public ModelAndView findByClass2(FenYe fy) {
			ModelAndView mv = new ModelAndView();
			List<Student> stus = ss.queryStuByFy(fy);
			mv.addObject("stus",stus);
			mv.addObject("eId",fy.getQuery().geteId());
			mv.setViewName("tcheck");
			return mv;
		}
	
}
