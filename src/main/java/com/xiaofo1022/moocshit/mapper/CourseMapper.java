package com.xiaofo1022.moocshit.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.Course;

public interface CourseMapper {

	@Select("SELECT * FROM COURSE WHERE ID = #{ID}")
	@Results({
		@Result(id=true, property="id", column="ID"),
		@Result(property="insertDatetime", column="INSERT_DATETIME", javaType=Date.class),
		@Result(property="updateDatetime", column="UPDATE_DATETIME", javaType=Date.class),
		@Result(property="courseName", column="COURSE_NAME"),
		@Result(property="courseTypeId", column="COURSE_TYPE_ID"),
		@Result(property="courseType", column="COURSE_TYPE_ID", one=@One(select="com.xiaofo1022.moocshit.mapper.CourseTypeMapper.getCourseType")),
		@Result(property="courseVideoKey", column="COURSE_VIDEO_KEY"),
		@Result(property="courseRemark", column="COURSE_REMARK"),
		@Result(property="uploadUserId", column="UPLOAD_USER_ID")
	})
	Course getCourse(@Param("ID") long id);
}
