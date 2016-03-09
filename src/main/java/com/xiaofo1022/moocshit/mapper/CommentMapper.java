package com.xiaofo1022.moocshit.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.xiaofo1022.moocshit.model.Comment;

public interface CommentMapper {

	@Insert("INSERT INTO COMMENTS (COMMENT, COMMENT_USER_ID, SCORE, COURSE_ID) VALUES (#{comment}, #{commentUserId}, #{score}, #{courseId})")
	@Options(useGeneratedKeys=true)
	int addComment(Comment comment);
	
	@Select("SELECT AVG(SCORE) FROM COMMENTS WHERE COURSE_ID = ${courseId}")
	double getCourseTotalScore(@Param("courseId") long courseId);
}
