package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.CourseType;

public interface CourseTypeMapper {

	@Select("SELECT * FROM COURSE_TYPE WHERE ID = #{ID}")
	@ResultMap(value="courseTypeMap")
	CourseType getCourseType(@Param("ID") long id);
	
	@Select("SELECT * FROM COURSE_TYPE ORDER BY ID")
	@ResultMap(value="courseTypeMap")
	List<CourseType> getAllCourseType();
}
