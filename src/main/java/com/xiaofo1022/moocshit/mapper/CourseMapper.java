package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaofo1022.moocshit.model.Course;

public interface CourseMapper {

	@Select("SELECT * FROM COURSE WHERE ID = #{ID}")
	@ResultMap(value="courseMap")
	Course getCourse(@Param("ID") long id);
	
	@Insert("INSERT INTO COURSE (COURSE_NAME, COURSE_PLAN_ID, COURSE_VIDEO_KEY, COURSE_REMARK, UPLOAD_USER_ID, COURSE_INDEX) VALUES (#{courseName}, #{coursePlanId}, #{courseVideoKey}, #{courseRemark}, #{uploadUserId}, #{courseIndex})")
	@Options(useGeneratedKeys=true)
	int addCourse(Course course);
	
	@Select("SELECT * FROM COURSE ORDER BY INSERT_DATETIME DESC")
	@ResultMap(value="courseMap")
	List<Course> getAllCourse();
	
	@Update("UPDATE COURSE SET TOTAL_SCORE = ${totalScore} WHERE ID = ${id}")
	int updateCourseScore(@Param("totalScore") double totalScore, @Param("id") long id);
	
	@Update("UPDATE COURSE SET PLAY_TIMES = (PLAY_TIMES + 1) WHERE ID = ${id}")
	void addPlayTimes(@Param("id") long courseId);
	
	@Select("SELECT * FROM COURSE ORDER BY PLAY_TIMES DESC LIMIT 0, 3")
	@ResultMap(value="courseMap")
	List<Course> getHotestCourseList();
	
	@Select("SELECT * FROM COURSE ORDER BY TOTAL_SCORE DESC LIMIT 0, 3")
	@ResultMap(value="courseMap")
	List<Course> getBestCourseList();
	
	@Select("SELECT * FROM COURSE ORDER BY UPDATE_DATETIME DESC LIMIT 0, 3")
	@ResultMap(value="courseMap")
	List<Course> getLatestCourseList();
}
