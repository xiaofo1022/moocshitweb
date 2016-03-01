package com.xiaofo1022.moocshit.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.model.Course;

@Repository
public class CourseDao {

	@Autowired
	private CourseMapper dataMapper;
	
	public Course getCourse(long id) {
		return dataMapper.getCourse(id);
	}
}
