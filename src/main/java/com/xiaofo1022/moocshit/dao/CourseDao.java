package com.xiaofo1022.moocshit.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xiaofo1022.moocshit.mapper.CommentMapper;
import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.model.Course;

@Repository
public class CourseDao {

	@Autowired
	private CourseMapper dataMapper;
	@Autowired
	private CommentMapper commentMapper;
	
	public Course getCourse(long id) {
		return dataMapper.getCourse(id);
	}
	
	public void updateCourseScore(long courseId, int score) {
		double totalScore = commentMapper.getCourseTotalScore(courseId);
		dataMapper.updateCourseScore(totalScore, courseId);
	}
}
