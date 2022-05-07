package com.zl.dao;

import java.util.List;

import com.zl.pojo.Role;

public interface RoleMapper {
	
	public List<Role> findRoles();
	
	public Role queryRoleById(Integer rId);
	
}
