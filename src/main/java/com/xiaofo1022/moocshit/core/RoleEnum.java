package com.xiaofo1022.moocshit.core;

public enum RoleEnum {
	STUDENT(1),
	TEACHER(2),
	ADMIN(3),
	S_ADMIN(4);
	
	private int roleId;
	
	private RoleEnum(int roleId) {
		this.roleId = roleId;
	}
	
	public String toString() {
		return String.valueOf(roleId);
	}
}
