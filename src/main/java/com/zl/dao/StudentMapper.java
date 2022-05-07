package com.zl.dao;

import java.util.List;

import com.zl.pojo.FenYe;
import com.zl.pojo.FenYe2;
import com.zl.pojo.Query;
import com.zl.pojo.Query2;
import com.zl.pojo.Student;

public interface StudentMapper {
	/**
	 * 插入学生信息
	 */
	public int insertStu(Student student);
	/**
	 * 登陆
	 */
	public Student stuLog(Student student);
	/**
	 * 查询个人信息
	 */
	public Student findStu(Integer eId);
	/**
	 * 修改
	 */
	public int updateStu(Student student);
	/**
	 * 删除
	 */
	public int delStu(Integer stuId);
	/**
	 * 审核
	 */
	public int go(Integer isGo,Integer eId);
	/**
	 * 根据部门查
	 */
	public List<Student> findStuByDid(Integer dId);
	/**
	 * 分页
	 */
	public List<Student> queryStuByFy(FenYe fy);
	/**
	 * 查询记录数
	 */
	public Integer queryRowCount(Query query);
	/**
	 * 根据班级查新学生
	 * @param cId
	 * @return
	 */
	
	
	/**
	 * 
	 */
    public int findName (String eName);
    
    /**
     * 
     */
    public int upScore(Student stu);
/**
 * 根据部门查看
 */
    public List<Student> queryStuByDpt(FenYe2 fy);
    public Integer queryRowCount2(Query2 query2);
    
    public Student queryAllStu(Integer eId);
	
	

}
