package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.Role;

public interface RoleMapper {

	@Select("SELECT * FROM ROLES WHERE ID = #{ID}")
	@ResultMap(value="roleMap")
	Role getRole(@Param("ID") int roleId);
}
