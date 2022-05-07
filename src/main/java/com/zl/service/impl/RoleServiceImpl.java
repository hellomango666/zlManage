package com.zl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zl.dao.RoleMapper;
import com.zl.pojo.Role;
import com.zl.service.RoleService;
@Service
public class RoleServiceImpl implements RoleService  {
	@Autowired
	private RoleMapper rm;

	@Override
	public List<Role> findRoles() {
		return rm.findRoles();
	}

	@Override
	public Role queryRoleById(Integer rId) {
		return rm.queryRoleById(rId);
	}

}
