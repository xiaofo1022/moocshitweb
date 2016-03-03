package com.xiaofo1022.moocshit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.Course;
import com.xiaofo1022.moocshit.model.CourseType;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseMapper courseMapper;
	
	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	@RequestMapping(value="/allCourseType", method=RequestMethod.GET)
	@ResponseBody
	public List<CourseType> getAllCourseType() {
		return courseTypeMapper.getAllCourseType();
	}
	
	@RequestMapping(value="/addCourseType", method=RequestMethod.POST)
	@ResponseBody
	public int addCourseType(@RequestBody CourseType courseType) {
		courseTypeMapper.addCourseType(courseType);
		return courseType.getId();
	}
	
	@RequestMapping(value="/addCourse", method=RequestMethod.POST)
	@ResponseBody
	public long addCourse(@RequestBody Course course) {
		courseMapper.addCourse(course);
		return course.getId();
	}
	
	@RequestMapping(value="/allCourse", method=RequestMethod.GET)
	@ResponseBody
	public List<Course> allCourse() {
		return courseMapper.getAllCourse();
	}
}
