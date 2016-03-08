package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.Course;

public interface CourseMapper {

	@Select("SELECT * FROM COURSE WHERE ID = #{ID}")
	@ResultMap(value="courseMap")
	Course getCourse(@Param("ID") long id);
	
	@Insert("INSERT INTO COURSE (COURSE_NAME, COURSE_TYPE_ID, COURSE_VIDEO_KEY, COURSE_REMARK, UPLOAD_USER_ID) VALUES (#{courseName}, #{courseTypeId}, #{courseVideoKey}, #{courseRemark}, #{uploadUserId})")
	@Options(useGeneratedKeys=true)
	int addCourse(Course course);
	
	@Select("SELECT * FROM COURSE ORDER BY INSERT_DATETIME DESC")
	@ResultMap(value="courseMap")
	List<Course> getAllCourse();
	
	@Select("SELECT * FROM COURSE WHERE COURSE_TYPE_ID = #{COURSE_TYPE_ID} ORDER BY INSERT_DATETIME DESC")
	@ResultMap(value="courseMap")
	List<Course> getCourseListByType(@Param("COURSE_TYPE_ID") long courseTypeId);
}
