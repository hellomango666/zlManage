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
@RequestMapping("/emp")
public class empAction {
	@Autowired
	private EmpService es;
	
	//http://localhost:8080/zlManage/login.jsp
	
	
	//查看
	@RequestMapping("/findEmpDept.do")
	@ResponseBody
	public ModelAndView findEmpDept(FenYe2 fy) {
		ModelAndView mv = new ModelAndView();
		List<Emp> emps = es.queryEmpByFy(fy);
		mv.addObject("emps",emps);
		mv.addObject("dId",fy.getQuery2().getdId());
		mv.setViewName("deptemp");
		return mv;
	}
	//查找老师信息
	@RequestMapping("/findEmp.do")
	@ResponseBody
	public ModelAndView findEmp(Integer eId) {
		ModelAndView mv = new ModelAndView();
		Emp emp = es.findEmp(eId);
		mv.addObject("emp",emp);
		mv.setViewName("upemp");
		return mv;
	}
	
	@RequestMapping("/upEmp.do")
	@ResponseBody
	public Integer upEmp(Emp emp) {
		int num = es.upEmp(emp);
        System.out.println("num="+num);
        return num;
	}
	//审核
	@RequestMapping("/findEmpDept2.do")
	@ResponseBody
	public ModelAndView findEmpDept2(FenYe2 fy) {
		ModelAndView mv = new ModelAndView();
		List<Emp> emps = es.queryEmpByFy(fy);
		mv.addObject("emps",emps);
		mv.addObject("dId",fy.getQuery2().getdId());
		mv.setViewName("deptCheck");
		return mv;
	}
	
	//审核通过
		@RequestMapping("/isGo.do")
		@ResponseBody
		public Integer isGo(Integer eId,Integer g) {
			int num  = es.go(g, eId);
			System.out.println("审核=="+num);
			return num;
		}
		
		@RequestMapping("/notGo.do")
		@ResponseBody
		public Integer notGo(Integer eId,Integer g) {
			int num = es.go(g, eId);
			return num;
		}
		//查询部门主管
		//审核
		@RequestMapping("/queryManagers.do")
		@ResponseBody
		public ModelAndView queryManagers(FenYe2 fy) {
			ModelAndView mv = new ModelAndView();
			List<Emp> emps = es.queryManagers(fy);
			mv.addObject("emps",emps);
			mv.setViewName("manageCheck");
			return mv;
		}
	
}
