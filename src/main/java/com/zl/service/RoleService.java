package com.zl.service;

import java.util.List;

import com.zl.pojo.Role;

public interface RoleService {
	public List<Role> findRoles();
	
	public Role queryRoleById(Integer rId);


}
