package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaofo1022.moocshit.model.User;

public interface UserMapper {

	@Select("SELECT * FROM USERS WHERE ID = #{ID}")
	@ResultMap("userMap")
	User getUser(@Param("ID") int userId);
	
	@Insert("INSERT INTO USERS (USERNAME, PASSWORD, EMAIL, PHONE, REMARK, ROLE_ID) VALUES (#{username}, #{password}, #{email}, #{phone}, #{remark}, #{roleId})")
	@Options(useGeneratedKeys=true)
	int addUser(User user);
	
	@Select("SELECT ID FROM USERS WHERE USERNAME = #{username} AND PASSWORD = #{password}")
	@ResultMap("userMap")
	User login(User user);
	
	@Update("UPDATE USERS SET USERNAME = #{username}, PASSWORD = #{password}, EMAIL = #{email}, PHONE = #{phone}, REMARK = #{remark} WHERE ID = #{id}")
	int updateUser(User user);
}
