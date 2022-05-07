package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.StudentMapper;
import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query;
import com.zl.pojo.Query2;
import com.zl.pojo.Student;
import com.zl.service.ClassService;
import com.zl.service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {
	@Autowired
	private StudentMapper sm;
	@Autowired
	private ClassService cs;


	@Override
	public int insertStu(Student student) {
		return sm.insertStu(student);
	}

	@Override
	public Student stuLog(Student student) {
		return sm.stuLog(student);
	}

	@Override
	public Student findStu(Integer stuId) {
		return sm.findStu(stuId);
	}

	@Override
	public int updateStu(Student student) {
		return sm.updateStu(student);
	}

	@Override
	public int delStu(Integer eId) {
		return sm.delStu(eId);
	}

	@Override
	public int go(Integer isGo, Integer eId) {
		return sm.go(isGo, eId);
	}

	@Override
	public List<Student> queryStuByFy(FenYe fy) {
	 if(fy.getPage()==null || fy.getPage()==0) {
		 fy.setPage(1);
	 }
	 fy.setRowCount(this.queryRowCount(fy.getQuery()));
	 return sm.queryStuByFy(fy);
	}

	@Override
	public Integer queryRowCount(Query query) {
		return sm.queryRowCount(query) ;
	}

	@Override
	public int findName(String eName) {
		return sm.findName(eName);
	}

	@Override
	public int upScore(Student stu) {
		return sm.upScore(stu);
	}

	@Override
	public List<Student> queryStuByDpt(FenYe2 fy) {
		if(fy.getPage()==null || fy.getPage()==0) {
			 fy.setPage(1);
		 }
		 fy.setRowCount(this.queryRowCount2(fy.getQuery2()));
		 return sm.queryStuByDpt(fy);
	}

	@Override
	public Integer queryRowCount2(Query2 query2) {		
		return sm.queryRowCount2(query2);
	}

	@Override
	public Student queryAllStu(Integer eId) {
		return sm.queryAllStu(eId);
	}
}
