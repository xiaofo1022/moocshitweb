package com.xiaofo1022.moocshit.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xiaofo1022.moocshit.core.CoreUtil;
import com.xiaofo1022.moocshit.core.GlobalData;
import com.xiaofo1022.moocshit.mapper.CourseChosenMapper;
import com.xiaofo1022.moocshit.mapper.CourseMapper;
import com.xiaofo1022.moocshit.model.Course;
import com.xiaofo1022.moocshit.model.CourseChosen;
import com.xiaofo1022.moocshit.model.User;

@Controller
@RequestMapping("/chosen")
public class CourseChosenController {

	@Autowired
	private CourseMapper courseMapper;
	@Autowired
	private CourseChosenMapper chosenMapper;
	
	@RequestMapping(value="/addCourseChosen/{planId}", method=RequestMethod.POST)
	@ResponseBody
	int addCourseChosen(@PathVariable int planId, HttpServletRequest request) {
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			CourseChosen chosen = new CourseChosen();
			chosen.setCoursePlanId(planId);
			chosen.setStudentId(user.getId());
			chosenMapper.addCourseChosen(chosen);
			return chosen.getId();
		} else {
			return GlobalData.FAILURE_CODE;
		}
	}
	
	@RequestMapping(value="/startCourse", method=RequestMethod.POST)
	@ResponseBody
	int startCourse(@RequestBody CourseChosen chosen, HttpServletRequest request) {
		return chosenMapper.startCourse(chosen);
	}
	
	@RequestMapping(value="/studyComplete/{planId}", method=RequestMethod.GET)
	@ResponseBody
	int studyComplete(@PathVariable int planId, HttpServletRequest request) {
		User user = CoreUtil.getLoginUser(request);
		if (user != null) {
			List<Course> courseList = courseMapper.getCourseListByPlan(planId);
			if (courseList != null && courseList.size() > 0) {
				int studyProgress = chosenMapper.getStudyProgress(planId, user.getId());
				if (studyProgress > 0) {
					if (studyProgress < courseList.size()) {
						studyProgress = studyProgress + 1;
						chosenMapper.updateStudyProgress(planId, user.getId(), studyProgress);
					}
					Course course = courseList.get(studyProgress - 1);
					if (course != null) {
						return (int)course.getId();
					}
				}
			}
		}
		return GlobalData.FAILURE_CODE;
	}
}
