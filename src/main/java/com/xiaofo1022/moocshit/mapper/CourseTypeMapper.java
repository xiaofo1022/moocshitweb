package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.CourseType;

public interface CourseTypeMapper {

	@Select("SELECT * FROM COURSE_TYPE WHERE ID = #{ID}")
	@ResultMap(value="courseTypeMap")
	CourseType getCourseType(@Param("ID") long id);
	
	@Select("SELECT DISTINCT(PLAN_TYPE) AS COURSE_TYPE_NAME FROM COURSE_MASTERPLAN")
	@ResultMap(value="courseTypeMap")
	List<CourseType> getAllCourseType();
	
	@Insert("INSERT INTO COURSE_TYPE (COURSE_TYPE_NAME) VALUES (#{typeName})")
	@Options(useGeneratedKeys=true)
	int addCourseType(CourseType courseType);
}
