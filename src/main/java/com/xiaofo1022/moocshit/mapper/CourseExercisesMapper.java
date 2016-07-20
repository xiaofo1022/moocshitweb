package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.xiaofo1022.moocshit.model.CourseExercises;

public interface CourseExercisesMapper {

  @Select("SELECT * FROM COURSE_EXERCISES WHERE COURSE_ID = #{courseId}")
  @ResultMap("courseExercisesMap")
  CourseExercises getCourseExercisesByCourseId(@Param("courseId") int courseId);
  
  @Insert("INSERT INTO course_exercises (COURSE_ID, EXERCISES_TEXT) VALUES (#{courseId}, #{exercisesText})")
  @Options(useGeneratedKeys=true)
  int addCourseExercises(CourseExercises courseExercises);
  
  @Update("UPDATE course_exercises SET EXERCISES_TEXT = '${exercisesText}' WHERE COURSE_ID = ${courseId}")
  int updateCourseExercises(@Param("exercisesText") String exercisesText, @Param("courseId") int courseId);
}
