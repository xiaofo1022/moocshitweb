package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.CourseType;

public interface CourseTypeMapper {

	@Select("SELECT * FROM COURSE_TYPE WHERE ID = #{ID}")
	@Results({
		@Result(id=true, property="id", column="ID"),
		@Result(property="typeName", column="COURSE_TYPE_NAME"),
		@Result(property="parentTypeId", column="PARENT_COURSE_TYPE_ID")
	})
	CourseType getCourseType(@Param("ID") long id);
}
