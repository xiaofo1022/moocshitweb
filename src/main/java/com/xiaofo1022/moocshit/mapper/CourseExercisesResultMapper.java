package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaofo1022.moocshit.model.CourseExercisesResult;

public interface CourseExercisesResultMapper {

  @Insert("INSERT INTO course_exercises_result (COURSE_ID, COURSE_PLAN_ID, USER_ID, EXERCISES_TEXT) VALUES (#{courseId}, #{coursePlanId}, #{userId}, #{exercisesText})")
  @Options(useGeneratedKeys=true)
  int addCourseExercisesResult(CourseExercisesResult courseExercisesResult);
  
  @Select("SELECT * FROM COURSE_EXERCISES_RESULT WHERE COURSE_ID = #{courseId}")
  @ResultMap("courseExercisesResultMap")
  CourseExercisesResult getCourseExercisesResultByCourseId(@Param("courseId") int courseId);
  
  @Select("SELECT * FROM COURSE_EXERCISES_RESULT WHERE COURSE_ID = #{courseId} AND USER_ID = #{userId}")
  @ResultMap("courseExercisesResultMap")
  CourseExercisesResult getCourseExercisesResultByCourseIdAndUserId(@Param("courseId") int courseId, @Param("userId") int userId);
  
  @Delete("DELETE FROM COURSE_EXERCISES_RESULT WHERE COURSE_ID = #{courseId}")
  int deleteResult(@Param("courseId") int courseId);
  
  @Select("SELECT * FROM COURSE_EXERCISES_RESULT ORDER BY INSERT_DATETIME")
  @ResultMap("courseExercisesResultMap")
  List<CourseExercisesResult> getAllResult();
  
  @Update("UPDATE COURSE_EXERCISES_RESULT SET SCORE = #{score}, IS_DONE = 1 WHERE COURSE_ID = #{courseId} AND USER_ID = #{userId}")
  int updateResult(@Param("courseId") int courseId, @Param("userId") int userId, @Param("score") int score);
}
