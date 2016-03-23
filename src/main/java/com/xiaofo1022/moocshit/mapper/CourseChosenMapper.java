package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaofo1022.moocshit.model.CourseChosen;

public interface CourseChosenMapper {

	@Select("SELECT * FROM COURSE_CHOSEN WHERE ID = #{id}")
	@ResultMap("courseChosenMap")
	CourseChosen getCourseChosen(@Param("id") int id);
	
	@Select("SELECT COUNT(ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId} AND STUDENT_ID = #{studentId} AND IS_START = 0")
	int isChosen(@Param("coursePlanId") int coursePlanId, @Param("studentId") int studentId);
	
	@Select("SELECT COUNT(ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId} AND STUDENT_ID = #{studentId} AND IS_START = 1")
	int isStart(@Param("coursePlanId") int coursePlanId, @Param("studentId") int studentId);
	
	@Insert("INSERT INTO COURSE_CHOSEN (COURSE_PLAN_ID, STUDENT_ID) VALUES (#{coursePlanId}, #{studentId})")
	@Options(useGeneratedKeys=true)
	int addCourseChosen(CourseChosen chosen);
	
	@Select("SELECT COUNT(STUDENT_ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId} AND IS_START = #{isStart}")
	int getChosenCount(@Param("coursePlanId") int coursePlanId, @Param("isStart") int isStart);
	
	@Select("SELECT COUNT(STUDENT_ID) FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{coursePlanId}")
	int getStudentCount(@Param("coursePlanId") int coursePlanId);
	
	@Select("SELECT * FROM COURSE_CHOSEN GROUP BY COURSE_PLAN_ID, IS_START ORDER BY INSERT_DATETIME")
	@ResultMap("courseChosenMap")
	List<CourseChosen> getChosenStatusList();
	
	@Select("SELECT * FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{planId} AND IS_START = 1")
	@ResultMap("courseChosenMap")
	List<CourseChosen> getChosenListByPlan(@Param("planId") int planId);
	
	@Update("UPDATE COURSE_CHOSEN SET IS_START = 1, DEAD_LINE_DATE = #{deadLineDate} WHERE COURSE_PLAN_ID = #{coursePlanId} AND IS_START = 0")
	int startCourse(CourseChosen chosen);
	
	@Select("SELECT STUDY_PROGRESS FROM COURSE_CHOSEN WHERE COURSE_PLAN_ID = #{planId} AND STUDENT_ID = #{studentId} AND IS_START = 1")
	int getStudyProgress(@Param("planId") int planId, @Param("studentId") int studentId);
	
	@Update("UPDATE COURSE_CHOSEN SET STUDY_PROGRESS = #{studyProgress} WHERE COURSE_PLAN_ID = #{planId} AND STUDENT_ID = #{studentId}")
	int updateStudyProgress(@Param("planId") int planId, @Param("studentId") int studentId, @Param("studyProgress") int studyProgress);

	@Select("SELECT DISTINCT(COURSE_PLAN_ID) FROM COURSE_CHOSEN WHERE IS_START = 1")
	List<Integer> getStudyPlanIdList();
}
