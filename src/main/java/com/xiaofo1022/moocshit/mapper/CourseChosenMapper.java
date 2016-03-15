package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.CourseChosen;

public interface CourseChosenMapper {

	@Select("SELECT * FROM COURSE_CHOSEN WHERE ID = #{id}")
	@ResultMap("courseChosenMap")
	CourseChosen getCourseChosen(@Param("id") int id);
	
	@Select("SELECT COUNT(ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId} AND STUDENT_ID = #{studentId} AND IS_START = 0")
	int isChosen(@Param("coursePlanId") int coursePlanId, @Param("studentId") int studentId);
	
	@Insert("INSERT INTO COURSE_CHOSEN (COURSE_PLAN_ID, STUDENT_ID) VALUES (#{coursePlanId}, #{studentId})")
	@Options(useGeneratedKeys=true)
	int addCourseChosen(CourseChosen chosen);
	
	@Select("SELECT COUNT(ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId} AND IS_START = 0")
	int getChosenCount(@Param("coursePlanId") int coursePlanId);
}
