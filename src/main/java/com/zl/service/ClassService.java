package com.zl.service;

import java.util.List;

import com.zl.pojo.Classes;

public interface ClassService {
	public List<Classes> findClasses();
	
	public int findClassId(Integer eId);

}
