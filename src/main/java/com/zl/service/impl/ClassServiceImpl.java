package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.ClassesMapper;
import com.zl.pojo.Classes;
import com.zl.service.ClassService;
@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	private ClassesMapper cm;

	@Override
	public List<Classes> findClasses() {
		return cm.findClasses();
	}

	@Override
	public int findClassId(Integer eId) {
		return cm.findClassId(eId);
	}

}
