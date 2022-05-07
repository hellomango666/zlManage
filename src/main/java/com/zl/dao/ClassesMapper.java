package com.zl.dao;

import java.util.List;

import com.zl.pojo.Classes;

public interface ClassesMapper {
	
	public int findClassId(Integer eId);
	
	public List<Classes> findClasses();
	
	

}
