package com.xiaofo1022.moocshit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.mapper.CourseTypeMapper;
import com.xiaofo1022.moocshit.model.CourseType;

@Controller
@RequestMapping("/course")
public class CourseController {

	@Autowired
	private CourseTypeMapper courseTypeMapper;
	
	@RequestMapping(value="/allCourseType", method=RequestMethod.GET)
	@ResponseBody
	public List<CourseType> getAllCourseType() {
		return courseTypeMapper.getAllCourseType();
	}
}
