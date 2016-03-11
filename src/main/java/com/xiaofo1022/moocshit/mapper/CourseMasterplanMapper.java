package com.xiaofo1022.moocshit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.CourseMasterplan;

public interface CourseMasterplanMapper {

	@Insert("INSERT INTO COURSE_MASTERPLAN (PLAN_NAME, PLAN_PIC_KEY, PLAN_DESCRIPTION, PLAN_TYPE, UPLOADER_ID) VALUES (#{planName}, #{planPicKey}, #{planDescription}, #{planType}, #{uploaderId})")
	@Options(useGeneratedKeys=true)
	int addCourseMasterplan(CourseMasterplan courseMasterplan);
	
	@Select("SELECT * FROM COURSE_MASTERPLAN WHERE UPLOADER_ID = #{userId} ORDER BY INSERT_DATETIME DESC")
	@ResultMap("courseMasterplanMap")
	List<CourseMasterplan> getPlanListByUser(@Param("userId") int userId);
	
	@Select("SELECT * FROM COURSE_MASTERPLAN ORDER BY INSERT_DATETIME DESC")
	@ResultMap("courseMasterplanMap")
	List<CourseMasterplan> getAllPlanList();
	
	@Select("SELECT * FROM COURSE_MASTERPLAN WHERE PLAN_TYPE = #{planType} ORDER BY INSERT_DATETIME DESC")
	@ResultMap("courseMasterplanMap")
	List<CourseMasterplan> getPlanListByType(@Param("planType") String planType);
	
	@Select("SELECT * FROM COURSE_MASTERPLAN WHERE ID = #{id}")
	@ResultMap("courseMasterplanMap")
	CourseMasterplan getCourseMasterplan(@Param("id") int id);
}
