package com.zl.service;

import java.util.List;

import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query;
import com.zl.pojo.Query2;
import com.zl.pojo.Student;

public interface StudentService {
	/**
	 * ����ѧ����Ϣ
	 */
	public int insertStu(Student student);
	/**
	 * ��½
	 */
	public Student stuLog(Student student);
	/**
	 * ��ѯ������Ϣ
	 */
	public Student findStu(Integer stuId);
	/**
	 * �޸�
	 */
	public int updateStu(Student student);
	/**
	 * ɾ��
	 */
	public int delStu(Integer eId);
	/**
	 * ���
	 */
	public int go(Integer isGo,Integer eId);
	/**
	 * ��ҳ
	 * @param fy
	 * @return
	 */
	
	public List<Student> queryStuByFy(FenYe fy);
	/**
	 * ��ѯ��¼��
	 */
	public Integer queryRowCount(Query query);
	
	public int findName (String eName);
	
	public int upScore(Student stu);
	
	 public List<Student> queryStuByDpt(FenYe2 fy);
	 public Integer queryRowCount2(Query2 query2);
	 
	 public Student queryAllStu(Integer eId);
}
